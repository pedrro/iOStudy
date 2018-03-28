//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Pedro Henrique Nazário da Silva on 27/03/18.
//  Copyright © 2018 Pedro Henrique Nazário da Silva. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    
}


