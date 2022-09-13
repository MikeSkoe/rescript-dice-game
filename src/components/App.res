%%raw("import './app.css'")

module List = Belt.List
module Array = Belt.Array
module Int = Belt.Int

let rec classnames = (list: list<(string, bool)>, acc: string): string => switch list {
    | list{} => acc
    | list{(_, false), ...tail} => classnames(tail, acc)
    | list{(className, true), ...tail} => classnames(tail, `${acc} ${className}`)
}

module FloorComp = {
    @react.component
    let make = (~floor, ~isTarget, ~withElevator, ~isRequested, ~isOpen, ~dispatch) => {
        <div 
            className={classnames(list{
                ("floor", true),
                ("open", isOpen),
                ("target", isTarget),
                ("requested", isRequested),
                ("with-elevator", withElevator),
            }, "")}
            onClick={_ => State.RequestFloor(floor)->dispatch}
        >
            {floor->Floor.toString->React.string}
        </div>
    }
}

@react.component
let make = () => {
    let (state, dispatch) = React.useReducer(State.reducer, State.empty);

    React.useEffect0(
        () => {
            let timer = Js.Global.setInterval(() => dispatch(Tick), 500);

            Some(() => Js.Global.clearInterval(timer));
        },
    )

    <div>
        {Array.make(10,())
            ->Array.mapWithIndex((index, _) => Floor.ofInt(index))
            ->Array.map(floor =>
                <FloorComp
                    floor={floor}
                    isTarget={state->Elevator.Get.isTargetFloor(floor)}
                    withElevator={state->Elevator.Get.isCurrentFloor(floor)}
                    isRequested={state->Elevator.Get.isRequested(floor)}
                    isOpen={state->Elevator.Get.isOpen(floor)}
                    dispatch={dispatch}
                />
            )
            ->Array.reverse
            ->React.array
        }
    </div>
}
