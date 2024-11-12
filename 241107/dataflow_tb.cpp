#include "dataflow.h"

void dataflow(
	char *input,
	char *weight,
	int *output);

void conv_gold(
	NPU_PARAM param,
	char *input,
	char *weight,
	int *gold)
{

	//CPU version of convolution (dot-product)
	 for (int count = 0; count < K * H * W; count++)
	 {
	 	gold[count] = input[count] * weight[count];
		//printf("gold> input[%d]=%d, weight[%d]=%d, output[%d]=%d\n", count, input[count], count, weight[count], count, gold[count]);
	 }
}

char input[W * H * C];
//char weight[W * H * C];
char weight[ARRAY_C * ARRAY_K * C];
int output[C * H * W];
int gold[C * H * W];

int simple_test(
	NPU_PARAM param,
	char *input,
	char *weight,
	int *gold)
{
	//Hardware version of convolution (dot-product)
	dataflow(input, weight, output);

	//Checking the functional correctness, comparing with the CPU version results
	for (int count = 0; count < (W * H * C); count++)
	{

	 	if (gold[count] != output[count]) {
	 		 //printf("Check failed: gold[%d]=%d, output[%d]=%d\n", count, gold[count], count, output[count]);
	 		 //printf("incorrect: gold[%d]=%d, output[%d]=%d\n", count, gold[count], count, output[count]);
	 		 //return 1;
	 	}
	 	else {
	 		 //printf("correct  : gold[%d]=%d, output[%d]=%d\n", count, gold[count], count, output[count]);
	 	}
	}

	// sum, reduction 異붽� 踰꾩쟾 �떟 : �떎�뿕2, �떎�뿕3, �떎�뿕5
	/*
		for (int ki = 0; ki < ARRAY_K; ki++)
		{
			printf("output[%d] = %d\n", ki, output[ki]);
			if (gold[ki] != output[ki])
				return 0; //�쟾泥닿컪�쓣 �솗�씤�븯怨� �떢�쓣�븣
				//return 1; // �삤瑜� 諛쒖깮�뿬遺�瑜� �솗�씤�븷 �븣
		}
	*/
	return 0;
}

int main()
{
	int err = 0;
	NPU_PARAM param;
	{
		// param.HW = weight_buf_size;
		param.CHW = W * H * C;
		printf("H=%d, W=%d, C=%d\n", W, H, C);
	}
	printf("Test Started\n");
	for (int chw = 0; chw < param.CHW; chw++)
	{
		weight[chw] = 1;
	}

	// input�뿉 李⑤���濡� 1,2,3,4 諛섎났�빐�꽌 �꽔湲�
	for (int chw = 0; chw < param.CHW; chw++)
	{
		int i = chw % 4;
		input[chw] = i + 1;
	}

	conv_gold(param, input, weight, gold);

	err = simple_test(param, input, weight, gold);
	if (err == 1){
		//printf("Test Failed\n");
		//return 1;
	}
		

	printf("Test Completed\n");

	return 0;
}
