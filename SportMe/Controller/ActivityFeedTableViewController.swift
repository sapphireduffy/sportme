//
//  ActivityFeedTableViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 10/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit

struct Sport {
    var activityType: String
    var activityID : Int
    var activityLocation: String
    var activityOrganiser: String
    var activityPostedTime: String
    var numberOfPeople: Int
}

class ActivityFeedTableViewController: UITableViewController {
    
    var sports = [
        Sport(activityType: "Football", activityID: 1, activityLocation: "Antrim", activityOrganiser: "Sapphire Duffy", activityPostedTime: "14:24", numberOfPeople: 10),
        Sport(activityType: "American Football", activityID: 2, activityLocation: "Belfast", activityOrganiser: "Ryan Beckett", activityPostedTime: "13:25", numberOfPeople: 20),
        Sport(activityType: "Tennis", activityID: 3, activityLocation: "Belfast", activityOrganiser: "Leno Beckett", activityPostedTime: "13:25", numberOfPeople: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addEvent(_ sender: UIBarButtonItem) {
    self.performSegue(withIdentifier: "goToAddEvent", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.sports[indexPath.row].activityType

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
