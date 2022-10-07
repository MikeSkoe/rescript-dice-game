module type FLOOR = {
    type t

    let empty: t
    let make: int => t
    let moveToward: (t, t) => t
}

module Make = (F: FLOOR) => {
    type t =
        | StandsAt(F.t)
        | MovingTo(F.t, F.t);

    let empty = StandsAt(F.empty);

    let tick = elevator =>
        switch elevator {
            | MovingTo(currFloor, targetFloor)
                if currFloor !== F.moveToward(currFloor, targetFloor)
                => MovingTo(F.moveToward(currFloor, targetFloor), targetFloor)
            | MovingTo(currFloor, _)
            | StandsAt(currFloor) => StandsAt(currFloor)
        }

    let requestFloor = (elevator, requested) =>
        switch elevator {
            | StandsAt(currFloor)
                if currFloor != requested
                => MovingTo(currFloor, requested)
            | MovingTo(_, _)
            | StandsAt(_) => elevator
        }

    module Selector = {
        let isTargetFloor = (elevator, floor) =>
            switch elevator {
                | MovingTo(_, targetFloor) => targetFloor == floor
                | StandsAt(_) => false
            }

        let isCurrentFloor = (elevator, floor) =>
            switch elevator {
                | MovingTo(currFloor, _)
                | StandsAt(currFloor) => currFloor == floor
            }

        let isOpen = (elevator) =>
            switch elevator {
                | StandsAt(_) => true
                | MovingTo(_, _) => false
            }
    }
}
