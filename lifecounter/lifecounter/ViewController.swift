//
//  ViewController.swift
//  lifecounter
//
//  Created by Gabe Bizar on 1/29/19.
//  Copyright © 2019 Gabe Bizar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Loser: UILabel!
    @IBOutlet weak var Life1: UILabel!
    @IBOutlet weak var Life2: UILabel!
    @IBOutlet weak var Life3: UILabel!
    @IBOutlet weak var Life4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Loser.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func changeValue( val: Int, target: Int) {
        switch target {
        case 1:
            let lifeTotal = Int(Life1.text!)!
            let newTotal = lifeTotal + val
            Life1.text = String(newTotal)
            if (newTotal <= 0) {
                Loser.text = "Player 1 Loses!"
                Loser.isHidden = false
            }
        case 2:
            let lifeTotal = Int(Life2.text!)!
            let newTotal = lifeTotal + val
            Life2.text = String(newTotal)
            if (newTotal <= 0) {
                Loser.text = "Player 2 Loses!"
                Loser.isHidden = false
            }
        case 3:
            let lifeTotal = Int(Life3.text!)!
            let newTotal = lifeTotal + val
            Life3.text = String(newTotal)
            if (newTotal <= 0) {
                Loser.text = "Player 3 Loses!"
                Loser.isHidden = false
            }
        case 4:
            let lifeTotal = Int(Life4.text!)!
            let newTotal = lifeTotal + val
            Life4.text = String(newTotal)
            if (newTotal <= 0) {
                Loser.text = "Player 4 Loses!"
                Loser.isHidden = false
            }
        default:
            print("Shouldn't be able to get here")
        }

        
    }
    @IBAction func fiveForP4(_ sender: Any) {
        changeValue(val:5, target:4)
    }
    @IBAction func oneForP4(_ sender: Any) {
        changeValue(val:1, target:4)

    }
    @IBAction func negOneForP4(_ sender: Any) {
        changeValue(val:-1, target:4)

    }
    @IBAction func negFiveForP4(_ sender: Any) {
        changeValue(val: -5, target:4)
    }
    
    @IBAction func fiveForP3(_ sender: Any) {
        changeValue(val:5, target:3)

    }
    
    @IBAction func oneForP3(_ sender: Any) {
        changeValue(val:1, target:3)

    }
    
    @IBAction func negOneForP3(_ sender: Any) {
        changeValue(val:-1, target:3)

    }
    
    @IBAction func negFiveForP3(_ sender: Any) {
        changeValue(val:-5, target:3)

    }
    
    @IBAction func fiveForP2(_ sender: Any) {
        changeValue(val:5, target:2)

    }
    
    @IBAction func oneForP2(_ sender: Any) {
        changeValue(val:1, target:2)

    }
    @IBAction func negOneForP2(_ sender: Any) {
        changeValue(val:-1, target:2)

    }
    @IBAction func negFiveForP2(_ sender: Any) {
        changeValue(val:-5, target:2)

    }
    @IBAction func fiveForP1(_ sender: Any) {
        changeValue(val:5, target:1)

    }
    @IBAction func oneForP1(_ sender: Any) {
        changeValue(val:1, target:1)

    }
    
    @IBAction func negOneForP1(_ sender: Any) {
        changeValue(val:-1, target:1)

    }
    @IBAction func negFiveForP1(_ sender: Any) {
        changeValue(val:-5, target:1)

    }
}

