fn div(x: i32, y: i32) -> Result<i32, &'static str> {
    if y != 0 {
        Ok(x/y)
    } else {
        Err("Divide by zero!")
    }
}

fn print_div_result1(result: Result<i32, &'static str>) {
    match result {
        //Ok(value)  => println!("value: {}", value),
        Err(error) => println!("error: {}", error)
    }
}

fn print_div_result2(result: Result<i32, &'static str>) {
    match result {
        Ok(value)  => println!("value: {}", value),
        //Err(error) => println!("error: {}", error)
    }
}

fn main() {
    let z1 = div(2, 1);
    print_div_result1(z1);

    let z2 = div(2, 0);
    print_div_result2(z2);
}

