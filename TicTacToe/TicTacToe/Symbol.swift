enum Symbol: String {
    case playerOne = "X"
    case playerTwo = "O"
    case blank = "_"
    init(player: Player) {
        switch player {
        case .playerOne: self = .playerOne
        case .playerTwo: self = .playerTwo
        }
    }
}
