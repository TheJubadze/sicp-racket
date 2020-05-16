module Geometry
open Pairs

let makePoint x y = cons x y
let xPoint p = car p
let yPoint p = cdr p

let makeSegment a b = cons a b
let startSegment s = car s
let endSegment s = cdr s
let lengthSegment s = 
    let a = startSegment s
    let b = endSegment s
    let x = abs (xPoint a - xPoint b)
    let y = abs (yPoint a - yPoint b)
    sqrt (x*x + y*y)

let makeRect topLeft bottomRight = cons topLeft bottomRight
let topLeftRect r = car r
let bottomRight r = cdr r
let heightRect r = abs (yPoint (topLeftRect r) - yPoint (bottomRight r))
let widthRect r = abs (xPoint (topLeftRect r) - xPoint (bottomRight r))
let perimeterRect r = heightRect r * 2.0 + widthRect r * 2.0;
let areaRect r = heightRect r * widthRect r;
