#include <cstdint>

extern "C" {

/// # Safety
/// `len` must be a valid length of `pat`. On success, the content of `res` will
/// not be null. There is no guarantee about the layout of `res` and it should
/// be considered opaque. The buffer behind `res` must be of size 256 bytes and
/// needs to be aligned to [`patterns::BYTES`] bytes! By default 64.
/// `pat` needs to be valid UTF-8.
void parse_pattern(const uint8_t* pat, uintptr_t len, void* res);

/// # Safety
/// [in] `pat` must be the same pointer that was filled by [`parse_pattern`].
/// [in] `data` is the data to search through
/// [in] `len` must be the number of bytes of `data`.
/// [out] `res` will be filled with the result
/// [in] `res_len` is the amount of results that fit into `res`
/// [return] returns how many offsets were found
uintptr_t match_pattern(const void* pat,
                        const void* data,
                        uintptr_t len,
                        uintptr_t* res,
                        uintptr_t res_len);

} // extern "C"
