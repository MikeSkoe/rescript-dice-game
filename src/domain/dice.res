type side = One | Two | Three | Four | Five | Six;

type t =
    | InGame(side)
    | Pulled(side)

let empty = InGame(One)

let toggle = dice => switch dice {
    | InGame(side) => Pulled(side)
    | Pulled(side) => InGame(side)
}

let sideToNum = side => switch side {
    | One => 1 
    | Two => 2 
    | Three => 3 
    | Four => 4 
    | Five => 5 
    | Six => 6 
}

let toNum = dice => switch dice {
    | InGame(side)
    | Pulled(side) => side->sideToNum
}

let getRandom = () => {
    switch Js.Math.random_int(1, 7) {
        | 1 => One
        | 2 => Two
        | 3 => Three
        | 4 => Four
        | 5 => Five
        | 6 => Six
        | _ => One
    }
}

let shuffle = dice => switch dice {
    | InGame(_) => getRandom()->InGame
    | Pulled(side) => Pulled(side)
}

let isInGame = dice => switch dice {
    | InGame(_) => false
    | Pulled(_) => true
}
