//
//  User.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/20/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import Foundation


class User {
    
    let name: String
    let profileImageURL: String
    let location: String
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String, let profileImageURL = json["profile_image_url"] as? String, let location = json["location"] as? String {
            
            self.location = location
            self.name = name
            self.profileImageURL = profileImageURL
            
        } else {
            return nil
        }
}
