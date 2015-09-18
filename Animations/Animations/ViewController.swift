//
//  ViewController.swift
//  Animations
//
//  Created by Jeroen Stevens on 2015-09-07.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    
    var timer = NSTimer()
    
    var isAnimating  = true
    
    @IBOutlet var alienImage: UIImageView!
    
    @IBAction func Update(sender: AnyObject) {
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimitation"), userInfo: nil, repeats: true)
            isAnimating = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimitation"), userInfo: nil, repeats: true)
    
    }
    
    func doAnimitation(){
        if counter  == 5 {
            counter = 1
        } else {
            counter++
        }
        
        alienImage.image = UIImage(named: "frame\(counter).png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*

    override func viewDidLayoutSubviews() {
        alienImage.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            self.alienImage.frame = CGRectMake(100, 20, 100, 200)

        })
      

    }
    */
}

