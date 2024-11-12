#ifndef _TB_H
#define _TB_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

 // do not include these headers for host program, may cause compilation ERROR
// #ifndef XILINX
// #include "ap_axi_sdata.h"
// #include "ap_int.h"
// #include "hls_stream.h"
// #endif



#define weight_buf_size 100
#define output_buf_size 100
#define C 4
#define ARRAY_C 2
#define ARRAY_K 2
#define K 2
#define H 2
#define W 2
typedef struct {
    int HW;
    int CHW;
} NPU_PARAM;

extern "C" {
    void dataflow(		
        char *input,
        int *output
    );
}

#endif
