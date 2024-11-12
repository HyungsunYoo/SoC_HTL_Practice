// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdataflow.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDataflow_CfgInitialize(XDataflow *InstancePtr, XDataflow_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDataflow_Start(XDataflow *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDataflow_IsDone(XDataflow *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDataflow_IsIdle(XDataflow *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDataflow_IsReady(XDataflow *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDataflow_EnableAutoRestart(XDataflow *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDataflow_DisableAutoRestart(XDataflow *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_AP_CTRL, 0);
}

void XDataflow_Set_input_r(XDataflow *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XDataflow_Get_input_r(XDataflow *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XDataflow_Set_weight(XDataflow *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_WEIGHT_DATA, (u32)(Data));
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_WEIGHT_DATA + 4, (u32)(Data >> 32));
}

u64 XDataflow_Get_weight(XDataflow *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_WEIGHT_DATA);
    Data += (u64)XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_WEIGHT_DATA + 4) << 32;
    return Data;
}

void XDataflow_Set_output_r(XDataflow *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_OUTPUT_R_DATA, (u32)(Data));
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_OUTPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XDataflow_Get_output_r(XDataflow *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_OUTPUT_R_DATA);
    Data += (u64)XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_OUTPUT_R_DATA + 4) << 32;
    return Data;
}

void XDataflow_InterruptGlobalEnable(XDataflow *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_GIE, 1);
}

void XDataflow_InterruptGlobalDisable(XDataflow *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_GIE, 0);
}

void XDataflow_InterruptEnable(XDataflow *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_IER);
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_IER, Register | Mask);
}

void XDataflow_InterruptDisable(XDataflow *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_IER);
    XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDataflow_InterruptClear(XDataflow *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XDataflow_WriteReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_ISR, Mask);
}

u32 XDataflow_InterruptGetEnabled(XDataflow *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_IER);
}

u32 XDataflow_InterruptGetStatus(XDataflow *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XDataflow_ReadReg(InstancePtr->Control_BaseAddress, XDATAFLOW_CONTROL_ADDR_ISR);
}

