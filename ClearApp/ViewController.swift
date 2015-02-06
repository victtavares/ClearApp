//
//  ViewController.swift
//  ClearApp
//
//  Created by Victor Tavares on 2/4/15.
//  Copyright (c) 2015 Private. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier:"cell")
        
        tableView.separatorStyle = .None
        tableView.rowHeight = 50.0
        tableView.backgroundColor = UIColor.blackColor()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        if toDoItems.count > 0 {
            return
        }
        
        toDoItems.append(ToDoItem(text: "feed the cat"))
        toDoItems.append(ToDoItem(text: "buy eggs"))
        toDoItems.append(ToDoItem(text: "watch WWDC videos"))
        toDoItems.append(ToDoItem(text: "rule the Web"))
        toDoItems.append(ToDoItem(text: "buy a new iPhone"))
        toDoItems.append(ToDoItem(text: "darn holes in socks"))
        toDoItems.append(ToDoItem(text: "write this tutorial"))
        toDoItems.append(ToDoItem(text: "master Swift"))
        toDoItems.append(ToDoItem(text: "learn to draw"))
        toDoItems.append(ToDoItem(text: "get more exercise"))
        toDoItems.append(ToDoItem(text: "catch up with Mom"))
        toDoItems.append(ToDoItem(text: "get a hair cut"))
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as TableViewCell
        let item = toDoItems[indexPath.row]
        
        cell.selectionStyle = .None
        
        //cell.textLabel?.text = item.text
        //cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        cell.delegate = self
        cell.toDoItem = item
        
        return cell
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    //MARK: - Table View Delegate
    
    func toDoItemDeleted(todoItem: ToDoItem) {

        let index = (toDoItems as NSArray).indexOfObject(todoItem)
        if index == NSNotFound { return }
        
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoItems.removeAtIndex(index)
        
        tableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        tableView.endUpdates()
        
        
    }
    

    
    func colorForIndex(index: Int) ->UIColor {
        let itemCount = toDoItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red:1.0, green:val, blue: 0.0, alpha:1.0)
    }

    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    

    
    


}

