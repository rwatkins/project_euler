fn problem1() -> u64 {
    (1..1000)
        .filter(|n| n % 3 == 0 || n % 5 == 0)
        .fold(0, |acc, n| acc + n)
}

fn main() {
    println!("Problem 1");
    println!("{}", problem1());
}
