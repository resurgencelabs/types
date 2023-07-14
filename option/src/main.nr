mod option;
use dep::std;

fn main(x : u32, y : pub Field) {
    let o1 = option::make(x);
    assert (option::isSome(o1));

    let o2 = option::make(y);
    assert (!option::isNull(o2));

    assert (!option::intersectionNull(o1, o1));


    let nullOpt: option::Option<u32> = option::makeNull();

    assert (nullOpt.else_value == 0);
    assert (nullOpt.null);
    
    

    
      
}

#[test]
fn test_main() {
    main(1, 2);
    
    
}
