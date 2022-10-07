module Option = Belt.Option;

let a = Some(1);
let b = Some(2);

let flatMap2 = (a, b, fn) => switch (a, b) {
    | (Some(a), Some(b)) => fn(a, b);
    | _ => None;
}

let res = flatMap2(a, b, (a, b) => Some(a + b))
