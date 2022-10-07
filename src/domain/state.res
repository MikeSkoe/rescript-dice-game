module AppState = Elevator.Make(Floor);

type t = AppState.t;

type action =
    | Tick
    | RequestFloor(Floor.t);

let empty = AppState.empty;

let reducer = (state, action) =>
    switch action {
        | Tick => AppState.tick(state)
        | RequestFloor(floor) => AppState.requestFloor(state, floor)
    };
