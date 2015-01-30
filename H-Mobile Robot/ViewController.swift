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
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var globalVar = 0
    var timer = NSTimer()
    var counter = 0
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target:self, selector: Selector("updateLables"), userInfo: nil, repeats: true)
        motionManager.startDeviceMotionUpdatesToQueue(nsMotionQueue, withHandler: updateMotionData)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendHelloWorld() {
        testudpclient()
        print("Send int \(self.globalVar)")
    }
    @IBAction func gcdLoop(sender: AnyObject) {
        timeCounter()
    }
 
    @IBAction func clear(sender: AnyObject) {
        self.globalVar = 0
    }
    
    func updateLables() {
        xLabel.text = "\(self.x)"
        yLabel.text = "\(self.y)"
        zLabel.text = "\(self.z)"
        counterLabel.text = "\(self.globalVar)"
    }
    
    func timeCounter()
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            for i in 5...100000 {
                self.globalVar += 1
                usleep(100)
                if (i == 5000) {
                    self.showNoticeMessage("reach 5000")
                }
                
            }
        })
    }
    
    // A help function to display Notice Message
    func showNoticeMessage(str: String)
    {
    
        let alertController = UIAlertController(title: "title", message: str, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateMotionData(motion: CMDeviceMotion!, error:NSError!) {
        let grav : CMAcceleration = motion.gravity
        
        let x = CGFloat(grav.x)
        let y = CGFloat(grav.y)
        let z = CGFloat(grav.z)
        var p = CGPointMake(x,y)
        
        self.x = grav.x
        self.y = grav.y
        self.z = grav.z
        
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
    }
}

