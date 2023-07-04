mod result;
use dep::std;
use result::Result;

fn isSumEven(x: u32, y: u32) -> Result {
    if ((x+y) % 2 == 0){
        let rs = Result {
            status: true,
            message: "#########division of sum by 2 successful##########",
        };
        rs
    }
    else {
        let rs = Result {
            status: false,
            message: "#####exactly one of the given numbers is odd######",
        };
        rs
    }
}

fn main(x : u32, y : pub u32) {
    let r = isSumEven(x, y);
     // this "should" but currently will not until this bug is fixed on the Noir end 
     // https://github.com/noir-lang/noir/issues/1367   
    assert (!r.status);  
}

#[test]
fn test_main() {
    main(1, 2);
    
    
}
