//
//  NewsFeedDetailsController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation
import UIKit
class NewsFeedDetailViewController : UIViewController{
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var FollowBtn: UIButton!
    @IBOutlet weak var HashTags: UILabel!
    @IBOutlet weak var Comment: UILabel!
    @IBOutlet weak var StoryView: UIView!
    
    var panel:Panel?
    
    override func viewDidLoad() {
        
        if let comment = panel!.Title{
            self.Comment.text = comment
        }
        if let hash = panel!.HashTag{
            self.Comment.text = hash
        }
        
    }
    
}