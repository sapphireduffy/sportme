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
    
    var activityType = [Activity]()
    var myIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "activityCell")
        
        ref = Database.database().reference()
        databaseHandle = ref?.child("Activities").observe(.value, with: { (snapshot) in
    
            if let activities = snapshot.children.allObjects as? [DataSnapshot] {
                self.activityType.removeAll()
                for activity in activities {
                    let id = activity.key
                    databaseHandle = ref?.child("Activities/\(id)").observe(.value, with: { (snapshot) in
                        guard let activityName = snapshot.childSnapshot(forPath: "Activity").value as? String ,
                            let activityDate = self.formatDateOfActivity(date: snapshot.childSnapshot(forPath: "Date").value as! String),
                            let activityLocation =  snapshot.childSnapshot(forPath: "Location").value as? String,
                            let activityUser = snapshot.childSnapshot(forPath: "User").value as? String else {
                                preconditionFailure("Invalid activity")
                        }
                        
                        self.activityType.append(Activity(name: activityName, date: activityDate, location: activityLocation, user: activityUser))
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
                        }
                    })
                }
            }
        })
    }
    
    func formatDateOfActivity(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.date(from: date)
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
        return activityType.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as! ActivityTableViewCell
        cell.name.text = activityType[indexPath.row].name
        cell.location.text = activityType[indexPath.row].location
        cell.date.text = "17-09-2018 23:04"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedActivity  = self.activityType[indexPath.row]
        let activityInfoView = ActivityDetailViewController(nibName: "ActivityDetailViewController", bundle: nil, activity: selectedActivity)
        self.navigationController?.pushViewController(activityInfoView, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
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
