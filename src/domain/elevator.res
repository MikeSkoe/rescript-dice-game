type direction =
    | Waiting
    | MovingTo(Floor.t);

type t = {
    direction: direction,
    currentFloor: Floor.t,
    requestedFloor: option<Floor.t>,
};

let empty = {
    direction: Waiting,
    currentFloor: Floor.empty,
    requestedFloor: None,
}

module Get = {
    let isTargetFloor = ({ direction }, floor) =>
        switch direction {
            | MovingTo(targetFloor) => targetFloor === floor
            | Waiting => false
        }

    let isCurrentFloor = ({ currentFloor }, floor) =>
        floor === currentFloor

    let isRequested = ({ requestedFloor }, floor) =>
        switch requestedFloor {
            | Some(requested) => floor == requested
            | None => false
        }

    let isOpen = ({ currentFloor, direction }, floor) =>
        direction === Waiting
        && floor == currentFloor
}

let startMoveIfRequested = ({ direction, currentFloor, requestedFloor }) =>
    switch (requestedFloor, direction) {
        | (Some(requested), Waiting) =>
            {
                direction: MovingTo(requested),
                requestedFloor: None,
                currentFloor,
            }
        | _ => ({ direction, currentFloor, requestedFloor })
    }

let getShift = ({ direction, currentFloor }) =>
    switch direction {
        | MovingTo(targetFloor) if targetFloor < currentFloor => -1
        | MovingTo(targetFloor) if targetFloor > currentFloor => 1
        | Waiting | MovingTo(_) => 0
    }

let applyShift = (shift, { direction, currentFloor, requestedFloor }) =>
    {
        direction: shift === 0 ? Waiting : direction,
        currentFloor: currentFloor->Floor.shiftBy(shift),
        requestedFloor,
    };

let shiftIfMoving = elevator =>
    elevator
    ->getShift
    ->applyShift(elevator)

let tick = elevator =>
    elevator
    ->startMoveIfRequested
    ->shiftIfMoving

let requestFloor = (elevator, requested) =>
    switch elevator.requestedFloor {
        | None => { ...elevator, requestedFloor: requested }
        | Some(_) => elevator
    }
