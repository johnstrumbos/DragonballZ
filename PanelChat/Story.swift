//
//  Story.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation


class PanelStory: Deserializable {
    var Title:String?
    var ImageUrl:String?
    var Domain:String?
    var Content:String?
    var Author:String?
    
    
    init(title:String){
        self.Title = title
    }

    required init(data: [String: AnyObject]) {
        self.Title <<< data["title"]
        self.ImageUrl <<< data["lead_image_url"]
        self.Domain <<< data["domain"]
        self.Content <<< data["content"]
        self.Author <<< data["author"]
    }
}