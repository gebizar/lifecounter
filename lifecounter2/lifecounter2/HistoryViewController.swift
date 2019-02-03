//
//  HistoryViewController.swift
//  lifecounter2
//
//  Created by Gabe Bizar on 2/2/19.
//  Copyright © 2019 Gabe Bizar. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        text.text = ""
        for line in HistoryController.history {
            text.text += ("\n" + line)
        }
    }
    
    
}
