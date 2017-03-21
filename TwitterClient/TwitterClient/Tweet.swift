//
//  Tweet.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/20/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import Foundation

class Tweet {
    
    let text: String
    let id: String
    
    var user: User?
    
    init?(json: [String: Any]) {
        if let text = json["text"] as? String, let id = json["id_str"] as? String {
            self.text = text
            self.id = id
            if let userDictionary = json["user"] as? [String: Any] {
                self.user = User(json: userDictionary)
            }
            
        } else {
            return nil
        }
    }
}
