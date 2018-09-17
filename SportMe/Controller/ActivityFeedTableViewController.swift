//
//  ActivityFeedTableViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 10/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit
import FirebaseDatabase

var ref:DatabaseReference?
var databaseHandle:DatabaseHandle?

class ActivityFeedTableViewController: UITableViewController {
    
    var activityType = [String]()
    var myIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      //  tableView.delegate = self
        
        ref = Database.database().reference()
        
        databaseHandle = ref?.child("Activities").observe(.value, with: {(snapshot) in
    
        if let result = snapshot.children.allObjects as? [DataSnapshot] {
            
            for child in result {
                
                let activityID = child.key as String //get autoID
        
        //Retrieve the posts and listen for changes - Observe Activities and Child Added
        databaseHandle = ref?.child("Activities/\(activityID)/Activity").observe(.value, with: { (snapshot) in
            

                    
            //Code to execure child is added in table
            //Take Value from the snapshot and add it to the post data array
            //Try to convert the  value of the data to a string
            let activity = snapshot.value as? String
            
            if let actualActivity = activity {
                //Append Data to our activityType Array
                self.activityType.append(actualActivity)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
                })
            }
            }
        })
    }
        //fetchResultFromFirebase()
                    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //Retrieve posts and listen for changes

                    
                    
                    
 //   func fetchResultFromFirebase() {
        //Set Firebase Reference
    
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
        return activityType.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = activityType[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "showActivity", sender: self)
        
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

    // In a storyboard- application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
