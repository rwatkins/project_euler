fn problem1() -> u64 {
    (1..1000)
        .filter(|n| n % 3 == 0 || n % 5 == 0)
        .fold(0, |acc, n| acc + n)
}


fn problem2() -> u64 {
    let mut a = 1;
    let mut b = 2;
    let mut sum = 0;

    while b < 4_000_000 {
        if b % 2 == 0 {
            sum += b;
        }
        let tmp = a;
        a = b;
        b = tmp + b;
    }

    sum
}


fn main() {
    println!("Problem 1");
    println!("{}", problem1());

    println!("Problem 2");
    println!("{}", problem2());
}
