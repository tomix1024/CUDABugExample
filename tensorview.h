#pragma once

#include <stdint.h>
#include <type_traits>

//#define FIX_COMPILATION

namespace opg {

template <typename T, int N>
struct TensorView
{
    static_assert(N > 0, "Dimension count must be non-negative!");

    std::byte*  data;
    uint32_t    strides[N];

    __device__ TensorView<T, N-1> operator[](uint32_t index) const
    {
        TensorView<T, N-1> result;
        result.data = this->data + this->strides[0]*index;
        if constexpr (N > 1)
#ifdef FIX_COMPILATION
        {
#endif // FIX_COMPILATION
            for (int i = 0; i < N-1; ++i)
            {
                result.strides[i] = this->strides[i+1];
            }
#ifdef FIX_COMPILATION
        }
#endif // FIX_COMPILATION
        return result;
    }
};

template <typename T>
struct TensorView<T, 0>
{
    std::byte*  data;

    __device__ T& value() { return *reinterpret_cast<T*>(this->data); }
};

} // namespace opg
