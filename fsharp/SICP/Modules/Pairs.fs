module Pairs

let cons a b = fun m -> m a b
let car z = z (fun a b -> a)
let cdr z = z (fun a b -> b)
