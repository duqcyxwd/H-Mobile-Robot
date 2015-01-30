//
//  ViewController.swift
//  H-Mobile Robot
//
//  Created by Yongqinchuan Du on 2015-01-23.
//  Copyright (c) 2015 Yongqinchuan Du. All rights reserved.
//

import UIKit
import Foundation
import CoreMotion

class ViewController: UIViewController {

    
    let nsMotionQueue = NSOperationQueue()
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var wifiConnection: UIButton!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.    
        var globalVar = 0
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            for var i = 0; i < 100; i++
            {
                println("GCD thread running.")
//                self.xLabel.text = String(i)
                
                globalVar = i
                
                sleep(1)
            }
            //            sleep(5);
            dispatch_async(dispatch_get_main_queue(), {
                
                println("main")
                NSLog("main")
                for i in 1...10
                {
                    sleep(1)
                    self.xLabel.text = String(globalVar)
                }
                //这里返回主线程，写需要主线程执aa行的代码
                println("这里返回主线程，写需要主线程执行的代码")
            })
        })
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        motionManager.startDeviceMotionUpdatesToQueue(nsMotionQueue, withHandler: updateView)
        
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
        self.xLabel.text = "Updated"
//        let label =
        
//        self.labb.text = "update"
        

        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        
    }
    
    
    func updateView(motion: CMDeviceMotion!, error:NSError!) {
        let grav : CMAcceleration = motion.gravity
        
        let x = CGFloat(grav.x)
        let y = CGFloat(grav.y)
        var p = CGPointMake(x,y)
        
        println(x)
        println(y)
        println(p)
        
        if (error != nil) {
            NSLog("\(error)")
        }
        
        // Have to correct for orientation.
        var orientation = UIApplication.sharedApplication().statusBarOrientation
        
        if(orientation == UIInterfaceOrientation.LandscapeLeft) {
            var t = p.x
            p.x = 0 - p.y
            p.y = t
        } else if (orientation == UIInterfaceOrientation.LandscapeRight) {
            var t = p.x
            p.x = p.y
            p.y = 0 - t
        } else if (orientation == UIInterfaceOrientation.PortraitUpsideDown) {
            p.x *= -1
            p.y *= -1
        }
        
        var v = CGVectorMake(p.x, 0 - p.y)
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

