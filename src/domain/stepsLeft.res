type t = Steps(int) | Done

let empty: t = Steps(5);

let next = t => switch t {
    | Steps(steps) if steps > 1 => Steps(steps - 1)
    | Steps(_) => Done
    | Done => Done
}

let toInt = t => switch t {
    | Steps(steps) => steps
    | Done => 0
}
