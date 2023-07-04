

struct Result {
    status: bool,
    message: str<50>,
    
}

fn toResult(s: bool, m: str<50>) -> Result {
    let rs = Result {
        status: s,
        message: m,
        
    };
    rs
}

fn reverseResult(r: Result) -> Result {
    let rs = Result {
        status: !r.status,
        message: r.message,
        
    };
    rs
}

fn combineResult(r1: Result, r2: Result) -> Result {
    if r1.status != r2.status {
        if r1.status {
            let rs = Result {
                status: false,
                message: r2.message,
                
            };
            rs
        }
        else {
            let rs = Result {
                status: false,
                message: r1.message,
                
            };
            rs
        }
    }
    else {
        if r1.status {
            let rs = Result {
                status: true,
                message: "###############all conditions passed##############", //currently we don't have free allocation of strings in noir
                                                                                // so we must choose a size, say 50, and pad all smaller 
            };                                                                  // messages to that size
            rs
        }
        else {
            let rs = Result {
                status: false,
                message: "###############all conditions failed##############",
                
            };
            rs
        }
    }
}


fn getStatus(r: Result) -> bool {
    r.status
}

fn getMessage(r: Result) -> str<50> {
    r.message
}