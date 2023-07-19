mod phy_vector;
use dep::std;
use dep::fraction;

fn main(x : u32, y : pub u32) {
    assert ((x > y) | (x < y));
    let f1 = fraction::toFraction(true, 1, 1);
    let f2 = fraction::toFraction(true, 2, 1);
    let f3 = fraction::toFraction(true, 3, 1);
    let v1 = phy_vector::toVector(f1, f2, f3);
    
    let vvp = phy_vector::vecProductVector(v1, v1);
    let a = vvp.i.num;
    let b = vvp.j.num;
    let c = vvp.k.num;
    std::println(a);
    std::println(b);
    std::println(c);

    
}

#[test]
fn test_create_vector() {
    let f1 = fraction::toFraction(true, 2, 5);
    let f2 = fraction::toFraction(true, 1, 5);
    let f3 = fraction::toFraction(true, 3, 5);
    let v = phy_vector::toVector(f1, f2, f3);
    assert (v.i.num == 2);
    
    
}


#[test]
fn test_sum_vector() {
    let f1 = fraction::toFraction(true, 2, 5);
    let f2 = fraction::toFraction(true, 1, 6);
    let f3 = fraction::toFraction(true, 3, 7);
    let v1 = phy_vector::toVector(f1, f2, f3);
    let f4 = fraction::toFraction(true, 1, 5);
    let f5 = fraction::toFraction(true, 4, 6);
    let f6 = fraction::toFraction(true, 3, 7);
    let v2 = phy_vector::toVector(f4, f5, f6);
    let vsum = phy_vector::addVector(v1, v2);
    assert (vsum.k.num == 42); //because we aren't reducing the fraction to standard state
    assert (fraction::compareFraction(vsum.j, fraction::toFraction(true, 30, 36)) == 0);
    
    
}

#[test]
fn test_scalar_product_vector() {
    let f1 = fraction::toFraction(true, 1, 1);
    let f2 = fraction::toFraction(true, 1, 1);
    let f3 = fraction::toFraction(true, 1, 1);
    let v1 = phy_vector::toVector(f1, f2, f3);
    let f4 = fraction::toFraction(true, 1, 1);
    let f5 = fraction::toFraction(true, 1, 1);
    let f6 = fraction::toFraction(true, 1, 1);
    let v2 = phy_vector::toVector(f4, f5, f6);
    let vsp = phy_vector::scProductVector(v1, v2);
    assert (vsp.num == 3); 
    
    
    
}


#[test]
fn test_vector_product_vector() {
    let f1 = fraction::toFraction(true, 1, 1);
    let f2 = fraction::toFraction(true, 2, 1);
    let f3 = fraction::toFraction(true, 3, 1);
    let v1 = phy_vector::toVector(f1, f2, f3);
    
    let vvp = phy_vector::vecProductVector(v1, v1);
    assert (vvp.i.num == 0); 
    assert (vvp.j.num == 0); 
    assert (vvp.k.num == 0); 
    
    
    
}
