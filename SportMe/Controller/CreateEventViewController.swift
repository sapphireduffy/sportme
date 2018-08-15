//
//  CreateEventViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 13/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateEventViewController: UIViewController {
    
    @IBOutlet weak var activityType: UITextField!
    
    var ref:DatabaseReference?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addActivity(_ sender: Any) {
        
        ref?.child("Activities").childByAutoId().setValue(activityType.text)
        
        self.performSegue(withIdentifier: "goToActivityFeed", sender: self)
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
