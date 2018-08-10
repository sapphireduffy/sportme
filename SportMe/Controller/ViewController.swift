//
//  ViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 31/07/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    //Outlet Buttons
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Action Buttons
    @IBAction func signupAccountTapped(_ sender: Any) {
        print(" *!*!*!**** Signup tapped *!*!*!*")
        performSegue(withIdentifier: "goToSignup", sender: self)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        print(" *!*!*!* Login tapped *!*!*!*")

        // Force unwrapping issues here;
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            var alertTitle = String()
            var alertMessage = String()
            var alertActionTitle = String()
            if error != nil {
            alertTitle = "Error"
            alertMessage = "Invalid Email or Password. Please try again."
            alertActionTitle = "Try Again"
                
                
                
                print(error!)
            }
            else {
                
                
                print("login successful")
                
                //Segue to ActivityFeed
                self.performSegue(withIdentifier: "activityfeedID", sender: self)
                
            }
            
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: alertActionTitle, style: .default))
            self.present(alert, animated: true, completion: nil)
        })

}
        
        

}
