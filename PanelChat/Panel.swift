//
//  Panel.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation

//class Panel: Deserializable{
//    var User: PanelUser?
//    var Comment: PanelComment
//    var Story: PanelStory?
//    
//    init(user:PanelUser, comment:PanelComment, story:PanelStory){
//        self.User = user
//        self.Comment = comment
//        self.Story = story
//    }
//    
//    required init(data: [String: AnyObject]) {
//        self.User <<<< data["User"]
//        self.Comment <<<< data["RealName"]
//        self.Story <<<< data["TwitterHandel"]
//    }
//    
//}

class Panel: Deserializable {
    var Title:String?
    var ImageUrl:String?
    var Comment:String?
    var Domain:String?
    var Content:String?
    var Author:String?
    var Likes:Int?
    var Comments:Int?
    var HashTag:String?
    
    
    init(title:String){
        self.Title = title
    }
    required init(data: [String: AnyObject]) {
        self.Title <<< data["title"]
        self.ImageUrl <<< data["lead_image_url"]
        self.Comment <<< data["comment"]
        self.Domain <<< data["domain"]
        self.Content <<< data["content"]
        self.Author <<< data["author"]
        self.HashTag <<< data["hashTag"]
    }
}


