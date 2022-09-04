// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Js_math from "rescript/lib/es6/js_math.js";

function toggle(dice) {
  if (dice.TAG === /* InGame */0) {
    return {
            TAG: /* Pulled */1,
            _0: dice._0
          };
  } else {
    return {
            TAG: /* InGame */0,
            _0: dice._0
          };
  }
}

function sideToNum(side) {
  return side + 1 | 0;
}

function toNum(dice) {
  return dice._0 + 1 | 0;
}

function getRandom(param) {
  var match = Js_math.random_int(1, 7);
  if (match > 6 || match < 1) {
    return /* One */0;
  } else {
    return match - 1 | 0;
  }
}

function shuffle(dice) {
  if (dice.TAG === /* InGame */0) {
    return {
            TAG: /* InGame */0,
            _0: getRandom(undefined)
          };
  } else {
    return {
            TAG: /* Pulled */1,
            _0: dice._0
          };
  }
}

function isInGame(dice) {
  if (dice.TAG === /* InGame */0) {
    return false;
  } else {
    return true;
  }
}

var empty = {
  TAG: /* InGame */0,
  _0: /* One */0
};

export {
  empty ,
  toggle ,
  sideToNum ,
  toNum ,
  getRandom ,
  shuffle ,
  isInGame ,
  
}
/* No side effect */