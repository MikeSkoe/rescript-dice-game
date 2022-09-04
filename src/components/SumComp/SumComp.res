module Int = Belt.Int

@react.component
let make = () => {
    let sum = Jotai.Utils.useAtomValue(State.sum)

    <h1>
        {("sum: " ++ sum->Int.toString)
            ->React.string}
    </h1>
}
