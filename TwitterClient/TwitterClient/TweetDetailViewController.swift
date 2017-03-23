import UIKit

class TweetDetailViewController: UIViewController {
    
    var tweet : Tweet!

    @IBOutlet weak var isRetweet: UILabel!
    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("IsRetweet: \(tweet.retweet_count)")
        
        self.detailText.text = tweet.text
        self.userText.text = tweet.user?.name
        if (tweet.retweet_status == true) {
            self.isRetweet.text = "This is a Retweet."
        } else {
            self.isRetweet.text = "Not a Retweet."
        }
        
    }

}
