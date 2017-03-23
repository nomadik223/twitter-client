//
//  Tweets.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/21/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import Foundation

class Tweet {
    
    let text: String
    let id: String
    let retweet_count: Int
    let retweet_status: Bool
    
    var user: User?
    
    init?(json: [String: Any]) {
        if let _ = json["retweeted_status"] as? [String: Any?] {
            self.retweet_status = true
            print("True")
        } else {
            self.retweet_status = false
            print("False")
        }
        if let text = json["text"] as? String, let id = json["id_str"] as? String, let retweet_count = json["retweet_count"] as? Int {
            self.text = text
            self.id = id
            if let userDictionary = json["user"] as? [String: Any] {
                self.user = User(json: userDictionary)
            }
            self.retweet_count = retweet_count
            
        } else {
            return nil
        }
    }
}
