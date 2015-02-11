//
//  ConnectionViewController.swift
//  H-Mobile Robot
//
//  Created by Yongqinchuan Du on 2015-02-08.
//  Copyright (c) 2015 Yongqinchuan Du. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("ViewTwoLoaded")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func StartConnectionButtonPressed(sender: AnyObject) {
        let view2 = self.storyboard?.instantiateViewControllerWithIdentifier("view2") as ViewController
        
//        self.navigationController?.pushViewController(view2, animated: true)

    }
    
    @IBAction func sendHelloWorld() {
        testudpclient()
        print("Send int \(self.globalVar)")
    }
    
    
    
}
