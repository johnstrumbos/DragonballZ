//
//  ProfilePreviewViewController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class ProfilePreviewViewController : UIViewController{
    
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var UserFullName: UILabel!
    @IBOutlet weak var AboutMeText: UITextView!
    
    @IBOutlet weak var SubmitBtn: UIButton!
    
    var user:PanelUser?
    
    
    override func viewDidLoad() {
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
                            self.ProfileImage.image = UIImage(data: data!)
                        }
                    }
                    
                    if let name = self.user!.Name{
                        self.UserFullName.text = name
                    }
                }
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                NSNotificationCenter.defaultCenter().postNotificationName("InstallationsListUpdated", object: self)
        })
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showProfileLoader") {
            let vc: LoadLibraryModalController = segue.destinationViewController as LoadLibraryModalController
            vc.user = user!
        }
    }
    
    @IBAction func didClickSubmit(sender: AnyObject) {
        
    }
    
}