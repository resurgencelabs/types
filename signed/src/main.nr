mod signed;
use dep::std;

fn main(x : u32, y : pub u32) {
    let z = signed::toSigned(true, x+y);
    assert (x+y == z.value);
    let w = signed::toSigned(true, y);
    let p = signed::addSigned(w, z);
    assert (p.value == (x + y + y));
    let q = signed::multiplySigned(w, p);
    assert (q.value == (x*y + y*y*2));
    let r = signed::divideSigned(q, w);
    assert (r.value == (x + 2*y));
    let s = signed::subtractSigned(r, w);
    assert (s.value == (x + y));
    let t = signed::modSigned(signed::negativeSigned(p), signed::negativeSigned(w));
    assert (t.value == x);
    assert (t.sign == false);

    
    
    let cmp = signed::compareSigned(w, r);
    assert (cmp == 2);

    

      

    

    

    
      
}

#[test]
fn test_mod1() {
    let a = signed::modSigned(signed::toSigned(true, 5), signed::toSigned(true, 2));
    assert (a.value == 1);
    
    
}

#[test]
fn test_incr_decr() {
    let s = signed::toSigned(true, 1);
    let inc = signed::incrSigned(s);

    let dec = signed::decrSigned(inc);
    assert (dec.value == s.value);
}

#[test]
fn test_lshift() {
    let n1 = signed::toSigned(true, 23);
    let n2 = signed::toSigned(false, 23);
    let ls1 = signed::leftShiftSigned(n1, 2);
    let ls2 = signed::leftShiftSigned(n2, 2);
    assert (ls1.value == 92);
    assert (ls1.value == ls2.value);
}

#[test]
fn test_rshift() {
    let n1 = signed::toSigned(true, 23);
    let n2 = signed::toSigned(false, 23);
    let rs1 = signed::rightShiftSigned(n1, 2);
    let rs2 = signed::rightShiftSigned(n2, 2);
    assert (rs1.value == 5);
    assert (rs2.value == 6);
}