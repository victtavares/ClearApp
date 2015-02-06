//
//  ToDoItem.swift
//  ClearApp
//
//  Created by Victor Tavares on 2/4/15.
//  Copyright (c) 2015 Private. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var text: String
    var completed: Bool
    
    
    init(text:String) {
        self.text = text
        completed = false
    }
    
    
}
