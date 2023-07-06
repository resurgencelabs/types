

struct Option<T> {
    null: bool,
    else_value: T,
}

fn isNull<T>(o: Option<T>) -> bool {
    o.null
}

fn isSome<T>(o: Option<T>) -> bool {
    !o.null
}

fn get<T>(o: Option<T>, def: T) -> T {
    if (o.null){
        def
    }
    else {
        o.else_value
    }
}

fn make<T>(n: T) -> Option<T> {
    let op = Option {
        null: false,
        else_value: n,
    };
    op
}

fn unwrap<T>(o: Option<T>) -> T {
    assert (!o.null);
    o.else_value
}



fn assertSome<T>(o: Option<T>) {
    assert (!o.null);
}

fn assertNull<T>(o: Option<T>) {
    assert (o.null);
}


fn makeNull<T>(garb: T) -> Option<T> {
    let op = Option {
        null: true,
        else_value: garb,
    };
    op
}

fn unionNull<T>(o1: Option<T>, o2: Option<T>) -> bool {
    if o1.null {
        if o2.null {
            true
        }
        else {
            false
        }
    }
    else {
        if o2.null {
           false 
        }
        else {
           false
        }
    }
}


fn intersectionNull<T>(o1: Option<T>, o2: Option<T>) -> bool {
    if o1.null {
        if o2.null {
            true
        }
        else {
            true
        }
    }
    else {
        if o2.null {
           true 
        }
        else {
           false
        }
    }
}