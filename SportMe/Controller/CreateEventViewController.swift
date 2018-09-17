//
//  CreateEventViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 13/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CreateEventViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var activityType: UITextField!
    @IBOutlet weak var locationType: UITextField!
    @IBOutlet weak var dateOfActivity: UIDatePicker!
    @IBOutlet weak var attendeeCount: UITextField!
    
    var ref:DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let dateOfActivity = formatDateOfActivity()
        //    formatDateOfActivity()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addActivity(_ sender: Any) {
        
        guard let currentUserEmail = Auth.auth().currentUser?.email,
            let activityType = self.activityType.text,
            let locationType = self.locationType.text,
            let date = self.formatDateOfActivity() else {
            preconditionFailure("No current user")
        }
        
        let activitiesDB = Database.database().reference().child("Activities")
        let activitiesDictionary : Dictionary<String, Any> = ["User" : currentUserEmail,
                                                             "Activity" : activityType,
                                                             "Location" : locationType,
                                                             "Date" : date]
        
        activitiesDB.childByAutoId().setValue(activitiesDictionary) {
            (error, ref) in
            if error != nil {
                print(error!)
            }
            else {
                print("Message saved successfully!")
            }
            self.performSegue(withIdentifier: "goToActivityFeed", sender: self)
        }
        
    }
    
    func formatDateOfActivity() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: self.dateOfActivity.date)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //TODO - Post Data to Firebase
    
}



//TODO Connect buttons


