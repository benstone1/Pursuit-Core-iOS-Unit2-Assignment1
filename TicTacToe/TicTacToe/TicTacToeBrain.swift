struct TicTacToeBrain {
    
    // MARK: - Internal Methods
    
    mutating func makeMove(location: BoardLocation) -> GameState {
        guard location.row <= 2 && location.column <= 3 else { fatalError("Invalid location") }
        let gameState = gameBoard.makeMove(at: location)
        return gameState
    }
    
    var currentPlayer: Player {
        return gameBoard.currentPlayer
    }
    
    // MARK: - Private Properties
    
    private var gameBoard = GameBoard()
}
