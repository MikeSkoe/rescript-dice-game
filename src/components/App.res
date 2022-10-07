%%raw("import './app.css'")

module List = Belt.List
module Array = Belt.Array
module Int = Belt.Int
module AppState = State.AppState
module Selector = State.AppState.Selector

let rec classnames = (list, acc) =>
    switch list {
        | list{} => acc
        | list{(_, false), ...tail} => classnames(tail, acc)
        | list{(className, true), ...tail} => classnames(tail, `${acc} ${className}`)
    }

module FloorComp = {
    @react.component
    let make = (~floor, ~isTarget, ~isCurrent, ~dispatch) => {
        <div 
            className={classnames(list{
                ("floor", true),
                ("target", isTarget),
                ("current", isCurrent)
            }, "")}
            onClick={_ => State.RequestFloor(floor)->dispatch}
        >
            {floor->Floor.toString->React.string}
        </div>
    }
}

module FloorsRaw = {
    @react.component
    let make = (~children) => {
        <div className="floorsRaw">
            {Array.make(10, ())
                ->Array.mapWithIndex((index, _) => children(Floor.make(index)))
                ->Array.reverse
                ->React.array
            }
        </div>
    }
}

module ElevatorComp = {
    @react.component
    let make = (~isOpen) => {
        <div
            className={classnames(list{
                ("elevator", true),
                ("open", isOpen),
            }, "")}
        >
        </div>
    }
}

@react.component
let make = () => {
    let (state, dispatch) = React.useReducer(State.reducer, AppState.empty);

    React.useEffect0(
        () => {
            let timer = Js.Global.setInterval(() => dispatch(Tick), 500);

            Some(() => Js.Global.clearInterval(timer));
        },
    )

    <div className="app">
        <FloorsRaw>
            {floor => 
                <FloorComp
                    key={Floor.toString(floor)}
                    floor={floor}
                    isTarget={state->Selector.isTargetFloor(floor)}
                    isCurrent={state->Selector.isCurrentFloor(floor)}
                    dispatch={dispatch}
                />
            }
        </FloorsRaw>
        <ElevatorComp isOpen={state->Selector.isOpen} />
    </div>
}
