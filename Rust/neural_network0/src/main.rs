use rand::Rng;

fn main() {
    let inputs: [f64; 4] = [1.0, 2.0, 3.0, 2.5];
    let mut rng = rand::thread_rng();
    let weights1: [f64; 4] = [rng.gen(), rng.gen(), rng.gen(), rng.gen()];
    let weights2: [f64; 4] = [rng.gen(), rng.gen(), rng.gen(), rng.gen()];
    let weights3: [f64; 4] = [rng.gen(), rng.gen(), rng.gen(), rng.gen()];

    let bias1: f64 = 0.0;
    let bias2: f64 = 0.0;
    let bias3: f64 = 0.0;

    let output = [
        dot_product(&inputs, &weights1) + bias1,
        dot_product(&inputs, &weights2) + bias2,
        dot_product(&inputs, &weights3) + bias3,
    ];

    println!("The output is: {:?}", round_output(&output, 4));
}

fn dot_product(a: &[f64; 4], b: &[f64; 4]) -> f64 {
    a.iter().zip(b.iter()).map(|(x, y)| x * y).sum()
}

fn round_output(values: &[f64; 3], decimal_places: i32) -> Vec<f64> {
    let factor = 10.0_f64.powi(decimal_places);
    values.iter().map(|&x| (x * factor).round() / factor).collect()
}
