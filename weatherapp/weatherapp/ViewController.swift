//
//  ViewController.swift
//  weatherapp
//
//  Created by Jeroen Stevens on 2015-05-04.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var city: UITextField!

    @IBAction func andGo(sender: AnyObject) {
        
        if city.text != nil{
            
            var enterCity = city.text
            
            var newURL = constructURL(enterCity)
            
            if newURL != ""{
                
                loadWeather(newURL)
                
            }
            
        }
        

        
    }
    
    @IBOutlet var webView: UIWebView!
    
    
    func constructURL(cityName: String) -> String{
        
        var newUrl = "http://www.weather-forecast.com/locations/" + cityName + "/forecasts/latest"
        
        return newUrl
        
    }
    
    
    func loadWeather(newUrl: String){
        
        let url = NSURL(string: newUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data,response,error) -> Void in
            
            var urlError = false
            
            var weather = String()
            
            var weatherArray = [AnyObject]()
            
            if error == nil {
                
                
                var URLcontent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                
                var URLcontentArray = URLcontent.componentsSeparatedByString("<span class=\"phrase\">")
                
                println(URLcontentArray)
                
                if !URLcontentArray.isEmpty && URLcontentArray.count > 0 {
                
                        weatherArray = URLcontentArray[1].componentsSeparatedByString("</span>")
                    
                        weather = weatherArray[0] as String
                        
                         dispatch_async(dispatch_get_main_queue()){
                        
                        self.webView.loadHTMLString(weather, baseURL: nil)
                        
                        }
                    
                    
                    
                   
                        
                        
                        
                        //self.webView.loadHTMLString(URLcontent!, baseURL: nil)
                    
                }
                

                
            }
                
        
        
        }
        
        task.resume()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        city.resignFirstResponder()
        return true
    }



}

