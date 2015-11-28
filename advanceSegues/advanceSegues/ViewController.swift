//
//  ViewController.swift
//  advanceSegues
//
//  Created by Jeroen Stevens on 2015-11-27.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit

var rowCounter: Int = -1

class ViewController: UIViewController {

    @IBOutlet var printNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(rowCounter)
        
        if (rowCounter >= 0){
            printNumber.text = String(rowCounter);
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

