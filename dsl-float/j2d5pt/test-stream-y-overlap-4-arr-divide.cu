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
#define mod(x,y) ( (x) & (y-1))

#ifndef FORMA_MAX_BLOCKDIM_0
#define FORMA_MAX_BLOCKDIM_0 1024
#endif
#ifndef FORMA_MAX_BLOCKDIM_1
#define FORMA_MAX_BLOCKDIM_1 1024
#endif
#ifndef FORMA_MAX_BLOCKDIM_2
#define FORMA_MAX_BLOCKDIM_2 1024
#endif

void Check_CUDA_Error(const char* message);
/* Device code Begin */

__global__ void __kernel___forma_kernel__0__(float * __restrict__ input, int N, int M, int FORMA_BLOCKDIM_X, int FORMA_BLOCKDIM_Y, float * __restrict__ __var_1__){
  __shared__ float __tilevar_0__[3][128];
  __shared__ float __tilevar_1__[3][128];
  __shared__ float __tilevar_2__[3][128];
  __shared__ float __tilevar_3__[3][128];
  int __iter_0__ = (int)(blockIdx.x)*(int)(FORMA_BLOCKDIM_X-8);
  int __iter_y__ = (int)(blockIdx.y)*(int)(FORMA_BLOCKDIM_Y)-4;

  // Initialize the values
  int __iter_3__ = FORMA_MAX(__iter_0__,0) + (int)(threadIdx.x) ;
  if (__iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-1),(M-1))) {
    __tilevar_0__[1][__iter_3__-__iter_0__] = input[__iter_3__+M*FORMA_MAX(0,__iter_y__)];
    __tilevar_0__[2][__iter_3__-__iter_0__] = input[__iter_3__+M*FORMA_MAX(1,__iter_y__+1)]; 
  }

  // Initial computation
  for (int __iter_1__ = FORMA_MAX(1,__iter_y__+1); __iter_1__ < FORMA_MIN(N-1,__iter_y__+7); __iter_1__++) {
    if(__iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-1),(M-1))){
      __tilevar_0__[0][__iter_3__-__iter_0__] = __tilevar_0__[1][__iter_3__-__iter_0__];
      __tilevar_0__[1][__iter_3__-__iter_0__] = __tilevar_0__[2][__iter_3__-__iter_0__];
      __tilevar_0__[2][__iter_3__-__iter_0__] = input[__iter_3__+M*(__iter_1__+1)];  
    }
    __syncthreads();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+1),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-2),(M-2)) ){
      float __temp_2__ = __tilevar_0__[0][__iter_3__-__iter_0__];
      float __temp_5__ = (__tilevar_0__[1][__iter_3__-1-__iter_0__]);
      float __temp_6__ = (5 * __temp_2__ + 12 * __temp_5__);
      float __temp_9__ = (__tilevar_0__[1][__iter_3__-__iter_0__]);
      float __temp_10__ = (__temp_6__ + 15 * __temp_9__);
      float __temp_13__ = (__tilevar_0__[1][__iter_3__+1-__iter_0__]);
      float __temp_14__ = (__temp_10__ + 12 * __temp_13__);
      float __temp_17__ = __tilevar_0__[2][__iter_3__-__iter_0__];
      float __temp_18__ = (__temp_14__ + 5 * __temp_17__);
      float __temp_19__ = (__temp_18__ / 118);
      __tilevar_1__[0][__iter_3__-__iter_0__] = __tilevar_1__[1][__iter_3__-__iter_0__];
      __tilevar_1__[1][__iter_3__-__iter_0__] = __tilevar_1__[2][__iter_3__-__iter_0__];
      __tilevar_1__[2][__iter_3__-__iter_0__] = __temp_19__;
    }
    __syncthreads();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+2),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-3),(M-2)) ){
      float __temp_32__ = __tilevar_1__[0][__iter_3__-__iter_0__];
      float __temp_35__ = (__tilevar_1__[1][__iter_3__+(-1)-__iter_0__]);
      float __temp_36__ = (5 * __temp_32__ + 12 * __temp_35__);
      float __temp_39__ = (__tilevar_1__[1][__iter_3__-__iter_0__]);
      float __temp_40__ = (__temp_36__ + 15 * __temp_39__);
      float __temp_43__ = (__tilevar_1__[1][__iter_3__+1-__iter_0__]);
      float __temp_44__ = (__temp_40__ + 12 * __temp_43__);
      float __temp_47__ = __tilevar_1__[2][__iter_3__-__iter_0__];
      float __temp_48__ = (__temp_44__ + 5 * __temp_47__);
      float __temp_49__ = (__temp_48__ / 118);
      __tilevar_2__[0][__iter_3__-__iter_0__] = __tilevar_2__[1][__iter_3__-__iter_0__];
      __tilevar_2__[1][__iter_3__-__iter_0__] = __tilevar_2__[2][__iter_3__-__iter_0__];
      __tilevar_2__[2][__iter_3__-__iter_0__] = __temp_49__;
    }
    __syncthreads ();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+3),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-4),(M-2)) ){
      float __temp_60__ = __tilevar_2__[0][__iter_3__-__iter_0__];
      float __temp_61__ = (__tilevar_2__[1][__iter_3__+(-1)-__iter_0__]);
      float __temp_62__ = (5 * __temp_60__ + 12 * __temp_61__);
      float __temp_63__ = (__tilevar_2__[1][__iter_3__-__iter_0__]);
      float __temp_64__ = (__temp_62__ + 15 * __temp_63__);
      float __temp_65__ = (__tilevar_2__[1][__iter_3__+1-__iter_0__]);
      float __temp_66__ = (__temp_64__ + 12 * __temp_65__);
      float __temp_67__ = __tilevar_2__[2][__iter_3__-__iter_0__];
      float __temp_68__ = (__temp_66__ + 5 * __temp_67__);
      float __temp_69__ = (__temp_68__ / 118);
      __tilevar_3__[0][__iter_3__-__iter_0__] = __tilevar_3__[1][__iter_3__-__iter_0__];
      __tilevar_3__[1][__iter_3__-__iter_0__] = __tilevar_3__[2][__iter_3__-__iter_0__];
      __tilevar_3__[2][__iter_3__-__iter_0__] = __temp_69__;
    }
  }
  // Rest of the computation
  for (int __iter_1__ = FORMA_MAX(1,__iter_y__+7); __iter_1__ < FORMA_MIN(N-1,__iter_y__+FORMA_BLOCKDIM_Y+8); __iter_1__++) {
    if(__iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-1),(M-1))){
      __tilevar_0__[0][__iter_3__-__iter_0__] = __tilevar_0__[1][__iter_3__-__iter_0__];
      __tilevar_0__[1][__iter_3__-__iter_0__] = __tilevar_0__[2][__iter_3__-__iter_0__];
      __tilevar_0__[2][__iter_3__-__iter_0__] = input[__iter_3__+M*(__iter_1__+1)];  
    }
    __syncthreads();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+1),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-2),(M-2)) ){
      float __temp_2__ = __tilevar_0__[0][__iter_3__-__iter_0__];
      float __temp_5__ = (__tilevar_0__[1][__iter_3__-1-__iter_0__]);
      float __temp_6__ = (5 * __temp_2__ + 12 * __temp_5__);
      float __temp_9__ = (__tilevar_0__[1][__iter_3__-__iter_0__]);
      float __temp_10__ = (__temp_6__ + 15 * __temp_9__);
      float __temp_13__ = (__tilevar_0__[1][__iter_3__+1-__iter_0__]);
      float __temp_14__ = (__temp_10__ + 12 * __temp_13__);
      float __temp_17__ = __tilevar_0__[2][__iter_3__-__iter_0__];
      float __temp_18__ = (__temp_14__ + 5 * __temp_17__);
      float __temp_19__ = (__temp_18__ / 118);
      __tilevar_1__[0][__iter_3__-__iter_0__] = __tilevar_1__[1][__iter_3__-__iter_0__];
      __tilevar_1__[1][__iter_3__-__iter_0__] = __tilevar_1__[2][__iter_3__-__iter_0__];
      __tilevar_1__[2][__iter_3__-__iter_0__] = __temp_19__;
    }
    __syncthreads();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+2),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-3),(M-2)) ){
      float __temp_32__ = __tilevar_1__[0][__iter_3__-__iter_0__];
      float __temp_35__ = (__tilevar_1__[1][__iter_3__+(-1)-__iter_0__]);
      float __temp_36__ = (5 * __temp_32__ + 12 * __temp_35__);
      float __temp_39__ = (__tilevar_1__[1][__iter_3__-__iter_0__]);
      float __temp_40__ = (__temp_36__ + 15 * __temp_39__);
      float __temp_43__ = (__tilevar_1__[1][__iter_3__+1-__iter_0__]);
      float __temp_44__ = (__temp_40__ + 12 * __temp_43__);
      float __temp_47__ = __tilevar_1__[2][__iter_3__-__iter_0__];
      float __temp_48__ = (__temp_44__ + 5 * __temp_47__);
      float __temp_49__ = (__temp_48__ / 118);
      __tilevar_2__[0][__iter_3__-__iter_0__] = __tilevar_2__[1][__iter_3__-__iter_0__];
      __tilevar_2__[1][__iter_3__-__iter_0__] = __tilevar_2__[2][__iter_3__-__iter_0__];
      __tilevar_2__[2][__iter_3__-__iter_0__] = __temp_49__;
    }
    __syncthreads ();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+3),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-4),(M-2)) ){
      float __temp_60__ = __tilevar_2__[0][__iter_3__-__iter_0__];
      float __temp_61__ = (__tilevar_2__[1][__iter_3__+(-1)-__iter_0__]);
      float __temp_62__ = (5 * __temp_60__ + 12 * __temp_61__);
      float __temp_63__ = (__tilevar_2__[1][__iter_3__-__iter_0__]);
      float __temp_64__ = (__temp_62__ + 15 * __temp_63__);
      float __temp_65__ = (__tilevar_2__[1][__iter_3__+1-__iter_0__]);
      float __temp_66__ = (__temp_64__ + 12 * __temp_65__);
      float __temp_67__ = __tilevar_2__[2][__iter_3__-__iter_0__];
      float __temp_68__ = (__temp_66__ + 5 * __temp_67__);
      float __temp_69__ = (__temp_68__ / 118);
      __tilevar_3__[0][__iter_3__-__iter_0__] = __tilevar_3__[1][__iter_3__-__iter_0__];
      __tilevar_3__[1][__iter_3__-__iter_0__] = __tilevar_3__[2][__iter_3__-__iter_0__];
      __tilevar_3__[2][__iter_3__-__iter_0__] = __temp_69__;
    }
    __syncthreads ();
    if(__iter_3__ >= FORMA_MAX((__iter_0__+4),1) & __iter_3__ <= FORMA_MIN(((__iter_0__+FORMA_BLOCKDIM_X)-5),(M-2)) ){
      float __temp_80__ = __tilevar_3__[0][__iter_3__-__iter_0__];
      float __temp_81__ = (__tilevar_3__[1][__iter_3__+(-1)-__iter_0__]);
      float __temp_82__ = (5 * __temp_80__ + 12 * __temp_81__);
      float __temp_83__ = (__tilevar_3__[1][__iter_3__-__iter_0__]);
      float __temp_84__ = (__temp_82__ + 15 * __temp_83__);
      float __temp_85__ = (__tilevar_3__[1][__iter_3__+1-__iter_0__]);
      float __temp_86__ = (__temp_84__ + 12 * __temp_85__);
      float __temp_87__ = __tilevar_3__[2][__iter_3__-__iter_0__];
      float __temp_88__ = (__temp_86__ + 5 * __temp_87__);
      float __temp_89__ = (__temp_88__ / 118);
      __var_1__[__iter_3__+(M)*FORMA_MAX(__iter_1__-3,0)] = __temp_89__;
    }
  }
}

/*Device code End */
/* Host Code Begin */
extern "C" void jacobi(float * h_input, int N, int M, float * __var_0__){

/* Host allocation Begin */
  float * input;
  cudaMalloc(&input,sizeof(float)*((N)*(M)));
  Check_CUDA_Error("Allocation Error!! : input\n");
  cudaPointerAttributes ptrAttrib_h_input;
  cudaMemcpyKind memcpy_kind_h_input = cudaMemcpyHostToDevice;
  if (cudaPointerGetAttributes(&ptrAttrib_h_input, h_input) == cudaSuccess)
    if (ptrAttrib_h_input.memoryType == cudaMemoryTypeDevice)
      memcpy_kind_h_input = cudaMemcpyDeviceToDevice;
  cudaGetLastError();
  if( memcpy_kind_h_input != cudaMemcpyDeviceToDevice ){
    cudaMemcpy(input,h_input,sizeof(float)*((N)*(M)), memcpy_kind_h_input);
  }
  float * __var_1__;
  cudaMalloc(&__var_1__,sizeof(float)*((N)*(M)));
  Check_CUDA_Error("Allocation Error!! : __var_1__\n");
/*Host Allocation End */
/* Kernel Launch Begin */
  int __FORMA_MAX_SHARED_MEM__;
  cudaDeviceGetAttribute(&__FORMA_MAX_SHARED_MEM__,cudaDevAttrMaxSharedMemoryPerBlock,0);
#ifdef _TIMER_
  cudaEvent_t _forma_timer_start_,_forma_timer_stop_;
  cudaEventCreate(&_forma_timer_start_);
  cudaEventCreate(&_forma_timer_stop_);
  cudaEventRecord(_forma_timer_start_,0);
#endif
  int __size_0___kernel___forma_kernel__0__ = M;
  int __size_1___kernel___forma_kernel__0__ = N;
  int __block_0___kernel___forma_kernel__0__ = 128;
  int __block_1___kernel___forma_kernel__0__ = 1;
  dim3 __blockConfig___kernel___forma_kernel__0__(__block_0___kernel___forma_kernel__0__,__block_1___kernel___forma_kernel__0__);
  int __grid_0___kernel___forma_kernel__0__ = FORMA_CEIL(__size_0___kernel___forma_kernel__0__,__blockConfig___kernel___forma_kernel__0__.x-8);
  int __grid_1___kernel___forma_kernel__0__ = FORMA_CEIL(__size_1___kernel___forma_kernel__0__, __size_1___kernel___forma_kernel__0__/16);
  dim3 __gridConfig___kernel___forma_kernel__0__(__grid_0___kernel___forma_kernel__0__,__grid_1___kernel___forma_kernel__0__);
  __kernel___forma_kernel__0__<<<__gridConfig___kernel___forma_kernel__0__, __blockConfig___kernel___forma_kernel__0__>>> (input, N, M, __blockConfig___kernel___forma_kernel__0__.x, __size_1___kernel___forma_kernel__0__/16, __var_1__);
  Check_CUDA_Error("Kernel Launch Error!! : __kernel___forma_kernel__0__\n");

  cudaPointerAttributes ptrAttrib___var_0__;
  cudaMemcpyKind memcpy_kind___var_0__ = cudaMemcpyDeviceToHost;
  if (cudaPointerGetAttributes(&ptrAttrib___var_0__, __var_0__) == cudaSuccess)
    if (ptrAttrib___var_0__.memoryType == cudaMemoryTypeDevice)
      memcpy_kind___var_0__ = cudaMemcpyDeviceToDevice;
  cudaGetLastError();
  cudaMemcpy(__var_0__,__var_1__, sizeof(float)*((N)*(M)), memcpy_kind___var_0__);
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
  cudaFree(input);
  cudaFree(__var_1__);
}
/*Host Free End*/
