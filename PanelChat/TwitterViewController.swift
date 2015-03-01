//
//  TwitterViewController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit

class TwitterViewController : UIViewController {
    
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var SignInBtn: UIButton!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var user:PanelUser?
    
    
    override func viewDidLoad() {
        
        self.spinner.hidden  = true
    }
    
    @IBAction func login(sender: UIButton) {
        UserNameField.resignFirstResponder()
        PasswordField.resignFirstResponder()
        
        if(!UserNameField.text.isEmpty && !PasswordField.text.isEmpty){
            
            SignInBtn.enabled = false
            spinner.hidden  = false
            
            let manager = AFHTTPRequestOperationManager()
            manager.requestSerializer.setValue(NSString(string: "application/json"), forHTTPHeaderField: NSString(string: "Accept"))
            manager.GET("https://panel-chat.firebaseio.com/user/user-info.json", parameters: nil,
                success: {
                    (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                    var error: NSError?
                    
                    if let data: AnyObject = responseObject {
                        var userData = PanelUsers(data: data)
                        self.user = userData.users[0]
                        
                        if let imgURL = self.user!.ImageUrl{
                            if let url = NSURL(string: imgURL){
                                let data = NSData(contentsOfURL: url)
                            }
                        }
                        self.performSegueWithIdentifier("straigntToProfile", sender: self)
                    }
                    
                    self.SignInBtn.enabled = true
                    self.spinner.hidden  = true
                },
                failure: {
                    (operation: AFHTTPRequestOperation!, error: NSError!) in
                    
                    self.SignInBtn.enabled = true
                    self.spinner.hidden  = true
                    NSNotificationCenter.defaultCenter().postNotificationName("InstallationsListUpdated", object: self)
            })
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "straigntToProfile") {
            let vc: ProfileViewController = segue.destinationViewController as ProfileViewController
            vc.user = user!
        }
    }
    
}