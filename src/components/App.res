%%raw("import './app.css'")

module List = Belt.List
module Int = Belt.Int

module ShuffleComp = {
    @react.component
    let make = () => {
        let (_, dispatch) = Jotai.Atom.use(State.game)

        <button onClick={_ => Game.Shuffle->dispatch}>
            {"Shuffle"->React.string}
        </button>
    }
}

module DiceRow = {
    @react.component
    let make = (~hand, ~dispatch) => {
        <div className="diceRow">
            {hand
                ->List.mapWithIndex((index, dice) => <DiceComp dice dispatch index/>)
                ->List.toArray
                ->React.array
            }
        </div>
    }
}

@react.component
let make = () => {
    let (state, dispatch) = Jotai.Atom.use(State.game)

    switch state {
        | Game.Play(hand, steps) => <div>
            <StepsComp steps={StepsLeft.toInt(steps)}/>
            <SumComp/>
            <DiceRow hand dispatch/>
            <ShuffleComp/>
        </div>
        | Game.Result(Game.Win) => <div>
            <h1>{"WIN"->React.string}</h1>
            <RestartComp dispatch/>
        </div>
        | Game.Result(Game.Loose) => <div>
            <h1>{"LOOSE"->React.string}</h1>
            <RestartComp dispatch/>
        </div>
    }
}
