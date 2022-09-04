// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Dice from "../../domain/dice.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

import './dice.css'
;

function DiceComp(Props) {
  var dice = Props.dice;
  var dispatch = Props.dispatch;
  var index = Props.index;
  var tmp;
  tmp = dice.TAG === /* InGame */0 ? "" : " dice--pulled";
  return React.createElement("div", {
              className: "dice" + tmp,
              onClick: (function (param) {
                  return Curry._1(dispatch, /* Toggle */{
                              _0: index
                            });
                })
            }, String(Dice.toNum(dice)));
}

var make = DiceComp;

export {
  make ,
  
}
/*  Not a pure module */