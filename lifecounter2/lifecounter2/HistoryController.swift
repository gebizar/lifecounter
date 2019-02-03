//
//  HistoryController.swift
//  lifecounter2
//
//  Created by Gabe Bizar on 2/2/19.
//  Copyright © 2019 Gabe Bizar. All rights reserved.
//

import UIKit

class HistoryController: NSObject {

    static var history:Array<String> = []
    
    class func addToHistory(newLine:String) {
        HistoryController.history.append(newLine)
    }
}
