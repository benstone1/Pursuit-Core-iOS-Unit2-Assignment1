enum Player {
    case playerOne
    case playerTwo
    var symbol: Symbol {
        return Symbol(player: self)
    }
    mutating func toggle() {
        switch self {
        case .playerOne: self = .playerTwo
        case .playerTwo: self = .playerOne
        }
    }
}
