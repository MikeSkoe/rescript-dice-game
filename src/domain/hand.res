module List = Belt.List

type t = list<Dice.t>

let handLength = 5

let empty: t = handLength
    ->List.make(Dice.empty)
    ->List.map(Dice.shuffle)

let shuffle = hand =>
    hand
    ->List.map(Dice.shuffle)

let toggleAt = (hand, index) =>
    hand
    ->List.mapWithIndex((i, dice) => i == index ? Dice.toggle(dice) : dice)

let getSum = hand =>
    hand
    ->List.map(Dice.toNum)
    ->List.reduce(0, (sum, diceSum) => sum + diceSum)

let isEnough = hand =>
    hand
    ->getSum
    ->num => num > 25
