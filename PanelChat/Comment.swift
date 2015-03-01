//
//  Comment.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation

class PanelComment: Deserializable{
    var User : PanelUser?
    var HashTag: String?
    var Text: String?
    
    init(user:PanelUser, hashTag:String){
        self.User = user
        self.HashTag = hashTag
    }
    
    required init(data: [String: AnyObject]) {
        self.User <<<< data["User"]
        self.HashTag <<< data["RealName"]
        self.Text <<< data["TwitterHandel"]
    }
    
}