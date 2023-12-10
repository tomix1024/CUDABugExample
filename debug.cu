#include <cuda_runtime.h>
#include "tensorview.h"

struct LaunchParams
{
    opg::TensorView<float, 1> output;
};

__constant__ LaunchParams params;

extern "C" __global__ void __miss__nop()
{
}

extern "C" __global__ void __raygen__main()
{
    //printf("\nBefore write %p\n", params.output.data);

    params.output[0].value() = 1.0f;

    printf("After write\n");
}
