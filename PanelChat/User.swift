//
//  User.swift
//  PanelChat
//
//  Created by Dashon Howard on 2/28/15.
//  Copyright (c) 2015 PanelChat. All rights reserved.
//

import Foundation

class PanelUser: Deserializable{
    var Name: String?
    var Email: String?
    var TwitterName: String?
    var TwitterToken: String?
    var AboutMe:String?
    var ImageUrl:String?
    var Libraries:[PanelStory]?
    var Panels:[Panel]?
    
    //    init(password:String, twitterName:String, twitterToken:String, email:String, realName:String){
    //        self.Email = email
    //        self.Name = realName
    //        self.TwitterName = twitterName
    //        self.TwitterToken = twitterToken
    //        self.Name = realName
    //    }
    //
    
    init(){
        
    }
    
    required init(data: [String: AnyObject]) {
        self.Email  <<< data["email"]
        self.Name <<< data["realname"]
        self.TwitterName <<< data["twitterhandle"]
        self.TwitterToken <<< data["token"]
        self.AboutMe <<< data["aboutme"]
        self.ImageUrl <<< data["image"]
        self.Libraries <<<<* data["library"]
        self.Panels <<<<* data["panels"]
    }
    
}

class PanelUsers {
    var users: [PanelUser] = []
    
    required init(data: AnyObject) {
        if let con = data as? [String: AnyObject] {
            var user = PanelUser(data: con)
            users.append(user)
        }
    }
}