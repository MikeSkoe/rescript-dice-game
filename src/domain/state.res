type t = Elevator.t;

type action =
    | Tick
    | RequestFloor(Floor.t);

let empty = Elevator.empty;

let reducer = (state, action) =>
    switch action {
        | Tick => Elevator.tick(state)
        | RequestFloor(floor) => Elevator.requestFloor(state, Some(floor))
    };
