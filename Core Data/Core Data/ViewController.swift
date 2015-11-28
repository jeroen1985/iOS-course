//
//  ViewController.swift
//  Core Data
//
//  Created by Jeroen Stevens on 2015-11-27.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        
        newUser.setValue("Jeroen", forKey: "username")
        newUser.setValue("Pass", forKey: "password")
        
        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false;
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if(results?.count > 0){
            for result: AnyObject in results!{
                println(result)
            }
        }else{
            println("no results")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

