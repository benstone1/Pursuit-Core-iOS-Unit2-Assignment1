import UIKit

class ViewController: UIViewController {
    
    var gameBrain = TicTacToeBrain()
    var gameState: GameState! {
        didSet {
            print(self.gameState)
            switch gameState! {
            case .inProgress: break
            case .tie: print("Tie!")
            case let .victory(player): print(player, "wins!")
            }
        }
    }
    
    @IBAction func enterGameMove(_ sender: GameButton) {
        sender.isEnabled = false
        sender.setTitle(gameBrain.currentPlayer.symbol.rawValue, for: .normal)
        gameState = gameBrain.makeMove(location: BoardLocation(row: sender.row, column: sender.col))
    }
}

