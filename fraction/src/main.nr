mod fraction;
use dep::std;

fn main(x : u32, y : pub u32) {
    let z = fraction::toFraction(true, x, y);
    constrain y == z.den;
    let zinv = fraction::toFraction(false, y, x);
    constrain y == zinv.num;
    let w = fraction::multiplyFraction(z, zinv);
    constrain w.den == w.num;
    let p = fraction::addFraction(z, zinv);
    constrain !p.sign;
    constrain p.num == (y*y - x*x);
    let q = fraction::subtractFraction(z, zinv);
    constrain q.sign;
    constrain q.num == (y*y + x*x);
    let cmp = fraction::compareFraction(q, z);
    constrain cmp == 1;
    let z2 = fraction::toFraction(true, 2*x, 2*y);
    let cmp2 = fraction::compareFraction(z, z2);
    constrain cmp2 == 0;
    let a = 3;
    let b = 5;
    let mut c = 3;
    if (a == 3) & (b == 5){
        c = 1;
    }
    std::println(c);

    
}

#[test]
fn test_main() {
    main(1, 2);
    
    // Uncomment to make test fail
    // main(1, 1);
}
