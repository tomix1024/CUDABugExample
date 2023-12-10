#!/bin/bash

/usr/local/cuda-12.1/bin/nvcc -forward-unknown-to-host-compiler -isystem /usr/local/cuda-12.1/include -std=c++17 --generate-code=arch=compute_52,code=[compute_52,sm_52] -Xcompiler=-fPIC --use_fast_math --expt-relaxed-constexpr --extended-lambda -Wno-deprecated-gpu-targets -Xcudafe=\"--diag_suppress=2886\" -ptx -x cu -rdc=true -ptx debug.cu -o debug-12.1.ptx
/usr/local/cuda-12.2/bin/nvcc -forward-unknown-to-host-compiler -isystem /usr/local/cuda-12.2/include -std=c++17 --generate-code=arch=compute_52,code=[compute_52,sm_52] -Xcompiler=-fPIC --use_fast_math --expt-relaxed-constexpr --extended-lambda -Wno-deprecated-gpu-targets -Xcudafe=\"--diag_suppress=2886\" -ptx -x cu -rdc=true -ptx debug.cu -o debug-12.2.ptx
/usr/local/cuda-12.3/bin/nvcc -forward-unknown-to-host-compiler -isystem /usr/local/cuda-12.3/include -std=c++17 --generate-code=arch=compute_52,code=[compute_52,sm_52] -Xcompiler=-fPIC --use_fast_math --expt-relaxed-constexpr --extended-lambda -Wno-deprecated-gpu-targets -Xcudafe=\"--diag_suppress=2886\" -ptx -x cu -rdc=true -ptx debug.cu -o debug-12.3.ptx

tail debug-12.{1,2,3}.ptx
