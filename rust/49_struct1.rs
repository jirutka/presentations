struct Complex {
    real: f32,
    imag: f32,
}

fn main() {
    let c1 = Complex{real:0.0, imag:0.0};
    println!("complex number: {}+{}i", c1.real, c1.imag);
}

