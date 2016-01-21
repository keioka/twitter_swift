//
//  ViewController.swift
//  Twitter-Sample
//
//  Created by OrderTrip on 1/20/16.
//  Copyright (c) 2016 Kei Oka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var accountList:[Dictionary<String, String>]? //Createing empty dictionary
//    var accountList:[Dictionary[String, String]]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadAccount()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        loadAccount()
    }
    
    private func loadAccount(){
      accountList = [["name": "@kei"], ["name": "@oka"], ["name": "@tom"]]
    }
    
    private func createAlertController(title: String) -> UIAlertController {
      var actionSheet = UIAlertController()
      actionSheet.title = title
      return actionSheet
    }
    

    @IBOutlet weak var loginButton: NSLayoutConstraint!
    @IBAction func loginButton(sender: AnyObject) {
        
      // Create ActionSheet
        var actionSheet = createAlertController("Choose your account")
        
      // When account is selected 
        let selectAction = { (var action: UIAlertAction! ) -> Void in
          self.performSegueWithIdentifier("segueTimelineViewController", sender: nil)
        }
      
      // Add account list and closure
        if let accountListSheet:[Dictionary<String, String>] = accountList {
            for account in accountListSheet {
                let action = UIAlertAction(title: account["name"]!, style: .Default, handler: selectAction)
                actionSheet.addAction(action)
            }
        }
        
      // Show Action Sheet
        self.presentViewController(actionSheet, animated: true, completion: nil)
      // Move to the account
    }
    
    
    
    

}

