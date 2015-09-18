//
//  ViewController.swift
//  download-web-content
//
//  Created by Jeroen Stevens on 2015-05-04.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data,response,error) in
            
            if error == nil {
                
                var URLcontent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println(URLcontent)
                
                dispatch_async(dispatch_get_main_queue()){
                
                self.webview.loadHTMLString(URLcontent!, baseURL: nil)
                    
                }
                
            }
            
        }
        
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ?


}

