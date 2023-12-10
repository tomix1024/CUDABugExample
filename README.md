
The `__raygen__main` method in `debug.cu` is compiled to a single `trap` instruction in CUDA 12.2 and 12.3.
This apparently is related to the missing `{` and `}` between the `if constexpr (...)` and the nested `for (...)`.
`#define FIX_COMPILATION` in `tensorview.h` and `nvcc` will produce the correct output.

The script `run.sh` compiles `debug.cu` using nvcc of CUDA 12.1, 12.2 and 12.3 (assuming we are running on a standard Ubuntu 22.04 installation) into PTX files, respectively.
