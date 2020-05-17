module ChurchNumerals

let zero = fun f -> fun x -> x
let one = fun f -> fun x -> f x
let two = fun f -> fun x -> f (f x)
let plus1 n = fun f -> fun x -> f ((n f) x)
