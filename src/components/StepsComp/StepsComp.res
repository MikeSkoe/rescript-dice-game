module Int = Belt.Int

@react.component
let make = (~steps) => {
    <h1>
        {steps
            ->Int.toString
            ->sum => `Steps left: ${sum}`
            ->React.string
        }
    </h1>
}
