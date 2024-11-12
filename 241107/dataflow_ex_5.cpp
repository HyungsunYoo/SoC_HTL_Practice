#include "dataflow.h"

void readDram(char *input, char input_buf[C][H][W], int channel_i)
{
    for (int hi = 0; hi < H; hi++)
    {
        for (int wi = 0; wi < W; wi++)
        {
            int chw = channel_i * H * W + hi * W + wi;
            input_buf[channel_i][hi][wi] = input[chw];
            printf("HW: read input[%d] = %d,  channel_i=%d, hi=%d, wi=%d\n", chw, input[chw], channel_i, hi, wi);
        }
    }
}

void weightDram(char *weight, char weight_buf[C][ARRAY_K][ARRAY_C], int channel_i)
{
Loop_Weight_Dram:
    for (int ki = 0; ki < ARRAY_K; ki++)
    {
        for (int ci = 0; ci < ARRAY_C; ci++)
        {
            int chw = channel_i * ARRAY_K * ARRAY_C + ki * ARRAY_C + ci;
            weight_buf[channel_i][ki][ci] = weight[chw];
            printf("HW: read weight[%d] = %d,  channel_i=%d, ki=%d, ci=%d\n", chw, weight[chw], channel_i, ki, ci);
        }
    }
}

void run_PE(char input_buf[C][H][W], char weight_buf[C][ARRAY_K][ARRAY_C], int output_buf[ARRAY_K][ARRAY_C], int channel_i)
{
    int data;
    int weight;
    int output_reg[ARRAY_K][ARRAY_C];
    int output_temp[ARRAY_K][ARRAY_C];

/*
    if (channel_i == 0)
    {
        for (int ki = 0; ki < ARRAY_K; ki++)
        {
            #pragma HLS pipeline off
            for (int ci = 0; ci < ARRAY_C; ci++)
            {
                #pragma HLS pipeline off
                output_buf[ki][ci] = 0;
                output_temp[ki][ci] = 0;
            }
        }
    }
*/

//Sum, reduction ì¶”ê? ë²„ì „

    for (int ki = 0; ki < ARRAY_K; ki++)
    {
        for (int ci = 0; ci < ARRAY_C; ci++)
        {
            data = input_buf[channel_i][ki][ci];
            weight = weight_buf[channel_i][ki][ci];
            output_reg[ki][ci] = data * weight;
        }
    }

    for (int ki = 0; ki < ARRAY_K; ki++)
    {
        int sum = 0;
        for (int ci = 0; ci < ARRAY_C; ci++)
        {
            sum += output_reg[ki][ci];
        }

        int temp =0;
        temp = output_temp[ki][0];       // ê¸°ì¡´ê°?
        output_temp[ki][0] = temp + sum; // ?—…?°?´?Š¸

        output_buf[ki][0] = output_temp[ki][0];
    }
    
}

void writeDram(int output_buf[ARRAY_K][ARRAY_C], int *output, int channel_i)
{

	//sum, reduction ì¶”ê? ë²„ì „
Loop_Write_Dram:
    for (int ki = 0; ki < ARRAY_K; ki++)
    {
        output[ki] = output_buf[ki][0];
    }
}

void dataflow(
    char *input,
    char *weight,
    int *output)
{
#pragma HLS INTERFACE m_axi port = input offset = slave bundle = gmem0 depth = 64
#pragma HLS INTERFACE m_axi port = output offset = slave bundle = gmem1 depth = 64
#pragma HLS INTERFACE m_axi port = weight offset = slave bundle = gmem2 depth = 64
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS expression_balance

    char input_buf[C][H][W];
    char weight_buf[C][ARRAY_K][ARRAY_C];
    int output_buf[ARRAY_K][ARRAY_C];
    //int output_buf_copy[ARRAY_K][ARRAY_C];

    #pragma HLS ARRAY_PARTITION variable=input_buf dim=2 complete
    #pragma HLS ARRAY_PARTITION variable=weight_buf dim=2 complete

    for (int channel_i = 0; channel_i < C; channel_i++)
    {
        #pragma HLS DATAFLOW
        #pragma HLS stable variable=input_buf
        #pragma HLS stable variable=weight_buf
        #pragma HLS stable variable=output_buf
        //#pragma HLS stable variable=output_buf_copy

    	// stage 1 : DRAM read
        readDram(input, input_buf, channel_i);
        weightDram(weight, weight_buf, channel_i);

        // stage 2 : calculate
        run_PE(input_buf, weight_buf, output_buf, channel_i);

        // stage 3 : DRAM write
        writeDram(output_buf, output, channel_i);
    }
}
