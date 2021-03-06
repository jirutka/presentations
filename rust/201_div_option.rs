fn div(x: i32, y: i32) -> Option<i32> {
    if y != 0 {
        Some(x/y)
    }
    else {
        None
    }
}

fn main() {
    let z1 = div(2, 1);
    println!("{:?}", z1);

    let z2 = div(2, 0);
    println!("{:?}", z2);
}

