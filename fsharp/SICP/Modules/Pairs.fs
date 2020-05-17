module Pairs

let cons a b = fun msg -> 
    match msg with
    | 1 -> a
    | _ -> b

let car p = p 1
let cdr p = p 0
