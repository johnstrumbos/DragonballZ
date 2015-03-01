//
//  LoadLibraryModalController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class LoadLibraryModalController : UIViewController{
    
    var user:PanelUser?
    
    override func viewDidLoad() {
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }
    func update(){
        
        self.performSegueWithIdentifier("showProfile", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showProfile") {
            let vc: ProfileViewController = segue.destinationViewController as ProfileViewController
            vc.user = user!
        }
    }
    
}