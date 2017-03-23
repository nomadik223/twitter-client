//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/20/17.
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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Timeline"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        updateTimeline()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue , sender: sender)
        
        //        not sure if still needed. Will delete if no further use is shown.
        
        //        if segue.identifier == "showDetailSegue" {
        //
        //            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
        //                let selectedTweet = self.dataSource[selectedIndex]
        //
        //                guard let destinationController = segue.destination as? TweetDetailViewController else { return }
        //
        //                destinationController.tweet = selectedTweet
        //
        //            }
        //
        //        }
        
        
        switch segue.identifier {
        case "showDetailSegue"?:
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetCell
        
        cell.tweetText.text = dataSource[indexPath.row].text
        
        return cell
        
    }
    
}
