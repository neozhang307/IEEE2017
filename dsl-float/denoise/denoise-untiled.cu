/* -------------------------------------------------------
        UNTILED CODE GENERATED BY FORMA COMPILER
---------------------------------------------------------*/


#include "cuda.h"
#ifdef _TIMER_
#include "cuda_profiler_api.h"
#endif
#include "stdio.h"

#define FORMA_MAX(a,b) ( (a) > (b) ? (a) : (b) )
#define max(a,b) FORMA_MAX(a,b)
#define FORMA_MIN(a,b) ( (a) < (b) ? (a) : (b) )
#define min(a,b) FORMA_MIN(a,b)
#define FORMA_CEIL(a,b) ( (a) % (b) == 0 ? (a) / (b) : ((a) / (b)) + 1 )

#ifndef FORMA_MAX_BLOCKDIM_0
#define FORMA_MAX_BLOCKDIM_0 1024
#endif
#ifndef FORMA_MAX_BLOCKDIM_1
#define FORMA_MAX_BLOCKDIM_1 1024
#endif
#ifndef FORMA_MAX_BLOCKDIM_2
#define FORMA_MAX_BLOCKDIM_2 1024
#endif
#define epsilon (1.0E-20f)

template<typename T>
__global__ void  __kernel_init__(T* input, T value)
{
  int loc = (int)(blockIdx.x)*(int)(blockDim.x)+(int)(threadIdx.x);
  input[loc] = value;
}


template<typename T>
void initialize_array(T* d_input, int size, T value)
{
  dim3 init_grid(FORMA_CEIL(size,FORMA_MAX_BLOCKDIM_0));
  dim3 init_block(FORMA_MAX_BLOCKDIM_0);
  __kernel_init__<<<init_grid,init_block>>>(d_input,value);
}


void Check_CUDA_Error(const char* message);
/*Texture references */
/* Device code Begin */
__global__ void __kernel___forma_kernel__0__(float * __restrict__ u, int L, int M, int N, float * __restrict__ __var_3__){
  int FORMA_BLOCKDIM_Z = (int)(blockDim.z);
  int FORMA_BLOCKDIM_Y = (int)(blockDim.y);
  int FORMA_BLOCKDIM_X = (int)(blockDim.x);
  int __iter_0__;
  __iter_0__ = (int)(blockIdx.x)*(int)(FORMA_BLOCKDIM_X) + (int)(threadIdx.x) + 1;
  if(__iter_0__ <= (N-2)){
    int __iter_1__;
    __iter_1__ = (int)(blockIdx.y)*(int)(FORMA_BLOCKDIM_Y) + (int)(threadIdx.y) + 1;
    if(__iter_1__ <= (M-2)){
      int __iter_2__;
      __iter_2__ = (int)(blockIdx.z)*(int)(FORMA_BLOCKDIM_Z) + (int)(threadIdx.z) + 1;
      if(__iter_2__ <= (L-2)){
        float __temp_0__;
        __temp_0__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(1)+(M-0)*(__iter_2__))]);
        float __temp_1__;
        __temp_1__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(1)+(M-0)*(__iter_2__))]);
        float __temp_2__;
        __temp_2__ = (__temp_0__ * __temp_1__);
        float __temp_3__;
        __temp_3__ = (epsilon + __temp_2__);
        float __temp_4__;
        __temp_4__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(-1)+(M-0)*(__iter_2__))]);
        float __temp_5__;
        __temp_5__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(-1)+(M-0)*(__iter_2__))]);
        float __temp_6__;
        __temp_6__ = (__temp_4__ * __temp_5__);
        float __temp_7__;
        __temp_7__ = (__temp_3__ + __temp_6__);
        float __temp_8__;
        __temp_8__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(1)+(N-0)*(__iter_1__+(M-0)*(__iter_2__))]);
        float __temp_9__;
        __temp_9__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(1)+(N-0)*(__iter_1__+(M-0)*(__iter_2__))]);
        float __temp_10__;
        __temp_10__ = (__temp_8__ * __temp_9__);
        float __temp_11__;
        __temp_11__ = (__temp_7__ + __temp_10__);
        float __temp_12__;
        __temp_12__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(-1)+(N-0)*(__iter_1__+(M-0)*(__iter_2__))]);
        float __temp_13__;
        __temp_13__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(-1)+(N-0)*(__iter_1__+(M-0)*(__iter_2__))]);
        float __temp_14__;
        __temp_14__ = (__temp_12__ * __temp_13__);
        float __temp_15__;
        __temp_15__ = (__temp_11__ + __temp_14__);
        float __temp_16__;
        __temp_16__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__+(1)))]);
        float __temp_17__;
        __temp_17__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__+(1)))]);
        float __temp_18__;
        __temp_18__ = (__temp_16__ * __temp_17__);
        float __temp_19__;
        __temp_19__ = (__temp_15__ + __temp_18__);
        float __temp_20__;
        __temp_20__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__+(-1)))]);
        float __temp_21__;
        __temp_21__ = (u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] - u[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__+(-1)))]);
        float __temp_22__;
        __temp_22__ = (__temp_20__ * __temp_21__);
        float __temp_23__;
        __temp_23__ = (__temp_19__ + __temp_22__);
        float __temp_24__;
        __temp_24__ = sqrt(__temp_23__);
        float __temp_25__;
        __temp_25__ = (1.000000f / __temp_24__);
        __var_3__[__iter_0__+(N-0)*(__iter_1__+(M-0)*(__iter_2__))] = __temp_25__;
      }
    }
  }
}
__global__ void __kernel___forma_kernel__1__(float * __restrict__ u, float * __restrict__ f, float * __restrict__ __var_3__, int L, int M, int N, float * __restrict__ __var_2__){
  int FORMA_BLOCKDIM_Z = (int)(blockDim.z);
  int FORMA_BLOCKDIM_Y = (int)(blockDim.y);
  int FORMA_BLOCKDIM_X = (int)(blockDim.x);
  int __iter_3__;
  __iter_3__ = (int)(blockIdx.x)*(int)(FORMA_BLOCKDIM_X) + (int)(threadIdx.x) + 1;
  if(__iter_3__ <= (N-2)){
    int __iter_4__;
    __iter_4__ = (int)(blockIdx.y)*(int)(FORMA_BLOCKDIM_Y) + (int)(threadIdx.y) + 1;
    if(__iter_4__ <= (M-2)){
      int __iter_5__;
      __iter_5__ = (int)(blockIdx.z)*(int)(FORMA_BLOCKDIM_Z) + (int)(threadIdx.z) + 1;
      if(__iter_5__ <= (L-2)){
        float __temp_26__;
        __temp_26__ = (0.050000f * 0.050000f);
        float __temp_27__;
        __temp_27__ = (0.065000f / __temp_26__);
        float __temp_28__;
        __temp_28__ = (u[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__))] * f[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_29__;
        __temp_29__ = (__temp_28__ / __temp_26__);
        float __temp_30__;
        __temp_30__ = (0.950037f + __temp_29__);
        float __temp_31__;
        __temp_31__ = (__temp_29__ * __temp_30__);
        float __temp_32__;
        __temp_32__ = (2.389440f + __temp_31__);
        float __temp_33__;
        __temp_33__ = (__temp_29__ * __temp_32__);
        float __temp_34__;
        __temp_34__ = (1.489370f + __temp_29__);
        float __temp_35__;
        __temp_35__ = (__temp_29__ * __temp_34__);
        float __temp_36__;
        __temp_36__ = (2.575410f + __temp_35__);
        float __temp_37__;
        __temp_37__ = (__temp_29__ * __temp_36__);
        float __temp_38__;
        __temp_38__ = (4.653140f + __temp_37__);
        float __temp_39__;
        __temp_39__ = (__temp_33__ / __temp_38__);
        float __temp_40__;
        __temp_40__ = (u[__iter_3__+(N-0)*(__iter_4__+(1)+(M-0)*(__iter_5__))] * __var_3__[__iter_3__+(N-0)*(__iter_4__+(1)+(M-0)*(__iter_5__))]);
        float __temp_41__;
        __temp_41__ = (u[__iter_3__+(N-0)*(__iter_4__+(-1)+(M-0)*(__iter_5__))] * __var_3__[__iter_3__+(N-0)*(__iter_4__+(-1)+(M-0)*(__iter_5__))]);
        float __temp_42__;
        __temp_42__ = (__temp_40__ + __temp_41__);
        float __temp_43__;
        __temp_43__ = (u[__iter_3__+(1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))] * __var_3__[__iter_3__+(1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_44__;
        __temp_44__ = (__temp_42__ + __temp_43__);
        float __temp_45__;
        __temp_45__ = (u[__iter_3__+(-1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))] * __var_3__[__iter_3__+(-1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_46__;
        __temp_46__ = (__temp_44__ + __temp_45__);
        float __temp_47__;
        __temp_47__ = (u[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(1)))] * __var_3__[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(1)))]);
        float __temp_48__;
        __temp_48__ = (__temp_46__ + __temp_47__);
        float __temp_49__;
        __temp_49__ = (u[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(-1)))] * __var_3__[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(-1)))]);
        float __temp_50__;
        __temp_50__ = (__temp_48__ + __temp_49__);
        float __temp_51__;
        __temp_51__ = (__temp_27__ * f[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_52__;
        __temp_52__ = (__temp_51__ * __temp_39__);
        float __temp_53__;
        __temp_53__ = (__temp_50__ + __temp_52__);
        float __temp_54__;
        __temp_54__ = (5.000000f * __temp_53__);
        float __temp_55__;
        __temp_55__ = (u[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__))] + __temp_54__);
        float __temp_56__;
        __temp_56__ = (__var_3__[__iter_3__+(N-0)*(__iter_4__+(1)+(M-0)*(__iter_5__))] + __var_3__[__iter_3__+(N-0)*(__iter_4__+(-1)+(M-0)*(__iter_5__))]);
        float __temp_57__;
        __temp_57__ = (__temp_56__ + __var_3__[__iter_3__+(1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_58__;
        __temp_58__ = (__temp_57__ + __var_3__[__iter_3__+(-1)+(N-0)*(__iter_4__+(M-0)*(__iter_5__))]);
        float __temp_59__;
        __temp_59__ = (__temp_58__ + __var_3__[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(1)))]);
        float __temp_60__;
        __temp_60__ = (__temp_59__ + __var_3__[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__+(-1)))]);
        float __temp_61__;
        __temp_61__ = (__temp_60__ + __temp_27__);
        float __temp_62__;
        __temp_62__ = (5.000000f * __temp_61__);
        float __temp_63__;
        __temp_63__ = (1.000000f + __temp_62__);
        float __temp_64__;
        __temp_64__ = (__temp_55__ / __temp_63__);
        __var_2__[__iter_3__+(N-0)*(__iter_4__+(M-0)*(__iter_5__))] = __temp_64__;
      }
    }
  }
}

/* Host Code Begin */
extern "C" void host_code (float * h_u, float * h_f, float gamma, float r, float sigma2, int L, int M, int N) {

/* Host allocation Begin */
  float * u;
  cudaMalloc(&u,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : u\n");
  cudaPointerAttributes ptrAttrib_h_u;
  cudaMemcpyKind memcpy_kind_h_u = cudaMemcpyHostToDevice;
  if (cudaPointerGetAttributes(&ptrAttrib_h_u, h_u) == cudaSuccess)
    if (ptrAttrib_h_u.memoryType == cudaMemoryTypeDevice)
      memcpy_kind_h_u = cudaMemcpyDeviceToDevice;
  cudaGetLastError();
  if( memcpy_kind_h_u != cudaMemcpyDeviceToDevice ){
    cudaMemcpy(u,h_u,sizeof(float)*((L-0)*(M-0)*(N-0)), memcpy_kind_h_u);
  }
  float * f;
  cudaMalloc(&f,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : f\n");
  cudaPointerAttributes ptrAttrib_h_f;
  cudaMemcpyKind memcpy_kind_h_f = cudaMemcpyHostToDevice;
  if (cudaPointerGetAttributes(&ptrAttrib_h_f, h_f) == cudaSuccess)
    if (ptrAttrib_h_f.memoryType == cudaMemoryTypeDevice)
      memcpy_kind_h_f = cudaMemcpyDeviceToDevice;
  cudaGetLastError();
  if( memcpy_kind_h_f != cudaMemcpyDeviceToDevice ){
    cudaMemcpy(f,h_f,sizeof(float)*((L-0)*(M-0)*(N-0)), memcpy_kind_h_f);
  }
  float * __var_1__;
  cudaMalloc(&__var_1__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_1__\n");
  float * __var_2__;
  cudaMalloc(&__var_2__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_2__\n");
  float * __var_3__;
  cudaMalloc(&__var_3__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_3__\n");
  float * __var_4__;
  cudaMalloc(&__var_4__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_4__\n");
  float * __var_5__;
  cudaMalloc(&__var_5__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_5__\n");
  float * __var_6__;
  cudaMalloc(&__var_6__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_6__\n");
  float * __var_7__;
  cudaMalloc(&__var_7__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_7__\n");
  float * __var_8__;
  cudaMalloc(&__var_8__,sizeof(float)*((L-0)*(M-0)*(N-0)));
  Check_CUDA_Error("Allocation Error!! : __var_8__\n");
/*Host Allocation End */
/* Kernel Launch Begin */
#ifdef _TIMER_
  cudaEvent_t _forma_timer_start_,_forma_timer_stop_;
  cudaEventCreate(&_forma_timer_start_);
  cudaEventCreate(&_forma_timer_stop_);
  cudaEventRecord(_forma_timer_start_,0);
#endif
  int __size_0___kernel___forma_kernel__0__ = ((N-2) - 1 ) + 1;
  int __size_1___kernel___forma_kernel__0__ = ((M-2) - 1 ) + 1;
  int __size_2___kernel___forma_kernel__0__ = ((L-2) - 1 ) + 1;
  int __block_0___kernel___forma_kernel__0__ = 16;
  int __block_1___kernel___forma_kernel__0__ = 4;
  int __block_2___kernel___forma_kernel__0__ = 4;
  dim3 __blockConfig___kernel___forma_kernel__0__(__block_0___kernel___forma_kernel__0__,__block_1___kernel___forma_kernel__0__,__block_2___kernel___forma_kernel__0__);
  int __SMemSize___kernel___forma_kernel__0__ = 0;
  int __grid_0___kernel___forma_kernel__0__ = FORMA_CEIL(__size_0___kernel___forma_kernel__0__,__block_0___kernel___forma_kernel__0__);
  int __grid_1___kernel___forma_kernel__0__ = FORMA_CEIL(__size_1___kernel___forma_kernel__0__,__block_1___kernel___forma_kernel__0__);
  int __grid_2___kernel___forma_kernel__0__ = FORMA_CEIL(__size_2___kernel___forma_kernel__0__,__block_2___kernel___forma_kernel__0__);
  dim3 __gridConfig___kernel___forma_kernel__0__(__grid_0___kernel___forma_kernel__0__,__grid_1___kernel___forma_kernel__0__,__grid_2___kernel___forma_kernel__0__);

  __kernel___forma_kernel__0__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (u, L, M, N, __var_3__);
  __kernel___forma_kernel__1__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (u, f, __var_3__, L, M, N, __var_2__);
  __kernel___forma_kernel__0__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_2__, L, M, N, __var_5__);
  __kernel___forma_kernel__1__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_2__, f, __var_5__, L, M, N, __var_4__);
  __kernel___forma_kernel__0__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_4__, L, M, N, __var_7__);
  __kernel___forma_kernel__1__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_4__, f, __var_7__, L, M, N, __var_6__);
  __kernel___forma_kernel__0__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_6__, L, M, N, __var_8__);
  __kernel___forma_kernel__1__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__, __SMemSize___kernel___forma_kernel__0__>>> (__var_6__, f, __var_8__, L, M, N, __var_1__);


  cudaMemcpyKind memcpy_kind___var_0__ = cudaMemcpyDeviceToHost;
  cudaMemcpy(h_u,__var_1__, sizeof(float)*((L-0)*(M-0)*(N-0)), memcpy_kind___var_0__);
#ifdef _TIMER_
  cudaEventRecord(_forma_timer_stop_,0);
  cudaEventSynchronize(_forma_timer_stop_);
  float elapsedTime;
  cudaEventElapsedTime(&elapsedTime,_forma_timer_start_,_forma_timer_stop_);
  printf("[FORMA] Computation Time(ms) : %lf\n",elapsedTime);
  cudaEventDestroy(_forma_timer_start_);
  cudaEventDestroy(_forma_timer_stop_);
#endif
/*Kernel Launch End */
/* Host Free Begin */
  cudaFree(u);
  cudaFree(f);
  cudaFree(__var_1__);
  cudaFree(__var_2__);
  cudaFree(__var_3__);
  cudaFree(__var_4__);
  cudaFree(__var_5__);
  cudaFree(__var_6__);
  cudaFree(__var_7__);
  cudaFree(__var_8__);
}
/*Host Free End*/
