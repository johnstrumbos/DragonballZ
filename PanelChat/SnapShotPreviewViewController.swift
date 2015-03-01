//
//  SnapShotPreviewViewController.swift
//  PanelChat
//
//  Created by Dashon Howard on 3/1/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class SnapShotPreviewViewController: UIViewController,ClientDelegate{

    @IBOutlet weak var snapShot: UIImageView!
    var selectedImage:UIImage?
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
         self.startProcessing()
    }
    
    func startProcessing(){
        var client = Client(applicationID: "NewAppPanel", password: "78Hhu2ygL0od8e5CLUn9gPtp")
        if (NSUserDefaults.standardUserDefaults().stringForKey("installationID") == nil){
            var installationID = client.activateNewInstallation(UIDevice.currentDevice().identifierForVendor.UUIDString)
            
            NSUserDefaults.standardUserDefaults().setValue(installationID, forKey:"installationID")
        }
        
        
        var installationID = NSUserDefaults.standardUserDefaults().stringForKey("installationID")
        
        client.applicationID = client.applicationID.stringByAppendingString(installationID!)
        
        var parms = ProcessingParams()
        
        client.processImage(self.selectedImage!, withParams: parms)
    }
    
    
    func client(sender: Client!, didFailedWithError error: NSError!) {
        
        
    }
    
    func client(sender: Client!, didFinishDownloadData downloadedData: NSData!) {
        var result = NSString(data: downloadedData, encoding: NSUTF8StringEncoding)
        var trimmedResult = result!.substringToIndex(200)
        
        var parameters = ["key":"AIzaSyC-auuXHTsqbeRlyKtlZ3Ykew8_5wXNluM","cx":"008119690503341524900:7jzu0uq8jvk","q":trimmedResult]
        
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer.setValue(NSString(string: "application/json"), forHTTPHeaderField: NSString(string: "Accept"))
        manager.GET("https://www.googleapis.com/customsearch/v1", parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                var error: NSError?
                
                if let data: AnyObject = responseObject {
                    var test = data
                }
                
                //  self.SignInBtn.enabled = true
                //self.spinner.hidden  = true
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                
                //  self.SignInBtn.enabled = true
                //self.spinner.hidden  = true
                NSNotificationCenter.defaultCenter().postNotificationName("InstallationsListUpdated", object: self)
        })
    }
    
    func clientDidFinishProcessing(sender: Client!) {
        println("Downloading result....")
        
    }
    func clientDidFinishUpload(sender: Client!) {
        println("Processing Image.....")
    }

}