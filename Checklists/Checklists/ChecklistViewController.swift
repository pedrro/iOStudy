//
//  ViewController.swift
//  Checklists
//
//  Created by Pedro Henrique Nazário da Silva on 27/03/18.
//  Copyright © 2018 Pedro Henrique Nazário da Silva. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items: [ChecklistItem]

    var row0item: ChecklistItem
    var row1item: ChecklistItem
    var row2item: ChecklistItem
    var row3item: ChecklistItem
    var row4item: ChecklistItem
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()                 // add this line
        
        let row0item = ChecklistItem()            // let
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)                    // add this line
        
        let row1item = ChecklistItem()            // let
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)                    // add this line
        
        let row2item = ChecklistItem()            // let
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)                    // add this line
        
        let row3item = ChecklistItem()            // let
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)                    // add this line
        
        let row4item = ChecklistItem()            // let
        row4item.text = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)                    // add this line
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                               cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem",
                for: indexPath)
            
            let item = items[indexPath.row]       // Add this
            
            let label = cell.viewWithTag(1000) as! UILabel
            // Replace everything after the above line with the following
            label.text = item.text
            configureCheckmark(for: cell, at: indexPath)
            return cell
    }
    
    override func tableView(_ tableView: UITableView,
                               didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            // Replace everything inside this `if` condition
            // with the following
            let item = items[indexPath.row]
            item.checked = !item.checked
            
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func configureCheckmark(for cell: UITableViewCell,
                               with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
}

