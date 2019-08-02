import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var allGameButtons: [GameButton]!
    @IBOutlet var gameInfoLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    // MARK: - Internal Properties
    
    var gameBrain = TicTacToeBrain()
    
    var gameState = GameState.inProgress(.playerOne) {
        didSet {
            handleNewGameState(gameState)
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func enterGameMove(_ sender: GameButton) {
        sender.isEnabled = false
        sender.setTitle(gameBrain.currentPlayer.symbol.rawValue, for: .normal)
        gameState = gameBrain.makeMove(location: BoardLocation(row: sender.row, column: sender.col))
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        playAgainButton.isHidden = true
        setAllGameButtons(to: .enabled(isBlank: true))
        gameBrain = TicTacToeBrain()
        gameInfoLabel.text = "Player one's turn."
    }
    
    // MARK: - Private functions
    
    private func handleNewGameState(_ gameState: GameState) {
        switch gameState {
        case let .inProgress(currentPlayer):
            handleGameInProgress(with: currentPlayer)
        case .tie:
            handleTieGame()
        case let .victory(winningPlayer):
            handleVictory(with: winningPlayer)
        }
    }
    
    private func handleGameInProgress(with currentPlayer: Player) {
        let currentTurnText: String
        switch currentPlayer {
        case .playerOne: currentTurnText = "Player one's turn."
        case .playerTwo: currentTurnText = "Player two's turn."
        }
        gameInfoLabel.text = currentTurnText
    }
    
    private func handleTieGame() {
        gameInfoLabel.text = "Tie game."
    }
    
    private func handleVictory(with winningPlayer: Player) {
        let victoryText: String
        switch winningPlayer {
        case .playerOne: victoryText = "Player one wins."
        case .playerTwo: victoryText = "Player two wins."
        }
        gameInfoLabel.text = victoryText
        setAllGameButtons(to: .disabled)
        playAgainButton.isHidden = false
    }
    
    private func setAllGameButtons(to newState: GameButtonState) {
        for button in allGameButtons {
            switch newState {
            case let .enabled(isBlank):
                button.isEnabled = true
                if isBlank {
                    button.setTitle(Symbol.blank.rawValue, for: .normal)
                }
            case .disabled:
                button.isEnabled = false
            }
        }
    }
    enum GameButtonState {
        case enabled(isBlank: Bool)
        case disabled
    }
}

