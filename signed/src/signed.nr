struct Signed {
    sign: bool,
    value: u32,
}

fn toSigned(s: bool, val: u32) -> Signed {
    let sn = Signed {
        sign: s,
        value: val,
    };
    sn
}

fn addSigned(s1: Signed, s2: Signed) -> Signed {
    if s1.sign == s2.sign {
        let sn = Signed {
            sign: s1.sign,
            value: s1.value+s2.value,
        };
        sn
    }
    else {
        if (s1.value > s2.value){
            let sn = Signed {
                sign: s1.sign,
                value: s1.value-s2.value,
            };
            sn
        }
        else {
            let sn = Signed {
                sign: s2.sign,
                value: s2.value-s1.value,
            };
            sn
        }
    }
}


fn subtractSigned(s1: Signed, s2: Signed) -> Signed {
    if s1.sign != s2.sign {
        let sn = Signed {
            sign: s1.sign,
            value: s1.value+s2.value,
        };
        sn
    }
    else {
        if (s1.value > s2.value){
            let sn = Signed {
                sign: s1.sign,
                value: s1.value-s2.value,
            };
            sn
        }
        else {
            let sn = Signed {
                sign: s2.sign,
                value: s2.value-s1.value,
            };
            sn
        }
    }
}

fn multiplySigned(s1: Signed, s2: Signed) -> Signed {
    let sn = Signed {
        sign: (s1.sign == s2.sign),
        value: s1.value*s2.value,
    };
    sn
}


fn divideSigned(s1: Signed, s2: Signed) -> Signed {
    constrain s2.value != 0;
    let sn = Signed {
        sign: (s1.sign == s2.sign),
        value: s1.value/s2.value,
    };
    sn
}