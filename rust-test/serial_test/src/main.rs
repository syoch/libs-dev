extern crate im920_rs;
extern crate srobo_base;

use std::{thread::sleep, time::Duration};

use srobo_base::communication::{AsyncReadableStream, AsyncSerial, SerialDevice, WritableStream};

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let dev = SerialDevice::new("/dev/ttyACM0".to_string(), 921600);
    let (mut rx, mut tx) = dev.open().unwrap();

    rx.on_data(Box::new(|data: &[u8]| {
        // data --> ascii
        let s = String::from_utf8_lossy(data);
        println!("Received data: {}", s);
        ()
    })).unwrap();

    loop {
        println!("Sending data: abc");
        tx.write(&[0x61, 0x62, 0x63]).unwrap();

        sleep(Duration::from_secs(1));
    }
}
