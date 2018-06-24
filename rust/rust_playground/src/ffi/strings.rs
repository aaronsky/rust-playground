use std::str;
use libc::size_t;

// Accept a C-style (null-terminated UTF-8 or ASCII data) string.
// #[no_mangle]
// pub extern fn c_string_to_rust(null_terminated_string: *const c_char) {
//     let c_str: &CStr = unsafe { CStr::from_ptr(null_terminated_string) };
//     let byte_slice: &[u8] = c_str.to_bytes();
//     print_byte_slice_as_utf8(byte_slice);
// }

// // Accept an array of bytes and a length and parse it as a UTF-8 string.
// #[no_mangle]
// pub extern fn utf8_bytes_to_rust(bytes: *const u8, len: size_t) {
//     let byte_slice: &[u8] = unsafe { slice::from_raw_parts(bytes, len as usize) };
//     print_byte_slice_as_utf8(byte_slice);
// }

// Helper struct that we'll use to give strings to C.
#[repr(C)]
pub struct RustByteSlice {
    pub bytes: *const u8,
    pub len: size_t,
}

impl<'a> From<&'a str> for RustByteSlice {
    fn from(s: &'a str) -> Self {
        RustByteSlice{
            bytes: s.as_ptr(),
            len: s.len() as size_t,
        }
    }
}
