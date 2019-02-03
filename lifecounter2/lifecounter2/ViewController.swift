//
//  ViewController.swift
//  lifecounter2
//
//  Created by Gabe Bizar on 2/1/19.
//  Copyright © 2019 Gabe Bizar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topView: UIView = {
        let retView = UIView()
        retView.translatesAutoresizingMaskIntoConstraints = false
        return retView
    }()
    
    let bottomText: UILabel = {
        let retText = UILabel()
        retText.text = "Add or Remove Players"
        retText.adjustsFontSizeToFitWidth = true
        retText.translatesAutoresizingMaskIntoConstraints = false
        return retText
    }()
    
    let historyButton: UIButton = {
        let retButton = UIButton()
        retButton.setTitle("History", for: .normal)
        retButton.titleLabel?.adjustsFontSizeToFitWidth = true
        retButton.setTitleColor(.blue, for: .normal)
        retButton.backgroundColor = .clear
        retButton.layer.cornerRadius = 5
        retButton.layer.borderWidth = 1
        retButton.layer.borderColor = UIColor.black.cgColor
        retButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

        retButton.translatesAutoresizingMaskIntoConstraints = false
        retButton.addTarget(self, action: #selector(ViewController.segue), for: .touchUpInside)

        return retButton
    }()

    @objc func segue(){
        performSegue(withIdentifier: "firstSegue", sender: nil)

    }
    
    let mainScroll: UIView = {
        let retScroll = UIView()
        retScroll.translatesAutoresizingMaskIntoConstraints = false
//        retScroll.isScrollEnabled = true
//        retScroll.isPagingEnabled = true
        return retScroll
    }()
    
    let playerAdder: UIStepper = {
        let retStep = UIStepper()
        retStep.translatesAutoresizingMaskIntoConstraints = false
        retStep.maximumValue = 6
        retStep.minimumValue = 0
        retStep.stepValue = 1
        retStep.isEnabled = true
        retStep.addTarget(self, action: #selector(ViewController.stepperValueChanged(_:)), for: .touchUpInside)
        return retStep
    }()
    
    @objc func stepperValueChanged(_ sender:UIStepper!) {
        print(currValue, sender.value)
        if sender.value > currValue {
            if (sender.value <= 6) {
                createPlayer()
                currValue += 1
            }
        } else {
            if (sender.value >= 0) {
                playerArr.remove(at: playerArr.count - 1)
                mainScroll.subviews[mainScroll.subviews.count - 1].removeFromSuperview()
                currValue -= 1
            }
           
          
        }
    }
    
    var playerArr = [UIView]()
    var historyArr = [String]()
    var currValue: Double = 0
    
    private func setupMain() {
        mainScroll.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainScroll.topAnchor.constraint(equalTo:topView.bottomAnchor).isActive = true
        mainScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScroll.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true
        mainScroll.backgroundColor = .orange
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        
        bottomText.topAnchor.constraint(equalTo:topView.topAnchor, constant: 30).isActive = true
        bottomText.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        bottomText.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: 1/3)

        playerAdder.topAnchor.constraint(equalTo: bottomText.bottomAnchor).isActive = true
        playerAdder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playerAdder.backgroundColor = UIColor(displayP3Red: 0, green: 255, blue: 255, alpha: 1)
        
        historyButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20).isActive = true
        historyButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
       
        
//        historyButton.centerYAnchor.constraint(equalTo:bottomView.centerYAnchor).isActive = true
       

        
        
    }
    
    
    

    
    func createPlayer(){
        if playerArr.count < 8 {
            let pView: UIView = {
                let retView = UIView()
    
                retView.translatesAutoresizingMaskIntoConstraints = false
                retView.layer.borderColor = UIColor.black.cgColor
                retView.layer.borderWidth = 1
                return retView
            }()
            mainScroll.addSubview(pView)
            pView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            pView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            pView.heightAnchor.constraint(equalTo: mainScroll.heightAnchor, multiplier: 1/8
                ).isActive = true
            if (playerArr.count == 0) {
                pView.topAnchor.constraint(equalTo: mainScroll.topAnchor).isActive = true
            } else {
                pView.topAnchor.constraint(equalTo: playerArr[playerArr.count - 1].bottomAnchor).isActive = true
            }
            
            playerArr.append(pView)

            let currButton = createButton(text:"+5")
            let currButton2 = createButton(text:"-5")
            pView.addSubview(currButton)
            pView.addSubview(currButton2)
            currButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
            currButton.bottomAnchor.constraint(equalTo: pView.bottomAnchor, constant: -5).isActive = true
            currButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
            currButton2.bottomAnchor.constraint(equalTo: pView.bottomAnchor, constant: -5).isActive = true
            
            let playerName = UILabel()
            playerName.text = "Player " + String(playerArr.count)
            playerName.translatesAutoresizingMaskIntoConstraints = false
            pView.addSubview(playerName)
            playerName.leadingAnchor.constraint(equalTo:currButton2.trailingAnchor, constant: 5).isActive = true
            playerName.topAnchor.constraint(equalTo: pView.topAnchor, constant: 15).isActive = true
            
            let healthTotal = UILabel()
            healthTotal.tag = 99
            healthTotal.text = "20"
            healthTotal.translatesAutoresizingMaskIntoConstraints = false
            pView.addSubview(healthTotal)
            healthTotal.leadingAnchor.constraint(equalTo: playerName.trailingAnchor, constant: 10).isActive = true
            healthTotal.topAnchor.constraint(equalTo: pView.topAnchor, constant: 15).isActive = true

            let edit = UITextField()
            edit.keyboardType = .numberPad
            edit.translatesAutoresizingMaskIntoConstraints = false
            pView.addSubview(edit)
            edit.leadingAnchor.constraint(equalTo: playerName.leadingAnchor).isActive = true
            edit.bottomAnchor.constraint(equalTo: pView.bottomAnchor, constant: -5).isActive = true
            edit.widthAnchor.constraint(equalToConstant: 150).isActive = true
            edit.heightAnchor.constraint(equalToConstant: 25).isActive = true
            edit.placeholder = "Change Damage Value"
            edit.returnKeyType = UIReturnKeyType.done
            edit.backgroundColor = .white
            
            let currButton3 = createButton(text: "Change")
            pView.addSubview(currButton3)
            currButton3.removeTarget(self, action: #selector(ViewController.buttonPressed(sender:)),
                                     for: .touchUpInside)
            currButton3.addTarget(self, action: #selector(ViewController.editButtonPressed(sender:)), for:.touchUpInside)
            currButton3.leadingAnchor.constraint(equalTo: edit.trailingAnchor, constant: 5).isActive = true
            currButton3.bottomAnchor.constraint(equalTo: pView.bottomAnchor, constant: -5).isActive = true

            


        } else {
            print("cannot add more than 8 players")
        }

    }
    
    func createButton(text: String) -> UIButton {
        let retButton = UIButton()
        retButton.setTitle(text, for: .normal)
        retButton.titleLabel?.adjustsFontSizeToFitWidth = true
        retButton.setTitleColor(.blue, for: .normal)
        retButton.backgroundColor = .white
        retButton.layer.cornerRadius = 5
        retButton.layer.borderWidth = 1
        retButton.layer.borderColor = UIColor.black.cgColor
        retButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        retButton.translatesAutoresizingMaskIntoConstraints = false
        retButton.tag = playerArr.count - 1
        retButton.addTarget(self, action: #selector(ViewController.buttonPressed(sender:)),
                            for: .touchUpInside)
        return retButton
    }
    
    @objc func buttonPressed(sender: UIButton) {
        print(sender.tag)
        let currSubview = playerArr[sender.tag].subviews
        let labels = currSubview.flatMap{ $0 as? UILabel}
        for label in labels {
            if label.tag == 99 {
                playerAdder.isHidden = true
                let val = Int(label.text!)!
                var newVal = 0
                let lastChar = sender.title(for: .normal)!
                let lastInt = Int(lastChar)!
                print(sender.title(for: .normal))
                print(sender.title(for: .normal)!.starts(with: "-"))
                if sender.title(for: .normal)!.starts(with: "+") {
                    newVal = val + lastInt
                } else if sender.title(for: .normal)!.starts(with: "-") {
                    newVal = val + lastInt
                    print(newVal)

                }
                let toPrint: String = "Player " + String(sender.tag + 1) + " received " + sender.title(for:.normal)! + " to their HP"
                HistoryController.addToHistory(newLine: toPrint)
                if newVal <= 0 {
                    HistoryController.addToHistory(newLine: "Player \(sender.tag) has been lost.")
                }
                label.text = String(newVal)
            }
        }
//
    }
    
    @objc func editButtonPressed(sender: UIButton){
        var count = 0
        let currSubview = playerArr[sender.tag].subviews
        let buttons = currSubview.flatMap{$0 as? UIButton}
        for button in buttons {
            print(button.currentTitle)
            if button.currentTitle!.starts(with: "+") || button.currentTitle!.starts(with: "-") {
                let textInputs = currSubview.flatMap{$0 as? UITextField}
                for textinput in textInputs {
                    let currText = textinput.text!
                    if currText.isNumeric {
                        if currText.count > 0 {
                            if count == 0 {
                                let positive = "+" + currText
                                button.setTitle(positive, for: .normal)
                            }
                            else {
                                let negative = "-" + currText
                                button.setTitle(negative, for: .normal)
                            }
                            count += 1
                        }
                    }
                }

            }
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .yellow
        view.addSubview(mainScroll)
        view.addSubview(topView)
        topView.addSubview(historyButton)
        topView.addSubview(playerAdder)
        topView.addSubview(bottomText)
        createPlayer()
        createPlayer()
        setupMain()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func reset(text: String) {
        let alert = UIAlertController(title: "My Alert", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset Game",
                                      style: .default,
                                      handler: resetAll))
        self.present(alert, animated: true, completion: {
            NSLog("One game completed.")
        })
    }
    
    func resetAll(alertAction:UIAlertAction) {
        currValue = 0
        playerAdder.value = 0
        playerAdder.isHidden = false
        playerAdder.isEnabled = true
        for view in mainScroll.subviews {
            view.removeFromSuperview()
        }
        createPlayer()
        createPlayer()
    }
    
    

}

extension String {
    var isNumeric: Bool {
        guard self.characters.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self.characters).isSubset(of: nums)
    }
}




