mod signed;

fn main(x : u32, y : pub u32) {
    let z = signed::toSigned(true, x+y);
    constrain x+y == z.value;
    let w = signed::toSigned(true, y);
    let p = signed::addSigned(w, z);
    constrain p.value == (x + y + y);
    let q = signed::multiplySigned(w, p);
    constrain q.value == (x*y + y*y*2);
    let r = signed::divideSigned(q, w);
    constrain r.value == (x + 2*y);
    let s = signed::subtractSigned(r, w);
    constrain s.value == (x + y);
    let t = signed::modSigned(signed::negativeSigned(p), signed::negativeSigned(w));
    constrain t.value == x;
    constrain t.sign == false;
    
    let cmp = signed::compareSigned(w, r);
    constrain cmp == 2;
}

#[test]
fn test_main() {
    main(1, 2);
    
    
}
