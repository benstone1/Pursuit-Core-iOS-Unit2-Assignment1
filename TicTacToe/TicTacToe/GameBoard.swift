struct GameBoard {
    
    // MARK: - Internal Methods
    
    mutating func makeMove(at location: BoardLocation, with symbol: Symbol) -> GameState {
        arr[location.row][location.column] = symbol
        return currentGameState
    }
    
    // MARK: - Private properties
    
    private var arr = Array(repeating: Array(repeating: Symbol.blank, count: 3), count: 3)
    
    private var currentGameState: GameState {
        if let horizontalVictor = horizontalVictor() {
            return .victory(horizontalVictor)
        } else if let verticalVictor = verticalVictor() {
            return .victory(verticalVictor)
        } else if let diagVictor = diagVictor() {
            return .victory(diagVictor)
        } else {
            return .inProgress
        }
    }

    // MARK: - Private functions
    
    private func horizontalVictor() -> Player? {
        for player in [Player.playerOne, Player.playerTwo] {
            if arr.reduce(false, { $0 || $1.filter { $0 == player.symbol }.count == $1.count }) {
                return player
            }
        }
        return nil
    }
    
    private func verticalVictor() -> Player? {
        for player in [Player.playerOne, Player.playerTwo] {
            for column in 0..<arr.count {
                var playerCount = 0
                for row in 0..<arr.count {
                    if arr[row][column] == player.symbol {
                        playerCount += 1
                    }
                }
                if playerCount == arr.count {
                    return player
                }
            }
        }
        return nil
    }
    
    private func diagVictor() -> Player? {
        for player in [Player.playerOne, Player.playerTwo] {
            var playerCountToTopRight = 0
            var playerCountToBottomRight = 0
            for index in 0..<arr.count {
                if arr[index][index] == player.symbol {
                    playerCountToBottomRight += 1
                }
                if arr[arr.count - 1 - index][index] == player.symbol {
                    playerCountToTopRight += 1
                }
            }
            if playerCountToTopRight == arr.count || playerCountToBottomRight == arr.count {
                return player
            }
        }
        return nil
    }
}
