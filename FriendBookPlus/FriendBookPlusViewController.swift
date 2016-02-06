//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Chase Drum on 12/20/15.
//  Copyright © 2015 Chase Drum. All rights reserved.
//

import UIKit

class FriendBookPlusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func createFriends() {
        
        /* ["Elaine", "George", "Jerry", "Kramer"]*/
        
        let elaine = Friend()
        elaine.name = "Elaine"
        elaine.phoneNumber = "5!3-543-4332"
        elaine.birthday = "Sept. 5th"
        self.friends.append(elaine)
        
        let george = Friend()
        george.name = "George"
        george.phoneNumber = "523-543-4332"
        george.birthday = "Sept. 6th"
        self.friends.append(george)
        
        let jerry = Friend()
        jerry.name = "Jerry"
        jerry.phoneNumber = "503-543-4332"
        jerry.birthday = "Sept. 4th"
        self.friends.append(jerry)
        
        let kramer = Friend()
        kramer.name = "Kramer"
        kramer.phoneNumber = "503-543-4332"
        kramer.birthday = "Sept. 4th"
        self.friends.append(kramer)
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return self.friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
    }
    
    
    
    
    
    
}

