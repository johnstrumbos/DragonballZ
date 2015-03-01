//
//  NewsFeedController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
func setDummyUsers() -> [PanelUser]{
    var dummyUser1 = PanelUser()
    dummyUser1.ImageUrl = "https://media.licdn.com/mpr/mpr/shrink_400_400/p/7/005/067/0a8/03df858.jpg"
    dummyUser1.Name = "Jason"
    
    var dummyUser2 = PanelUser()
    dummyUser2.ImageUrl = "https://media.licdn.com/mpr/mpr/shrink_400_400/p/7/005/067/0a8/03df858.jpg"
    dummyUser2.Name = "Jason"
    
    
    var dummyUser3 = PanelUser()
    dummyUser3.ImageUrl = "https://media.licdn.com/mpr/mpr/shrink_400_400/p/7/005/067/0a8/03df858.jpg"
    dummyUser3.Name = "Jason"
    
    return [dummyUser1,dummyUser2,dummyUser3]
}


class NewsFeedViewController : UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var FilterTextBox: UITextField!
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    var panels:[Panel]?
    var dummyUsers:[PanelUser]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.dummyUsers = setDummyUsers()
        
           self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.panels!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: NewsFeedCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as NewsFeedCell
        //  cell.textLabel?.font  = UIFont(name: "Helvetica", size: 20.0)
        //cell.textLabel?.textColor = UIColor.whiteColor()
        cell.UserName.text = dummyUsers![indexPath.row].Name
        
        if let imgURL = dummyUsers![indexPath.row].ImageUrl{
            if let iurl = NSURL(string: imgURL){
                let data = NSData(contentsOfURL: iurl)
                cell.UserImage.image = UIImage(data: data!)
            }
        }
        if let hash =  self.panels![indexPath.row].HashTag{
            cell.HashTag.text = hash
        }
        if let comment = self.panels![indexPath.row].Comment{
            cell.Comment.text = comment
        }
        
        if let title = self.panels![indexPath.row].Title{
            cell.Comment.text = title
        }
        
        if let imageURL = self.panels![indexPath.row].ImageUrl{
            if let url = NSURL(string: imageURL){
                let data = NSData(contentsOfURL: url)
                cell.UserImage.image = UIImage(data: data!)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var panel = self.panels![indexPath.row]
        
        //self.performSegueWithIdentifier("showDashboard", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showUserDetails") {
            let vc: NewsFeedDetailViewController = segue.destinationViewController as NewsFeedDetailViewController
            
            //dummy
            vc.UserName.text = dummyUsers![0].Name
            
            if let imageURL = dummyUsers![0].ImageUrl{
                if let url = NSURL(string: imageURL){
                    let data = NSData(contentsOfURL: url)
                    vc.UserImage.image = UIImage(data: data!)
                }
            }
            
        }
    }
}

class NewsFeedCell: UITableViewCell {
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var HashTag: UILabel!
    @IBOutlet weak var Comment: UILabel!
    @IBOutlet weak var PanelImage: UIImageView!
    @IBOutlet weak var PanelTitle: UILabel!
    @IBOutlet weak var FollowBtn: UIButton!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var CommentsBtn: UIButton!
}