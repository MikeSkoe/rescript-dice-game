type t = int;

let empty = 0;

let toString = Belt.Int.toString;

let ofInt = floor => floor;

let shiftBy = (floor, shift) => floor + shift;
