//
//  TweetNibCell.swift
//  TwitterClient
//
//  Created by Kent Rogers on 5/21/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import UIKit

class TweetNibCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            self.tweetLabel.text = tweet.text
            self.usernameLabel.text = tweet.user?.name ?? "Unknown User"
            
            if let user = tweet.user {
                print(user.profileImageURL)
                UIImage.fetchImageWith(user.profileImageURL) { (image) in
                    self.userImageView.image = image
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
