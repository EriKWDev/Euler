extern crate problems;

use std::env;

fn main() {
    if env::args().count() != 2 {
        println!("Please specify the problem number.");
        return;
    }

    let arg = env::args().nth(1).unwrap();
    let problem_number: i32 = arg.parse().ok().unwrap_or(1);

    println!("\nSolving Project Euler Problem #{}...\n", problem_number);

    match problem_number {
        1 => println!("Solution: {}", problems::p001::solve()),
        x @ _ => println!("Problem #{} has not been implemented yet.", x),
    }

    println!();
}
