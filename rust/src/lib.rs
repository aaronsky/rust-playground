extern crate libc;
extern crate log;
extern crate rand;
extern crate serde;

#[macro_use]
extern crate serde_derive;

pub mod ffi;

#[no_mangle]
pub extern fn average_two_doubles(x: f64, y: f64) -> f64 {
    (x + y) / 2.0
}
