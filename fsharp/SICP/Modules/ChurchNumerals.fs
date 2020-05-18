module ChurchNumerals

let zero = fun f -> fun x -> x
let one = fun f -> fun x -> f x
let two = fun f -> fun x -> f (f x)
let three = fun f -> fun x -> f (f (f x))

let rec church n = fun f -> 
    if n <= 0 
        then fun x -> x 
        else fun x -> f (church (n - 1) f x)

let sum n1 n2 = 
    let compose f g = fun x -> g (f x)
    compose n1 n2

let plus1 n = fun f -> fun x -> f ((n f) x)
