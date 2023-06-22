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

    let inc = signed::incrSigned(w);
    assert (inc.value == (y+1));

    let dec = signed::decrSigned(w);
    assert (dec.value == (y-1));

    let mut count = 0;
    let mut cnt = 0;
    let mut iter = 0;

    for i in 1..10 {
        if (iter < 25){
            for j in 1..5{
                count = count + 1;
                iter += 1;
                cnt = j;
                if (i < 25){
                    cnt = i;
                }
            };
            
        }
        
        
    };
    

    std::println(count);    
      
}

#[test]
fn test_main() {
    main(1, 2);
    
    
}
