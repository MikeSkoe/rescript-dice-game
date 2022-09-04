module List = Belt.List

type result = Win | Loose

type t = Play(Hand.t, StepsLeft.t) | Result(result)

type action =
    | Restart
    | Shuffle
    | Toggle(int)

let empty = Play(Hand.empty, StepsLeft.empty)

let reducer = (game, action) => switch (game, action) {
    | (Play(hand, steps), Shuffle) =>
        if StepsLeft.next(steps) == StepsLeft.Done {
            Result(Hand.isEnough(hand) ? Win : Loose)
        } else {
            Play(hand->Hand.shuffle, StepsLeft.next(steps))
        }
    | (Play(hand, steps), Toggle(index)) => {
        if hand
            ->Hand.toggleAt(index)
            ->List.keep(Dice.isInGame)
            ->List.length == 5 {
            Result(Hand.isEnough(hand) ? Win : Loose)
        } else {
            Play(hand->Hand.toggleAt(index), steps)
        }
    }
    | (_, Restart) => empty
    | _ => game
}

let getSum = game => switch game {
    | Play(hand, _) => hand->Hand.getSum
    | Result(_) => 0
}
