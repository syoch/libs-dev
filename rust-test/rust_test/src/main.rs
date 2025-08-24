extern crate im920_rs;
extern crate srobo_base;

use std::{
    sync::{Arc, mpsc},
    thread::sleep,
    time::Duration,
};

use im920_rs::Packet;
use srobo_base::communication::{AsyncReadableStream, AsyncSerial, SerialDevice, WritableStream};

fn _main_im920_test() -> Result<(), Box<dyn std::error::Error>> {
    let dev = SerialDevice::new("/dev/ttyUSB1".to_string(), 19200);
    let (mut rx, mut tx) = dev.open().unwrap();
    let mut time = srobo_base::time::HostTime::new();

    let mut im920 = im920_rs::IM920::new(&mut tx, &mut rx, &mut time);

    im920.on_data(Box::new(|data| {
        println!("Received data: {:?}", data);
    }));

    let nn = im920.get_node_number(Duration::new(1, 0)).unwrap();
    let gn = im920.get_group_number(Duration::new(1, 0)).unwrap();
    let ch = im920.get_channel(Duration::new(1, 0)).unwrap();
    println!("Node Number: {}", nn);
    println!("Group Number: {}", gn);
    println!("Channel: {}", ch);

    if ch != 0x02 {
        println!("Setting channel to 0x02");
        im920.set_channel(0x02, Duration::new(1, 0)).unwrap();
    }

    loop {
        let lst = [0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80] as [u8; 8];

        sleep(Duration::new(1, 0));
        let tx_result = im920.transmit_broadcast(
            Packet {
                node_id: 0,
                data: &lst,
            },
            Duration::new(1, 0),
        );
        match tx_result {
            Ok(_) => println!("Transmitted broadcast packet"),
            Err(_) => println!("Failed to transmit broadcast packet"),
        };
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    loop {
        {
            let dev = Arc::new(SerialDevice::new("/dev/ttyACM1".to_string(), 921600));
            let (mut rx, _tx) = dev.open().unwrap();
            rx.on_data(Box::new(|data| {
                let mut buffer = "".to_string();
                for byte in data {
                    let ch = *byte as char;

                    if ch.is_ascii_graphic() {
                        buffer.push(ch);
                    } else {
                        buffer.push_str(&format!("\\x{:02x}", *byte));
                    }
                }
                println!("Received data: {}", buffer);
            }))
            .unwrap();

            let (stop_tx, stop_rx) = mpsc::channel();

            (|r: mpsc::Sender<_>| {
                rx.on_closed(Box::new(move || {
                    println!("Port Closed");
                    r.send(()).unwrap();
                }))
                .unwrap()
            })(stop_tx.clone());

            println!("Waiting for stop");
            stop_rx.recv().expect("Failed to receive stop signal");
            println!("Stop received, exiting");
        }
    }
}
