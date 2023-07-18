use dep::fraction;

global MAX: Phy_Vector = Phy_Vector { i: fraction::MAX, j: fraction::MAX, k: fraction::MAX  };
global MIN: Phy_Vector = Phy_Vector { i: fraction::MIN, j: fraction::MIN, k: fraction::MIN  };
global ZERO: Phy_Vector = Phy_Vector { i: fraction::ZERO, j: fraction::ZERO, k: fraction::ZERO };
global ONE: Phy_Vector = Phy_Vector { i: fraction::ONE, j: fraction::ONE, k: fraction::ONE };
global NEGATIVE_ONE: Phy_Vector = Phy_Vector { i: fraction::NEGATIVE_ONE, j: fraction::NEGATIVE_ONE, k: fraction::NEGATIVE_ONE };
global ONE_X: Phy_Vector = Phy_Vector { i: fraction::ONE, j: fraction::ZERO, k: fraction::ZERO };
global NEGATIVE_ONE_X: Phy_Vector = Phy_Vector { i: fraction::NEGATIVE_ONE, j: fraction::ZERO, k: fraction::ZERO };
global ONE_Y: Phy_Vector = Phy_Vector { i: fraction::ZERO, j: fraction::ONE, k: fraction::ZERO };
global NEGATIVE_ONE_Y: Phy_Vector = Phy_Vector { i: fraction::ZERO, j: fraction::NEGATIVE_ONE, k: fraction::ZERO };
global ONE_Z: Phy_Vector = Phy_Vector { i: fraction::ZERO, j: fraction::ZERO, k: fraction::ONE };
global NEGATIVE_ONE_Z: Phy_Vector = Phy_Vector { i: fraction::ZERO, j: fraction::ZERO, k: fraction::NEGATIVE_ONE };

struct Phy_Vector {
    i: fraction::Fraction,
    j: fraction::Fraction,
    k: fraction::Fraction,
}

fn toVector(fi: fraction::Fraction, fj: fraction::Fraction, fk: fraction::Fraction) -> Phy_Vector {
    
    let vc = Phy_Vector {
        i: fi,
        j: fj,
        k: fk,
    };
    vc
}



fn xOfVector(v: Phy_Vector) -> fraction::Fraction {
    v.i
}

fn yOfVector(v: Phy_Vector) -> fraction::Fraction {
    v.j
}

fn zOfVector(v: Phy_Vector) -> fraction::Fraction {
    v.k
}


fn addVector(v1: Phy_Vector, v2: Phy_Vector) -> Phy_Vector {
    let vc = Phy_Vector {
        i: fraction::addFraction(v1.i, v2.i),
        j: fraction::addFraction(v1.j, v2.j),
        k: fraction::addFraction(v1.k, v2.k),
    };
    vc
}

fn subtractVector(v1: Phy_Vector, v2: Phy_Vector) -> Phy_Vector {
    let vc = Phy_Vector {
        i: fraction::subtractFraction(v1.i, v2.i),
        j: fraction::subtractFraction(v1.j, v2.j),
        k: fraction::subtractFraction(v1.k, v2.k),
    };
    vc
}