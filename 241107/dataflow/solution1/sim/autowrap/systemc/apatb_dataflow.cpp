#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_input_r "../tv/cdatafile/c.dataflow.autotvin_input_r.dat"
#define AUTOTB_TVOUT_input_r "../tv/cdatafile/c.dataflow.autotvout_input_r.dat"
#define AUTOTB_TVIN_weight "../tv/cdatafile/c.dataflow.autotvin_weight.dat"
#define AUTOTB_TVOUT_weight "../tv/cdatafile/c.dataflow.autotvout_weight.dat"
#define AUTOTB_TVIN_output_r "../tv/cdatafile/c.dataflow.autotvin_output_r.dat"
#define AUTOTB_TVOUT_output_r "../tv/cdatafile/c.dataflow.autotvout_output_r.dat"
#define AUTOTB_TVIN_gmem0 "../tv/cdatafile/c.dataflow.autotvin_gmem0.dat"
#define AUTOTB_TVOUT_gmem0 "../tv/cdatafile/c.dataflow.autotvout_gmem0.dat"
#define AUTOTB_TVIN_gmem1 "../tv/cdatafile/c.dataflow.autotvin_gmem1.dat"
#define AUTOTB_TVOUT_gmem1 "../tv/cdatafile/c.dataflow.autotvout_gmem1.dat"
#define AUTOTB_TVIN_gmem2 "../tv/cdatafile/c.dataflow.autotvin_gmem2.dat"
#define AUTOTB_TVOUT_gmem2 "../tv/cdatafile/c.dataflow.autotvout_gmem2.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_input_r "../tv/rtldatafile/rtl.dataflow.autotvout_input_r.dat"
#define AUTOTB_TVOUT_PC_weight "../tv/rtldatafile/rtl.dataflow.autotvout_weight.dat"
#define AUTOTB_TVOUT_PC_output_r "../tv/rtldatafile/rtl.dataflow.autotvout_output_r.dat"
#define AUTOTB_TVOUT_PC_gmem0 "../tv/rtldatafile/rtl.dataflow.autotvout_gmem0.dat"
#define AUTOTB_TVOUT_PC_gmem1 "../tv/rtldatafile/rtl.dataflow.autotvout_gmem1.dat"
#define AUTOTB_TVOUT_PC_gmem2 "../tv/rtldatafile/rtl.dataflow.autotvout_gmem2.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  input_r_depth = 0;
  weight_depth = 0;
  output_r_depth = 0;
  gmem0_depth = 0;
  gmem1_depth = 0;
  gmem2_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{input_r " << input_r_depth << "}\n";
  total_list << "{weight " << weight_depth << "}\n";
  total_list << "{output_r " << output_r_depth << "}\n";
  total_list << "{gmem0 " << gmem0_depth << "}\n";
  total_list << "{gmem1 " << gmem1_depth << "}\n";
  total_list << "{gmem2 " << gmem2_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int input_r_depth;
    int weight_depth;
    int output_r_depth;
    int gmem0_depth;
    int gmem1_depth;
    int gmem2_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


extern "C" void dataflow_hw_stub_wrapper(volatile void *, volatile void *, volatile void *);

extern "C" void apatb_dataflow_hw(volatile void * __xlx_apatb_param_input_r, volatile void * __xlx_apatb_param_weight, volatile void * __xlx_apatb_param_output_r) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
#ifdef USE_BINARY_TV_FILE
{
transaction<64> tr(32);
aesl_fh.read(AUTOTB_TVOUT_PC_gmem1, tr.p, tr.tbytes);
if (little_endian()) { tr.reorder(); }
tr.send<8>((char*)__xlx_apatb_param_output_r, 32, 0);
}
#else
try {
static PostCheck<64> pc(AUTOTB_TVOUT_PC_gmem1);
pc.psize = 8;
pc.param = (char*)__xlx_apatb_param_output_r;
pc.depth = 32;
pc.run(AESL_transaction_pc, 0);
} catch (SimException &e) {
  std::cout << "at line " << e.line << " occurred exception, " << e.msg << "\n";
}
#endif

    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_input_r = 0;
unsigned __xlx_offset_byte_param_weight = 0;
unsigned __xlx_offset_byte_param_output_r = 0;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_gmem0, 'b');
transaction<8> tr(64);
__xlx_offset_byte_param_input_r = 0*1;
if (__xlx_apatb_param_input_r) {
  tr.import<1>((char*)__xlx_apatb_param_input_r, 64, 0);
}
aesl_fh.write(AUTOTB_TVIN_gmem0, tr.p, tr.tbytes);
tcl_file.set_num(64, &tcl_file.gmem0_depth);
}
#else
aesl_fh.touch(AUTOTB_TVIN_gmem0);
{
aesl_fh.write(AUTOTB_TVIN_gmem0, begin_str(AESL_transaction));
__xlx_offset_byte_param_input_r = 0*1;
if (__xlx_apatb_param_input_r) {
for (size_t i = 0; i < 64; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_input_r + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVIN_gmem0, s);
}
}
tcl_file.set_num(64, &tcl_file.gmem0_depth);
aesl_fh.write(AUTOTB_TVIN_gmem0, end_str());
}
#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_gmem1, 'b');
transaction<64> tr(32);
__xlx_offset_byte_param_output_r = 0*8;
if (__xlx_apatb_param_output_r) {
  tr.import<8>((char*)__xlx_apatb_param_output_r, 32, 0);
}
aesl_fh.write(AUTOTB_TVIN_gmem1, tr.p, tr.tbytes);
tcl_file.set_num(32, &tcl_file.gmem1_depth);
}
#else
aesl_fh.touch(AUTOTB_TVIN_gmem1);
{
aesl_fh.write(AUTOTB_TVIN_gmem1, begin_str(AESL_transaction));
__xlx_offset_byte_param_output_r = 0*8;
if (__xlx_apatb_param_output_r) {
for (size_t i = 0; i < 32; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_output_r + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVIN_gmem1, s);
}
}
tcl_file.set_num(32, &tcl_file.gmem1_depth);
aesl_fh.write(AUTOTB_TVIN_gmem1, end_str());
}
#endif
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVIN_gmem2, 'b');
transaction<8> tr(64);
__xlx_offset_byte_param_weight = 0*1;
if (__xlx_apatb_param_weight) {
  tr.import<1>((char*)__xlx_apatb_param_weight, 64, 0);
}
aesl_fh.write(AUTOTB_TVIN_gmem2, tr.p, tr.tbytes);
tcl_file.set_num(64, &tcl_file.gmem2_depth);
}
#else
aesl_fh.touch(AUTOTB_TVIN_gmem2);
{
aesl_fh.write(AUTOTB_TVIN_gmem2, begin_str(AESL_transaction));
__xlx_offset_byte_param_weight = 0*1;
if (__xlx_apatb_param_weight) {
for (size_t i = 0; i < 64; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_weight + i * 1;
std::string s = formatData(pos, 8);
aesl_fh.write(AUTOTB_TVIN_gmem2, s);
}
}
tcl_file.set_num(64, &tcl_file.gmem2_depth);
aesl_fh.write(AUTOTB_TVIN_gmem2, end_str());
}
#endif
// print input_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_input_r, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_offset_byte_param_input_r;
aesl_fh.write(AUTOTB_TVIN_input_r, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.input_r_depth);
aesl_fh.write(AUTOTB_TVIN_input_r, end_str());
}

// print weight Transactions
{
aesl_fh.write(AUTOTB_TVIN_weight, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_offset_byte_param_weight;
aesl_fh.write(AUTOTB_TVIN_weight, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.weight_depth);
aesl_fh.write(AUTOTB_TVIN_weight, end_str());
}

// print output_r Transactions
{
aesl_fh.write(AUTOTB_TVIN_output_r, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)&__xlx_offset_byte_param_output_r;
aesl_fh.write(AUTOTB_TVIN_output_r, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.output_r_depth);
aesl_fh.write(AUTOTB_TVIN_output_r, end_str());
}

CodeState = CALL_C_DUT;
dataflow_hw_stub_wrapper(__xlx_apatb_param_input_r, __xlx_apatb_param_weight, __xlx_apatb_param_output_r);
CodeState = DUMP_OUTPUTS;
#ifdef USE_BINARY_TV_FILE
{
aesl_fh.touch(AUTOTB_TVOUT_gmem1, 'b');
transaction<64> tr(32);
__xlx_offset_byte_param_output_r = 0*8;
if (__xlx_apatb_param_output_r) {
  tr.import<8>((char*)__xlx_apatb_param_output_r, 32, 0);
}
aesl_fh.write(AUTOTB_TVOUT_gmem1, tr.p, tr.tbytes);
tcl_file.set_num(32, &tcl_file.gmem1_depth);
}
#else
aesl_fh.touch(AUTOTB_TVOUT_gmem1);
{
aesl_fh.write(AUTOTB_TVOUT_gmem1, begin_str(AESL_transaction));
__xlx_offset_byte_param_output_r = 0*8;
if (__xlx_apatb_param_output_r) {
for (size_t i = 0; i < 32; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_output_r + i * 8;
std::string s = formatData(pos, 64);
aesl_fh.write(AUTOTB_TVOUT_gmem1, s);
}
}
tcl_file.set_num(32, &tcl_file.gmem1_depth);
aesl_fh.write(AUTOTB_TVOUT_gmem1, end_str());
}
#endif
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
