type t = int;
type shift = Up | Down | Still;

let empty = 0;

let make = floor => floor;
let toString = Belt.Int.toString;

let getShift = (floorA, floorB) =>
    switch (floorA, floorB) {
        | (a, b) if a > b => Down
        | (a, b) if a < b => Up
        | _ => Still
    }

let shiftBy = (floor, shift) =>
    switch shift {
        | Up => floor + 1
        | Down => floor - 1
        | Still => floor
    }

let moveToward = (current, target) =>
    current
    ->getShift(target)
    ->shiftBy(current, _)
