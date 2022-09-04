let game = Jotai.Utils.AtomWithReducer.make(Game.empty, Game.reducer)

let sum = Jotai.Atom.makeComputed(({get}) => get(game)->Game.getSum)
