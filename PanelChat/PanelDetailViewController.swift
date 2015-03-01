//
//  PanelDetailViewController.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import UIKit
import Foundation

class PanelDetailViewController : UIViewController{
    
    @IBOutlet weak var PanelImage: UIImageView!
    
    @IBOutlet weak var PanelTitle: UILabel!
    @IBOutlet weak var PanelLink: UILabel!
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var CreatePanelBtn: UIBarButtonItem!
    
    var panel:PanelStory?
    
    override func viewDidLoad() {
           self.navigationController?.setToolbarHidden(false, animated: true)
        
        if let imageURL = panel!.ImageUrl{
            if let url = NSURL(string: imageURL){
                let data = NSData(contentsOfURL: url)
                PanelImage.image  = UIImage(data: data!)
            }
        }
        
        if let title = panel?.Title{
            self.PanelTitle.text = title
        }
        
        if let link = panel?.Domain{
            self.PanelLink.text = link
        }
        
        if let content = panel?.Content{
            self.Content.text = content
        }
        
    }
}