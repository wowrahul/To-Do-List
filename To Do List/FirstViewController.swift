//
//  FirstViewController.swift
//  To Do List
//
//  Created by Rahul Joshi on 7/18/15.
//  Copyright (c) 2015 Rahul Joshi. All rights reserved.
//

import UIKit

var toDoList = [String]()


class FirstViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        if  NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") != nil {
            
            
          toDoList =  NSUserDefaults.standardUserDefaults().objectForKey("ToDoList") as! [String]
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
           let cell =  UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell;
        
    }

    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "ToDoList")
            toDoListTable.reloadData()
            
        }
    }

}

