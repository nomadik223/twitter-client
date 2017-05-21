//
//  HomeTimelineViewController.swift
//  Twitter Client
//
//  Created by Kent Rogers on 3/23/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [Tweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var userProfile : User?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timelineImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Timeline"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let tweetNib = UINib(nibName: "TweetNibCell", bundle: nil) //or Bundle.main
        
        self.tableView.register(tweetNib, forCellReuseIdentifier: TweetNibCell.identifier)
        
        updateTimeline()
        
        self.timelineImage.image = #imageLiteral(resourceName: "foodwars")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue , sender: sender)
        
        switch segue.identifier {
        case TweetDetailViewController.identifier?:
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                let selectedTweet = self.dataSource[selectedIndex]
                
                guard let destinationController = segue.destination as? TweetDetailViewController else { return }
                
                destinationController.tweet = selectedTweet
                
            }
        case "userDetailSegue"?:
            guard segue.destination is UserDetailViewController else { return }
        default:
            return
        }
        
    }
    
    func updateTimeline() {
        
        self.activityIndicator.startAnimating()
        
        
        API.shared.getTweets { (tweets) in
            guard let tweets = tweets else { fatalError("Tweets came back nil.") }
            
            
            
            OperationQueue.main.addOperation {
                
                self.dataSource = tweets
                self.activityIndicator.stopAnimating()
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetNibCell.identifier , for: indexPath) as! TweetNibCell
        
        let tweet = self.dataSource[indexPath.row]
        
        cell.tweet = tweet
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: TweetDetailViewController.identifier, sender: nil)
    }
    
}
