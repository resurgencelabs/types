mod fraction;
use dep::std;

fn main(x : u32, y : pub u32) {
    let z = fraction::toFraction(true, x, y);
    assert (y == z.den);
    let zinv = fraction::toFraction(false, y, x);
    assert (y == zinv.num);
    let w = fraction::multiplyFraction(z, zinv);
    assert (w.den == w.num);
    let p = fraction::addFraction(z, zinv);
    assert (!p.sign);
    assert (p.num == (y*y - x*x));
    let q = fraction::subtractFraction(z, zinv);
    assert (q.sign);
    assert (q.num == (y*y + x*x));
    let cmp = fraction::compareFraction(q, z);
    assert (cmp == 1);
    let z2 = fraction::toFraction(true, 2*x, 2*y);
    let cmp2 = fraction::compareFraction(z, z2);
    assert (cmp2 == 0);
    //let red = fraction::reduceFraction(z);
    //assert (red.num == 3);
    //commented out because too time draining
    let ic = fraction::incrFraction(z);
    assert (ic.num == (x+y));

    
}

#[test]
fn test_is_integer() {
    let f = fraction::toFraction(true, 3, 1);
    assert (fraction::isInteger(f));
    
    
}
