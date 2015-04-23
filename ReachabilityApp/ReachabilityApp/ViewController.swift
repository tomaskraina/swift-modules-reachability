//
//  ViewController.swift
//  ReachabilityApp
//
//  Created by Tom Kraina on 23/04/15.
//  Copyright (c) 2015 Tom Kraina. All rights reserved.
//

import UIKit
import ApiFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let reach = Reachability(hostName: "www.google.com")
        
        // Set the blocks
        reach.reachableBlock = { reach in
        
            dispatch_async(dispatch_get_main_queue()) {
                println("Reachable!")
            }
            
            return
        }

        
        reach.unreachableBlock = { reach in
            println("UNREACHABLE!")
        }
        
        // Start the notifier, which will cause the reachability object to retain itself!
        reach.startNotifier()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

