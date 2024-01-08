#![no_std]

use core::panic::PanicInfo;
#[cfg_attr(not(test), panic_handler)]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub fn run(n: i32) -> i32 {
    if n <= 1 {
        n
    } else {
        run(n - 1) + run(n - 2)
    }
}