module Pairs

let cons a b = fun msg -> 
    match msg with
    | "CAR" -> a
    | _ -> b

let car p = p "CAR"
let cdr p = p "CDR"
