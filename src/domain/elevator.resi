module type FLOOR = {
  type t
  let empty: t
  let make: int => t
  let moveToward: (t, t) => t
}

module Make: (F: FLOOR) => {
  type t;

  let empty: t;
  let tick: t => t;
  let requestFloor: (t, F.t) => t;

  module Selector: {
    let isTargetFloor: (t, F.t) => bool;
    let isCurrentFloor: (t, F.t) => bool;
    let isOpen: (t) => bool;
  }
}
