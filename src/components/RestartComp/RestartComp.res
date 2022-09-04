@react.component
let make = (~dispatch) => {
    <button onClick={_ => dispatch(Game.Restart)}>
        {"restart"->React.string}
    </button>
}