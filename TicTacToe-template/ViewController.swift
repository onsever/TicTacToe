//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nought = UIImage(named: "nought")
    var cross = UIImage(named: "cross")
    
    enum Turn {
        case Nought
        case Cross
    }
    
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    @IBOutlet weak var fourth: UIButton!
    @IBOutlet weak var fifth: UIButton!
    @IBOutlet weak var sixth: UIButton!
    @IBOutlet weak var seventh: UIButton!
    @IBOutlet weak var eigth: UIButton!
    @IBOutlet weak var ninth: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var turnCounter: Int = 0
    var isFinished: Bool = false
    var buttons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        buttons = [first, second, third, fourth, fifth, sixth, seventh, eigth, ninth]
    }

    @IBAction func playAgainPressed(_ sender: UIButton) {
        
        if isFinished {
            for button in buttons {
                if button.image(for: .normal) != nil {
                    button.setImage(nil, for: .normal)
                }
            }
            
            playAgainButton.titleLabel?.alpha = 0
            UIView.animate(withDuration: 2) {
                self.playAgainButton.titleLabel?.alpha = 1
                self.playAgainButton.isHidden = true
            }
        }
    }
    
    
    @IBAction func boardCellPressed(_ sender: UIButton) {
        if (sender.image(for: .normal) == nil) {
            if (currentTurn == Turn.Nought) {
                sender.imageView?.alpha = 0
                turnCounter += 1
                UIView.animate(withDuration: 3) {
                    sender.imageView?.alpha = 1
                    sender.setImage(self.nought, for: .normal)
                    self.currentTurn = Turn.Cross
                }
            }
            else if (currentTurn == Turn.Cross) {
                
                let x = sender.frame.origin.x
                let y = sender.frame.origin.y
                
                let height = sender.frame.size.height
                let width = sender.frame.size.width
                
                turnCounter += 1
                
                sender.imageView?.frame = CGRect(x: x, y: y, width: 0, height: 0)
                UIView.animate(withDuration: 3) {
                    sender.setImage(self.cross, for: .normal)
                    sender.imageView?.frame = CGRect(x: x, y: y, width: width, height: height)
                    self.currentTurn = Turn.Nought
                }
            }
        }
        
        if turnCounter == 9 {
            playAgainButton.isHidden = false
            isFinished = true
        }
        else {
            playAgainButton.isHidden = true
            isFinished = false
        }
        
    }
    
}

