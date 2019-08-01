struct TicTacToeBrain {
    
    // MARK: - Internal Methods
    
    mutating func makeMove(location: BoardLocation) -> GameState {
        guard location.row <= 2 && location.column <= 3 else { fatalError("Invalid location") }
        let gameState = gameBoard.makeMove(at: location, with: currentPlayer.symbol)
        currentPlayer.toggle()
        return gameState
    }
    
    // MARK: - Private Properties
    
    private(set) var currentPlayer = Player.playerOne
    private var gameBoard = GameBoard()
}
