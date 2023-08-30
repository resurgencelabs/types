mod fraction;
use dep::std;


fn main(x : u32, y : pub u32) {
    let z = fraction::toFraction(true, x, y);
    assert (y == z.den);
    let zinv = fraction::toFraction(false, y, x);
    assert (y == zinv.num);
    //let w = fraction::multiplyFraction(z, zinv);
    //assert (w.den == w.num);
    
    //let p = fraction::addFraction(z, zinv);
    //assert (!p.sign);
    //assert (p.num == (y*y - x*x));
    //let q = fraction::subtractFraction(z, zinv);
    //assert (q.sign);
    //assert (q.num == (y*y + x*x));
    //let cmp = fraction::compareFraction(q, z);
    //assert (cmp == 1);
    //let z2 = fraction::toFraction(true, 2*x, 2*y);
    //let cmp2 = fraction::compareFraction(z, z2);
    //assert (cmp2 == 0);
    
    //let red = fraction::reduceFraction(z);
    //assert (red.num == 3);
    //commented out because too time draining
    
    //let ic = fraction::incrFraction(z);
    //assert (ic.num == (x+y));
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(true, 2, 5);
    let sub = fraction::subtractFraction(f1, f2);
    
    let cmp3 = fraction::compareFraction(sub, fraction::toFraction(true, 1, 5));
    assert (cmp3 == 0);

   

    
}

/*

#[test]
fn test_is_integer() {
    let f = fraction::toFraction(true, 3, 1);
    assert (fraction::isInteger(f));
    
    
}


#[test]
fn test_mul() {
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(true, 5, 3);
    let m = fraction::multiplyFraction(f1, f2);
    
    assert (m.num == m.den);
}


#[test]
fn test_mul_large() {
    let f1 = fraction::toFraction(true, 3000000, 50);
    let f2 = fraction::toFraction(true, 50000, 3000);
    let m = fraction::multiplyFraction(f1, f2);
    assert (m.num < 4000000000);
    assert (m.den < 4000000000);
}

#[test]
fn test_mul_large2() {
    let f1 = fraction::toFraction(true, 33333333, 5);
    let f2 = fraction::toFraction(true, 500000, 33333333);
    let m = fraction::multiplyFraction(f1, f2);
    assert (m.num < 4000000000);
    assert (m.den < 4000000000);
}


#[test]
fn test_div() {
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(true, 1, 1);
    let d = fraction::divideFraction(f1, f2);
    
    assert (d.num == f1.num);
}


#[test]
fn test_div_large() {
    let f1 = fraction::toFraction(true, 3000000, 50);
    let f2 = fraction::toFraction(true, 50000, 300000);
    let d = fraction::divideFraction(f1, f2);
    assert (d.num < 4000000000);
    assert (d.den < 4000000000);
}
*/


#[test]
fn test_add() {
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(true, 5, 3);
    let a = fraction::addFraction(f1, f2);
    
    let x = a.num;
    assert (x == 34);
}


#[test]
fn test_add2() {
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(false, 5, 3);
    let a = fraction::addFraction(f1, f2);
    
    let x = a.num;
    assert (x == 16);
}

#[test]
fn test_add_large2() {
    let f1 = fraction::toFraction(true, 33333333, 5);
    let f2 = fraction::toFraction(true, 500000, 33333333);
    let a = fraction::addFraction(f1, f2);
    
    let x = a.num;
    let y = a.den;
    std::println(x);
    std::println(y);
}


#[test]
fn test_split() {
    let f = fraction::toFraction(true, 7, 3);
    let sp = fraction::split_approx(f);
    //let ss = sp.1.num;
    //std::println(ss);
    assert (fraction::isInteger(sp.0));
    assert (sp.1.den == 3);
    //assert (true);
    
}


#[test]
fn test_split2() {
    let f = fraction::toFraction(false, 7, 3);
    let sp = fraction::split_approx(f);
    assert (fraction::isInteger(sp.0));
    assert (sp.1.num == 1);
    
}


#[test]
fn test_mul_large2() {
    let f1 = fraction::toFraction(true, 33333333, 5);
    let f2 = fraction::toFraction(true, 500000, 77777);
    let m = fraction::multiplyFraction(f1, f2);
    
    let p = m.num;
    let q = m.den;
    let lm = p/q;
    assert (lm == 42857571);
    
}



#[test]
fn test_mul2() {
    let f1 = fraction::toFraction(true, 3, 5);
    let f2 = fraction::toFraction(true, 5, 7);
    let m = fraction::multiplyFraction(f1, f2);
    
    let p = m.num;
    let q = m.den;
    
    assert (p == 15);
    assert (q == 35);
    
}




#[test]
fn test_sin() {
    let f1 = fraction::toFraction(true, 43, 7);
    
    let res = fraction::sin(f1);
    
    let p = res.num;
    let q = res.den;
    let sig = res.sign;
    let mut fl = 0;
    if sig{
        fl = 1;
    }
    std::println(fl);
    std::println(p);
    std::println(q);
    
}

#[test]
fn test_cos() {
    let f1 = fraction::toFraction(true, 31, 7);
    
    let res = fraction::cos(f1);
    let sig = res.sign;
    let mut fl = 0;
    if sig{
        fl = 1;
    }
    std::println(fl);
    let p = res.num;
    let q = res.den;
    
    std::println(p);
    std::println(q);
    
}