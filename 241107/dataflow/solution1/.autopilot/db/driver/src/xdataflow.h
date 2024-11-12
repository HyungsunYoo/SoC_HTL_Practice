// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDATAFLOW_H
#define XDATAFLOW_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdataflow_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XDataflow_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDataflow;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDataflow_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDataflow_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDataflow_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDataflow_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XDataflow_Initialize(XDataflow *InstancePtr, u16 DeviceId);
XDataflow_Config* XDataflow_LookupConfig(u16 DeviceId);
int XDataflow_CfgInitialize(XDataflow *InstancePtr, XDataflow_Config *ConfigPtr);
#else
int XDataflow_Initialize(XDataflow *InstancePtr, const char* InstanceName);
int XDataflow_Release(XDataflow *InstancePtr);
#endif

void XDataflow_Start(XDataflow *InstancePtr);
u32 XDataflow_IsDone(XDataflow *InstancePtr);
u32 XDataflow_IsIdle(XDataflow *InstancePtr);
u32 XDataflow_IsReady(XDataflow *InstancePtr);
void XDataflow_EnableAutoRestart(XDataflow *InstancePtr);
void XDataflow_DisableAutoRestart(XDataflow *InstancePtr);

void XDataflow_Set_input_r(XDataflow *InstancePtr, u64 Data);
u64 XDataflow_Get_input_r(XDataflow *InstancePtr);
void XDataflow_Set_weight(XDataflow *InstancePtr, u64 Data);
u64 XDataflow_Get_weight(XDataflow *InstancePtr);
void XDataflow_Set_output_r(XDataflow *InstancePtr, u64 Data);
u64 XDataflow_Get_output_r(XDataflow *InstancePtr);

void XDataflow_InterruptGlobalEnable(XDataflow *InstancePtr);
void XDataflow_InterruptGlobalDisable(XDataflow *InstancePtr);
void XDataflow_InterruptEnable(XDataflow *InstancePtr, u32 Mask);
void XDataflow_InterruptDisable(XDataflow *InstancePtr, u32 Mask);
void XDataflow_InterruptClear(XDataflow *InstancePtr, u32 Mask);
u32 XDataflow_InterruptGetEnabled(XDataflow *InstancePtr);
u32 XDataflow_InterruptGetStatus(XDataflow *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
