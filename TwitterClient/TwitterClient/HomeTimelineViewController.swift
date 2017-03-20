//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/20/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONParser.tweetsFrom(data: JSONParser.sampleJSONData) { (success, tweets) in
            
            if(success){
                guard let tweets = tweets else { fatalError("TWEETS CAME BACK NIL") }
                
                for tweet in tweets{
                    print(tweet.text)
                }
            }
            
        }
        
    }
    
}
