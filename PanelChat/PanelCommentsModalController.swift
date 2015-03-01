//
//  PanelCommentsModalController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class PanelCommentsModalController : UIViewController{
    
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var NewHashTag: UITextField!
    @IBOutlet weak var NewComment: UITextView!
    @IBOutlet weak var FacebookSwitch: UISwitch!
    @IBOutlet weak var TwitterSwitch: UISwitch!
    @IBOutlet weak var MailSwitch: UISwitch!
    @IBOutlet weak var SubmitBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var comments:[PanelComment]?
    var dummyUsers:[PanelUser]?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CommentCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as CommentCell
        //  cell.textLabel?.font  = UIFont(name: "Helvetica", size: 20.0)
        //cell.textLabel?.textColor = UIColor.whiteColor()
        
        cell.UserName.text = dummyUsers![indexPath.row].Name
      
        if let imageURL = dummyUsers![indexPath.row].ImageUrl{
            if let url = NSURL(string: imageURL){
                let data = NSData(contentsOfURL: url)
                cell.UserImage.image = UIImage(data: data!)
            }
        }
        
        if let hash =  self.comments![indexPath.row].HashTag{
            cell.HashTag.text = hash
        }
        
        if let comment = self.comments![indexPath.row].Text{
            cell.Comment.text = comment
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var panel = self.comments![indexPath.row]
        
        //self.performSegueWithIdentifier("showDashboard", sender: self)
    }
    
    override func viewDidLoad() {
        self.dummyUsers = setDummyUsers()
    }
    
}


class CommentCell: UITableViewCell {
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var HashTag: UILabel!
    @IBOutlet weak var Comment: UILabel!
    @IBOutlet weak var LikesBtn: UIButton!
    @IBOutlet weak var CommentsBtn: UIButton!
}