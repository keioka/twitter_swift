//
//  TimelineViewController.swift
//  Twitter-Sample
//
//  Created by OrderTrip on 1/20/16.
//  Copyright (c) 2016 Kei Oka. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tweets:[Dictionary<String, AnyObject>]?
    
    @IBOutlet weak var tweetField: UITextField!
    @IBOutlet weak var tweetSubmit: UIButton!
    
    @IBOutlet var tableview: UITableView!
    @IBAction func tweetSubmitAction(sender: AnyObject) {
       
        let description:String = self.tweetField.text
        let tweet = ["name" : "Kei", "description": description, "icon":"twitter_icon"]
        print(tweet)
        tweets?.append(tweet)
//        tableview.beginUpdates()
//        tableview.insertRowsAtIndexPaths([
//            NSIndexPath(forRow: tweets!.count-1, inSection: 0)
//            ], withRowAnimation: .Automatic)
//        tableview.endUpdates()
//        tableview.reloadData()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            //reload your tableView
            self.tableview.reloadData()
        })
        tweetField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweets = [  ["name": "Hiro", "description": "Hey! Going to be in Frisco in October. Was hoping to have a meeting to talk about @thinkwall if you're around?", "icon":"twitter_icon"],
            ["name": "Jeff", "description": "Got the shirt @jasoncosta thanks man! Loving the #twitter bird on the shirt :-)", "icon":"user_b_icon"],
            ["name": "Chris", "description": "Loving the #twitter bird on the shirt :-)", "icon":"user_c_icon"],
            ["name": "Jeff", "description": "Was hoping to have a meeting to talk about @thinkwall if you're around?, CCC?", "icon":"user_b_icon"],
            ["name": "Chris", "description": "My old is 17.", "icon":"user_c_icon"],
            ["name": "Hiro", "description": "My name is Hiro", "icon":"user_c_icon"],
            ["name": "Jeff", "description": "Got the shirt @jasoncosta thanks man!", "icon":"user_b_icon"],
            ["name": "Chris", "description": "Loving the #twitter bird on the shirt :-)", "icon":"user_c_icon"],
            ["name": "Jeff", "description": "How old are you, CCC?", "icon":"user_b_icon"],
            ["name": "Chris", "description": "Loving the #twitter bird on the shirt :-)", "icon":"user_c_icon"],
            ["name": "Hiro", "description": "Was hoping to have a meeting to talk about", "icon":"user_c_icon"],
            ["name": "Jeff", "description": "Got the shirt @jasoncosta thanks man!", "icon":"user_b_icon"],
            ["name": "Chris", "description": "Loving the #twitter bird on the shirt", "icon":"user_c_icon"]]

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // define number of section
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // Sectionは１つにする 
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweetsList = tweets {
          return tweetsList.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // Reuse table view cell in terms of memory usage
       var cellIdentifier:String = "tweet"
       var cell = tableView.dequeueReusableCellWithIdentifier( cellIdentifier, forIndexPath: indexPath) as? UITableViewCell
        
        // If there is no reuseable cell, initialize one
        if cell == nil {
          cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        // Unwrapped cell variable and assign new variable
        var tweetCell = cell!
        
        // Create tweet to get values
        var tweetObject:AnyObject = tweets![indexPath.row]
        
        // Assign values to tweet cell
        tweetCell.imageView?.image = UIImage(named: (tweetObject["icon"] as? String)!)
        tweetCell.textLabel?.text = tweetObject["description"] as? String
        tweetCell.detailTextLabel?.text = tweetObject["name"] as? String
        
        // return cell
        return tweetCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }

}