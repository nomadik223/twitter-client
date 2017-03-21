//
//  Tweets.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/21/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//


import Foundation

class Tweets {
    
    static let shared = Tweets()
    
    var allTweets = [Tweet]()
    
    private init(){}
    
    func add(tweet: Tweet){
        self.allTweets.append(tweet)
    }
    
    func remove(tweet: Tweet){
        self.allTweets = self.allTweets.filter{ (item) -> Bool in
            return item.id != tweet.id
        }
    }
    
    func removeAll(){
        self.allTweets.removeAll()
    }
    
    func getTweetAt(index: Int) -> Tweet{
        return self.allTweets[index]
    }
    
    func count() -> Int{
        return self.allTweets.count
    }
    
}
