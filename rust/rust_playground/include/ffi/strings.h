#pragma once

#include <stdint.h>

struct RustByteSlice {
    const uint8_t *bytes;
    size_t len;
};
