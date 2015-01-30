//
//  ViewController.swift
//  H-Mobile Robot
//
//  Created by Yongqinchuan Du on 2015-01-23.
//  Copyright (c) 2015 Yongqinchuan Du. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage() {
//        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: UIAlertControllerStyle.Alert)
//        alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
//        self.presentViewController(alertController, animated: true, completion: nil)
//        
//        var maximumNumberOfLoginAttempts = 10
//        maximumNumberOfLoginAttempts = 11 + maximumNumberOfLoginAttempts
//        
//        var welcomeMessage: String
//        welcomeMessage = "Hello"
//        
//        println(welcomeMessage)
//        testudpserver()
        testudpclient()

        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        
    }
    
//    let mylabel = UILabel(frame:CGRect(origin: CGPointMake(10.0, 50.0), size: CGSizeMake(150,50)))
//    
//    self.mylabel.text = "This is a Label"
//    
//    self.view.addSubview(label)
    
//    var menuView = UIView()
//    var button1: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
//    
//    button1.frame = CGRectMake(100, 100, 40, 145)
//    button1.addTarget(self, action: "Action:", forControlEvents:UIControlEvents.TouchUpInside)
//    menuView.addSubview(button1)
    
//    let addr = "127.0.0.1"
//    let port = 4000
//    
//    var host :NSHost = NSHost(address: addr)
//    var inp :NSInputStream?
//    var out :NSOutputStream?
//    
//    NSStream.getStreamsToHost(host, port: port, inputStream: &inp, outputStream: &out)
//    
//    let inputStream = inp!
//    let outputStream = out!
//    inputStream.open()
//    outputStream.open()
//    
//    var readByte :UInt8 = 0
//    while inputStream.hasBytesAvailable {
//        inputStream.read(&readByte, maxLength: 1)
//    }
    
    // buffer is a UInt8 array containing bytes of the string "Jonathan Yaniv.".
//    outputStream.write(&buffer, maxLength: buffer.count)
    
//    let maximumNumberOfLoginAttempts = 10
//    let maximumNumberOfLoginAttempts = 11 + maximumNumberOfLoginAttempts
    
//    var welcomeMessage: String
//    welcomeMessage = "Hello"
    
    
    
    

}

