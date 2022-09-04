%%raw("import './dice.css'")

@react.component
let make = (~dice, ~dispatch, ~index) => {
    <div
        onClick={_ => Game.Toggle(index)->dispatch}
        className={"dice" ++ switch dice {
            | Dice.Pulled(_) => " dice--pulled"
            | Dice.InGame(_) => ""
        }}
    >
        {dice
            ->Dice.toNum
            ->Belt.Int.toString
            ->React.string
        }
    </div>
}
