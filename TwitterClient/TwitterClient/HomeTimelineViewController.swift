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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        updateTimeline()
        
    }
    
    func updateTimeline() {
        API.shared.getTweets { (tweets) in
            
            OperationQueue.main.addOperation {
                
                self.dataSource = tweets ?? []
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let tweet = dataSource[indexPath.row]
        
        cell.textLabel?.text = tweet.text
        cell.detailTextLabel?.text = tweet.user?.name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
