//
//  ViewController.swift
//  tic tac toe
//
//  Created by yasamin  on 10.5.2017.
//  Copyright © 2017 yasamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        //we can only place one piece at one place
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
        
        if (activePlayer == 1){
            sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
            activePlayer = 2
        }
        else {
            sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
            activePlayer = 1

        }
    }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    //cross has won
                    print("Cross")
                    label.text = "CROSS HAS WON"
                }
                else {
                    //nought has won
                    print("Nought")
                    label.text = "nought HAS WON"
                }

                label.isHidden = false
//                PlayAgainButton.isHidden = false
            }

    
    }
    }
    //when the user click on playagain button we gonna reset the gameState
    @IBOutlet weak var PlayAgainButton: UIButton!
    @IBAction func PlayAgain(_ sender: AnyObject) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        //in our case cross is the default
        activePlayer = 1
        
        PlayAgainButton.isHidden = true
        label.isHidden = true
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
    }
  
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
