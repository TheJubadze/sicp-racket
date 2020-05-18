// Learn more about F# at https://fsharp.org
// See the 'F# Tutorial' project for more help.
module Main
open Geometry
open ChurchNumerals

[<EntryPoint>]
let main argv =
    //let s = makeSegment (makePoint 2.0 10.1) (makePoint 0.0 72.0)
    //let r = makeRect (makePoint 0.0 10.0) (makePoint 10.0 0.0)
    //let ch5 = zero plus1
    //printfn "%A" (perimeterRect r)
    //printfn "%A" (areaRect r)
    
    let f = fun x -> x + 1
    printfn "%A" (plus1 two f 0)
    printfn "%A" (three f 0)
    printfn "%A" (sum (church 12 f) (church 65 f) 0)

    0 // return an integer exit code
