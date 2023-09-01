use dep::std;
global MAX: Fraction = Fraction { sign: true, num: 3050913689, den: 1 };
global MIN: Fraction = Fraction { sign: false, num: 3050913689, den: 1 };
global ZERO: Fraction = Fraction { sign: true, num: 0, den: 1 };
global ONE: Fraction = Fraction { sign: true, num: 1, den: 1 };
global NEGATIVE_ONE: Fraction = Fraction { sign: false, num: 1, den: 1 };

struct Fraction {
    sign: bool,
    num: u32,
    den: u32,
}

fn toFraction(s: bool, n: u32, d: u32) -> Fraction {
    assert (d != 0);
    let fr = Fraction {
        sign: s,
        num: n,
        den: d,
    };
    fr
}



fn invertFraction(f: Fraction) -> Fraction {
    assert (f.num != 0);
    let fr = Fraction {
        sign: f.sign,
        num: f.den,
        den: f.num,
    };
    fr
}


fn signChangeFraction(f: Fraction) -> Fraction {
    let fr = Fraction {
        sign: !f.sign,
        num: f.num,
        den: f.den,
    };
    fr
}

fn multiplyFraction(f1: Fraction, f2: Fraction) -> Fraction {
    let mut an = f1.num as u84;
    let mut ad = f1.den as u84;
    let mut bn = f2.num as u84;
    let mut bd = f2.den as u84;
    let mut m = f1;
    let mut n = f2;
    

    if ((an*bn > 2000000000) | (ad*bd > 2000000000)) {
        m = reduceFraction(m);
        n = reduceFraction(n);
    }

    an = m.num as u84;
    ad = m.den as u84;
    bn = n.num as u84;
    bd = n.den as u84;

    
    if ((an*bn > 2000000000) | (ad*bd > 2000000000)) {
        let mut c = Fraction{ sign: m.sign, num: m.num, den: n.den};
        let mut d = Fraction{ sign: n.sign, num: n.num, den: m.den};
        c = reduceFraction(c);
        d = reduceFraction(d);
        an = c.num as u84;
        ad = c.den as u84;
        bn = d.num as u84;
        bd = d.den as u84;
    }

    
    let mut ddd = (an*bn)/(ad*bd);
    let mut factor = 1 as u84;
    for i in 1..5{
        if ddd*10 < 2000000000 {
            factor *= 10;
            ddd = ddd * 10;
        }
    }
    
    if ((an*bn > 2000000000) | (ad*bd > 2000000000)) {
        let np = ((an*bn*factor)/(ad*bd)) as u32;
        //std::println(ddd);
        let fr = Fraction{
            sign: (f1.sign == f2.sign),
            num: np,
            den: factor as u32,
        };
        fr
        
    }
    else {
        let fr = Fraction {
            sign: (m.sign == n.sign),
            num: m.num*n.num,
            den: m.den*n.den,
        };
        fr
        
    }
    
    
}

fn divideFraction(f1: Fraction, f2: Fraction) -> Fraction {
    assert (f2.num != 0);
    let f3 = Fraction {
        sign: f2.sign,
        num: f2.den,
        den: f2.num,
    };
    let fr = multiplyFraction(f1, f3);
    
    fr
}

// this method will only work till numerator and denominator values are under 100
// this has been set for efficiency reasons, and will be modified once the Noir team
// can implement dynamic limit for loops
fn reduceFraction(f: Fraction) -> Fraction {
    let mut a = f.num;
    let mut b = f.den;
    let mut min = 0;
    let mut j = 1;
    let mut gcd = 1;
    if a > b {
        min = b;
    }
    else {
        min = a;
    }
    
    for i in 2..100{
        j = i as u32;
        if (j <= min){
            if (a%j == 0) & (b%j == 0){
                gcd = j;
            }
        }
    }
    
    
    let fr = Fraction {
        sign: f.sign,
        num: f.num/gcd,
        den: f.den/gcd,
    };
    fr
}

fn addFraction(f1: Fraction, f2: Fraction) -> Fraction {
    let mut an = f1.num as u84;
    let mut ad = f1.den as u84;
    let mut bn = f2.num as u84;
    let mut bd = f2.den as u84;
    let mut m = f1;
    let mut n = f2;

    if f1.sign == f2.sign {
       
        if ((ad*bd > 2000000000) | ((an*bd + ad*bn) > 2000000000)){
            m = reduceFraction(m);
            n = reduceFraction(n);
        }
        an = m.num as u84;
        ad = m.den as u84;
        bn = n.num as u84;
        bd = n.den as u84;
        if ((ad*bd > 2000000000) | ((an*bd + ad*bn) > 2000000000)){
            let mut ddd = (an*bd + ad*bn)/(ad*bd);
            let mut factor = 1 as u84;
            for i in 1..5{
                if ddd*10 < 2000000000 {
                    ddd *= 10;
                    factor *= 10;
                }
            }
            let np = (((an*bd + ad*bn)*factor)/(ad*bd)) as u32;
            let fr = Fraction {
                sign: f1.sign,
                num: np,
                den: factor as u32, 
            };
            fr
        }
        else {
            let fr = Fraction {
                sign: f1.sign,
                num: (m.num*n.den + n.num*m.den),
                den: m.den*n.den,
            };
            fr
        }
        
        
    }
    else {

        if ((an*bd) > (bn*ad)){
            if ((ad*bd > 2000000000) | ((an*bd - ad*bn) > 2000000000)){
                m = reduceFraction(m);
                n = reduceFraction(n);
            }
            an = m.num as u84;
            ad = m.den as u84;
            bn = n.num as u84;
            bd = n.den as u84;
            if ((ad*bd > 2000000000) | ((an*bd - ad*bn) > 2000000000)){
                let mut ddd = (an*bd - ad*bn)/(ad*bd);
                let mut factor = 1 as u84;
                for i in 1..5{
                    if ddd*10 < 2000000000 {
                        ddd *= 10;
                        factor *= 10;
                    }
                }
                let np = (((an*bd - ad*bn)*factor)/(ad*bd)) as u32;
                let fr = Fraction {
                    sign: f1.sign,
                    num: np,
                    den: factor as u32, 
                };
                fr
            }
            else {
                let fr = Fraction {
                    sign: f1.sign,
                    num: (m.num*n.den - n.num*m.den),
                    den: m.den*n.den,
                };
                fr
            }
        }
        else {
            if ((ad*bd > 2000000000) | ((bn*ad - bd*an) > 2000000000)){
                m = reduceFraction(m);
                n = reduceFraction(n);
            }
            an = m.num as u84;
            ad = m.den as u84;
            bn = n.num as u84;
            bd = n.den as u84;
            if ((ad*bd > 2000000000) | ((bn*ad - bd*an) > 2000000000)){
                let mut ddd = (bn*ad - bd*an)/(ad*bd);
                let mut factor = 1 as u84;
                for i in 1..5{
                    if ddd*10 < 2000000000 {
                        ddd *= 10;
                        factor *= 10;
                    }
                }
                let np = (((bn*ad - bd*an)*factor)/(ad*bd)) as u32;
                let fr = Fraction {
                    sign: f2.sign,
                    num: np,
                    den: factor as u32, 
                };
                fr
            }
            else {
                let fr = Fraction {
                    sign: f2.sign,
                    num: (n.num*m.den - m.num*n.den),
                    den: m.den*n.den,
                };
                fr
            }
        }
    }
}


fn subtractFraction(f1: Fraction, f2: Fraction) -> Fraction {
    let f3 = Fraction {
        sign: !f2.sign,
        num: f2.num,
        den: f2.den,
    };
    let fr = addFraction(f1, f3);
    
    fr
}

fn powerSmallFraction(f: Fraction, k: u8) -> Fraction {
    assert (k >= 1);
    assert (k < 10);
    assert ((f.num * 7) <= (11 * f.den));
    let mut n = f.num as u95;
    let mut d = f.den as u95;
    if f.den > 1000 {
        n = (n*1000)/d;
        d = 1000;
    }
    if n == 0{
        let fr = Fraction {
            sign: true,
            num: 0,
            den: 1,
        };
        fr
    }
    else {
        let mut nprod: u95 = 1;
        let mut dprod: u95 = 1;
        let mut s = true;
        if ((!f.sign) & (k % 2 == 1)){
            s = false;
        }
        for i in 1..10 {
            if i as u8 <= k {
                nprod = nprod * n;
                dprod = dprod * d;
            }
        }
        let new_num = ((nprod*10000)/dprod) as u32;
        let fr = Fraction {
            sign: s,
            num: new_num,
            den: 10000,
        };
        fr

    }
}


// if a > b return 1
// if a < b return 2
// if a == b return 0
fn compareFraction(f1: Fraction, f2: Fraction) -> u32 {
    if ((f1.num == f2.num) & (f1.num == 0)){
        0
    }
    else {
        if (f1.sign != f2.sign){
            if (f1.sign){
                1
            }
            else {
                2
            }
        }
        else {
            
            if ((f1.num*f2.den) > (f2.num*f1.den)){
                if (f1.sign){
                    1
                }
                else {
                    2
                }
            }
            else {
                
                if ((f1.num*f2.den) != (f2.num*f1.den)){
                    if (f1.sign){
                        2
                    }
                    else {
                        1
                    }
                }
                else {
                    0
                }
                
            }
            
        }
    }
    
}

fn squareFraction(f: Fraction) -> Fraction {
    let fr = Fraction {
        sign: true,
        num: f.num*f.num,
        den: f.den*f.den,
    };
    fr
}

fn cubeFraction(f: Fraction) -> Fraction {
    let fr = Fraction {
        sign: f.sign,
        num: f.num*f.num*f.num,
        den: f.den*f.den*f.den,
    };
    fr
}

fn incrFraction(f: Fraction) -> Fraction {
    let inc = Fraction {
        sign: true,
        num: 1,
        den: 1,
    };
    let fr = addFraction(f, inc);
    fr
}

fn decrFraction(f: Fraction) -> Fraction {
    let dec = Fraction {
        sign: true,
        num: 1,
        den: 1,
    };
    let fr = subtractFraction(f, dec);
    fr
}


fn isInteger(f: Fraction) -> bool {
    if f.den == 1 {
        true
    }
    else {
        false
    }
}


// Returns the closest but smaller Integer to the Given Fraction, but typecast to Fraction for convenience
fn floor(f: Fraction) -> Fraction {
    let q = f.num/f.den;
    if (q * f.den == f.num){
        let fr = Fraction{
            sign: f.sign,
            num: f.num,
            den: f.den,
        };
        fr
    }
    else {
        if f.sign {
            let fr = Fraction{
                sign: f.sign,
                num: q,
                den: 1,
            };
            fr    
        }
        else {
            let fr = Fraction{
                sign: f.sign,
                num: q + 1,
                den: 1,
            };
            fr 
        }
        
    }
}

// Returns the closest but greater Integer to the Given Fraction, but typecast to Fraction for convenience
fn ceiling(f: Fraction) -> Fraction {
    let q = f.num/f.den;
    if (q * f.den == f.num){
        let fr = Fraction{
            sign: f.sign,
            num: f.num,
            den: f.den,
        };
        fr
    }
    else {
        if f.sign {
            let fr = Fraction{
                sign: f.sign,
                num: q + 1,
                den: 1,
            };
            fr    
        }
        else {
            let fr = Fraction{
                sign: f.sign,
                num: q,
                den: 1,
            };
            fr 
        }
        
    }
}

// Splits a Fraction to its Integral Part (Still Cast to Fraction) and Fractional Part
fn split_approx(f: Fraction) -> (Fraction, Fraction) {
    if f.sign {
        let fl = floor(f);
        let f2 = subtractFraction(f, fl);
        let num_fl = (fl.num * 10000) as u56;
        let den_fl = fl.den as u56;
        let quo = (num_fl/den_fl) as u32;
        let fl2 = Fraction{
            sign: fl.sign,
            num: quo,
            den: 10000,
        };
        
        if ((f.num < 2000000000) & (f.den < 2000000000)) {
            (fl, f2)
        }
        else {
            (fl2, f2) 
        }
        
    }
    else {
        let ce = ceiling(f);
        let f2 = subtractFraction(ce, f);
        let num_ce = (ce.num * 10000) as u56;
        let den_ce = ce.den as u56;
        let quo = (num_ce/den_ce) as u32;
        let ce2 = Fraction{
            sign: ce.sign,
            num: quo,
            den: 10000,
        }; 
        
        if ((f.num < 2000000000) & (f.den < 2000000000)) {
            (ce, f2)
        }
        else {
            (ce2, f2) 
        }
    }
}


// an approximation of the Sine function using the Taylor series
// since pi is not "exactly" equal to 22/7, the results are only an approximation (4 decimal digits)
fn sin(x: Fraction) -> Fraction {
    let max = Fraction {
        sign: true,
        num: 44,
        den: 7,
    };
    assert (compareFraction(max, x) <= 1);
    assert (compareFraction(x, ZERO) <= 1);
    let mut f = x;
    let mut flag = true;
    let quart = Fraction {
        sign: true,
        num: 11,
        den: 7,
    };
    let mid = Fraction {
        sign: true,
        num: 22,
        den: 7,
    };
    let th_quart = Fraction {
        sign: true,
        num: 33,
        den: 7,
    };
    if (compareFraction(max, x) <= 1){
        f = subtractFraction(max, x);
        flag = false;
    }
    if (compareFraction(th_quart, x) <= 1){
        let f2 = subtractFraction(th_quart, x);
        f = subtractFraction(quart, f2);
        flag = false;
    }
    if (compareFraction(mid, x) <= 1){
        f = subtractFraction(mid, x);
        flag = true;
    }
    if (compareFraction(quart, x) <= 1){
        f = x;
        flag = true;
    }
    let mut sum = ZERO;
    
    let t1 = f;
    let t2 = divideFraction(powerSmallFraction(f, 3), toFraction(true, 6, 1));
    let t3 = divideFraction(powerSmallFraction(f, 5), toFraction(true, 120, 1));
    let t4 = divideFraction(powerSmallFraction(f, 7), toFraction(true, 5040, 1));
    let t5 = divideFraction(powerSmallFraction(f, 9), toFraction(true, 362880, 1));

    let s1 = addFraction(addFraction(t3, t5), t1);
    let s2 = addFraction(t2, t4);

    sum = subtractFraction(s1, s2);

    if !flag {
        sum = signChangeFraction(sum);
    }
    sum
}


// an approximation of the Cosine function using the Taylor series
// since pi is not "exactly" equal to 22/7, the results are only an approximation (4 decimal digits)
fn cos(x: Fraction) -> Fraction {
    let max = Fraction {
        sign: true,
        num: 44,
        den: 7,
    };
    assert (compareFraction(max, x) <= 1);
    assert (compareFraction(x, ZERO) <= 1);
    let mut f = x;
    let mut flag = true;
    let quart = Fraction {
        sign: true,
        num: 11,
        den: 7,
    };
    let mid = Fraction {
        sign: true,
        num: 22,
        den: 7,
    };
    let th_quart = Fraction {
        sign: true,
        num: 33,
        den: 7,
    };
    if (compareFraction(max, x) <= 1){
        f = subtractFraction(max, x);
        flag = true;
    }
    if (compareFraction(th_quart, x) <= 1){
        let f2 = subtractFraction(th_quart, x);
        f = subtractFraction(quart, f2);
        flag = false;
    }
    if (compareFraction(mid, x) <= 1){
        f = subtractFraction(mid, x);
        flag = false;
    }
    if (compareFraction(quart, x) <= 1){
        f = x;
        flag = true;
    }
    let mut sum = ONE;
    /*
    let mut part_sum = ONE;
    let mut fact: u32 = 1;
    let mut k: u32 = 0;
    for i in 1..12{
        part_sum = multiplyFraction(part_sum, f);
        fact = fact * (i as u32);
        let j = i as u32;
        if j % 2 == 0{
            let fact_to_fract = toFraction(true, fact, 1);
            let partial = divideFraction(part_sum, fact_to_fract);
            if k % 2 == 1 {
                sum = addFraction(sum, partial);
            }
            else {
                sum = subtractFraction(sum, partial);
            }
            k += 1;
        }
    }*/
    let t1 = toFraction(true, 1, 1);
    let t2 = divideFraction(powerSmallFraction(f, 2), toFraction(true, 2, 1));
    let t3 = divideFraction(powerSmallFraction(f, 4), toFraction(true, 24, 1));
    let t4 = divideFraction(powerSmallFraction(f, 6), toFraction(true, 720, 1));
    let t5 = divideFraction(powerSmallFraction(f, 8), toFraction(true, 40320, 1));

    let s1 = addFraction(addFraction(t3, t5), t1);
    let s2 = addFraction(t2, t4);

    sum = subtractFraction(s1, s2);
    if !flag{
        sum = signChangeFraction(sum);
    }
    sum
}