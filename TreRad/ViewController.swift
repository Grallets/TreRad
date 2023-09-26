import UIKit

class ViewController: UIViewController {
    
    // Declare the properties here, inside the class
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var playerTurn: UILabel!
    
    var currentPlayer: String = "X"
    var gameGrid: [String] = ["", "", "", "", "", "", "", "", ""]
    var buttons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [one, two, three, four, five, six, seven, eight, nine]
       // drawGridLines()
    }

    // Functions game logics
    func checkWinner() -> Bool {
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        for combination in winningCombinations {
            if gameGrid[combination[0]] == currentPlayer &&
               gameGrid[combination[1]] == currentPlayer &&
               gameGrid[combination[2]] == currentPlayer {
                print("Winner found: \(currentPlayer)")
                return true
            }
        }
        return false
    }

    func disableAllButtons() {
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let buttonIndex = buttons.firstIndex(of: sender) {
            if gameGrid[buttonIndex] == "" {
                gameGrid[buttonIndex] = currentPlayer
                sender.setTitle(currentPlayer, for: .normal)
                
                if checkWinner() {
                    playerTurn.text = "\(currentPlayer) Wins!"
                    disableAllButtons()
                } else if !gameGrid.contains("") {
                    playerTurn.text = "It's a Draw!"
                    disableAllButtons()
                } else {
                    currentPlayer = currentPlayer == "X" ? "O" : "X"
                    playerTurn.text = "\(currentPlayer)'s Turn"
                }
                print("Button tapped. Current player: \(currentPlayer), Button index: \(buttonIndex)")

            }
        }
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        gameGrid = ["", "", "", "", "", "", "", "", ""]
            currentPlayer = "X"
            playerTurn.text = "X's Turn"
            
            for button in buttons {
                button.setTitle("", for: .normal)
                button.isEnabled = true
            }

    }
    
       /*func drawGridLines() {
        let lineWidth: CGFloat = 2.0
        let lineColor: UIColor = .black
        
        let horizontalLine1 = UIView(frame: CGRect(x: 75, y: one.frame.maxY, width: 230, height: lineWidth))
        horizontalLine1.backgroundColor = lineColor
        
        let horizontalLine2 = UIView(frame: CGRect(x: 75, y: four.frame.maxY, width: 230, height: lineWidth))
        horizontalLine2.backgroundColor = lineColor
        
        let verticalLine1 = UIView(frame: CGRect(x: one.frame.maxX, y: 300, width: lineWidth, height: 140))
        verticalLine1.backgroundColor = lineColor
        
        let verticalLine2 = UIView(frame: CGRect(x: three.frame.minX - lineWidth, y: 300, width: lineWidth, height: 140))
        verticalLine2.backgroundColor = lineColor
        
        self.view.addSubview(horizontalLine1)
        self.view.addSubview(horizontalLine2)
        self.view.addSubview(verticalLine1)
        self.view.addSubview(verticalLine2)}*/
    


}
