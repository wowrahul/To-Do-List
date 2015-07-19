//
//  SecondViewController.swift
//  To Do List
//
//  Created by Rahul Joshi on 7/18/15.
//  Copyright (c) 2015 Rahul Joshi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var txtItem: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddItem(sender: AnyObject) {
        
        let item = txtItem.text
        if !item.isEmpty
        {
            toDoList.append(item)
            txtItem.text = ""
        }
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "ToDoList")
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool  {
        
        txtItem.resignFirstResponder()
        return true
        
    }
    

}

