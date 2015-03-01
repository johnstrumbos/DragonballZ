//
//  ProfileViewController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController,UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var addtToLibraryBtn: UIButton!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var NumberOfFollowers: UILabel!
    @IBOutlet weak var NumberFollowing: UILabel!
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserDescription: UILabel!
    
    @IBOutlet weak var SettingsBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var libraries:[PanelStory]?
    var panels:[Panel]?
    var user:PanelUser?
    var selectedPanel:PanelStory?
    var image:UIImage?
    
    override func viewDidLoad() {
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.SegmentControl.selectedSegmentIndex = 1
        self.SegmentControl.enabled = false
        if let imgURL = self.user!.ImageUrl{
            if let url = NSURL(string: imgURL){
                let data = NSData(contentsOfURL: url)
                self.ProfileImage.image = UIImage(data: data!)
            }
        }
        
        if let name = user!.Name{
            self.UserName.text = name
        }
        
        if let description = user!.AboutMe{
            self.UserDescription.text = description
        }
        
        if let Userpanels = user!.Panels{
            self.panels = Userpanels
        }
        if let libs = user!.Libraries{
            self.libraries = libs
        }
        
        self.NumberFollowing.text = 30.description
        self.NumberOfFollowers.text = 43.description
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if let Libs = libraries{
            count = Libs.count
        }
        return count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 115
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: LibraryCell = self.tableView.dequeueReusableCellWithIdentifier("LibraryCell") as LibraryCell
        //  cell.textLabel?.font  = UIFont(name: "Helvetica", size: 20.0)
        //cell.textLabel?.textColor = UIColor.whiteColor()
        
        if let domain =  self.libraries![indexPath.row].Domain{
            cell.UrlDomain.text = domain
        }
        //        if let hash =  self.libraries![indexPath.row].Domain{
        //            cell.HashTag.text = hash
        //        }
        if let titleTxt = self.libraries![indexPath.row].Title{
            cell.Title.text = titleTxt
        }
        
        if let imgURL = libraries![indexPath.row].ImageUrl{
            if let url = NSURL(string: imgURL){
                let data = NSData(contentsOfURL: url)
                cell.Image.image = UIImage(data: data!)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var library = self.libraries![indexPath.row]
        selectedPanel = library
        self.performSegueWithIdentifier("showPanelDetails", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showUserDetails") {
            let vc: PanelCommentsModalController = segue.destinationViewController as PanelCommentsModalController
        }else if (segue.identifier == "showPanelDetails") {
            let vc: PanelDetailViewController = segue.destinationViewController as PanelDetailViewController
            vc.panel = selectedPanel
        }else if (segue.identifier == "showSnapShot") {
            let vc: SnapShotPreviewViewController = segue.destinationViewController as SnapShotPreviewViewController
            
        }
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
    
        var imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true) { () -> Void in
            
        }
    }
    
  
}

class LibraryCell: UITableViewCell {
    
    @IBOutlet weak var UrlDomain: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Title: UILabel!
}