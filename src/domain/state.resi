type t = Elevator.t

type action =
    | Tick
    | RequestFloor(Floor.t);

let empty: t;

let reducer: (t, action) => t;
