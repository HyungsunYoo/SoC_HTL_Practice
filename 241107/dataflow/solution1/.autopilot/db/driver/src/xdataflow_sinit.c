// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdataflow.h"

extern XDataflow_Config XDataflow_ConfigTable[];

XDataflow_Config *XDataflow_LookupConfig(u16 DeviceId) {
	XDataflow_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDATAFLOW_NUM_INSTANCES; Index++) {
		if (XDataflow_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDataflow_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDataflow_Initialize(XDataflow *InstancePtr, u16 DeviceId) {
	XDataflow_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDataflow_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDataflow_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

