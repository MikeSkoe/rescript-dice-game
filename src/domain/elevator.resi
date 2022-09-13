type t;

let empty: t;

module Get: {
    let isTargetFloor: (t, Floor.t) => bool
    let isCurrentFloor: (t, Floor.t) => bool
    let isRequested: (t, Floor.t) => bool
    let isOpen: (t, Floor.t) => bool
}

let requestFloor: (t, option<Floor.t>) => t
let tick: t => t
