// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Game from "../domain/game.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as Atom$Jotai from "@fattafatta/rescript-jotai/src/Atom.bs.js";
import * as Utils from "jotai/utils";

var game = Utils.atomWithReducer(Game.empty, Game.reducer);

var sum = Atom$Jotai.makeComputed(function (param) {
      return Game.getSum(Curry._1(param.get, game));
    });

export {
  game ,
  sum ,
  
}
/* game Not a pure module */
