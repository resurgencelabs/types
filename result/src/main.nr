mod result;
use dep::std;
use result::Result;

fn isSumEven(x: u32, y: u32) -> Result {
    if ((x+y) % 2 == 0){
        let msg: str<50> = "#########division of sum by 2 successful##########";
        let rs = Result {
            status: true,
            message: msg,
        };
        rs
    }
    else {
        let msg: str<50> = "#####exactly one of the given numbers is odd######";
        let rs = Result {
            status: false,
            message: msg,
        };
        rs
    }
}

fn main(x : u32, y : pub u32) {
    //let r = isSumEven(x, y);
     // this "should" but currently will not until this bug is fixed on the Noir end 
     // https://github.com/noir-lang/noir/issues/1367   
    //assert (!r.status);
    assert (x != y);
      
}

#[test]
fn test_main() {
    main(1, 2);
    
    
}
