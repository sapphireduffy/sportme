//
//  SignupViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 03/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.


import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class SignupViewController: UIViewController {
    
    //Variables
// databaseRef = Database.database().reference(fromURL: "https://sportme-a27c2.firebaseio.com/")
//    let userID = Auth.auth().currentUser!.uid
    
    //Outlets
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            var alertTitle = String()
            var alertMessage = String()
            var alertActionTitle = String()
            var completionHandler: (UIAlertAction) -> Void
            
            if error != nil {
                alertTitle = "Error"
                alertMessage = "Invalid Email or Password. Please try again."
                alertActionTitle = "Try Again"
                 // This action to dismiss and re-show the signup page
                completionHandler = { alertAction in
                    return
                }
        
               
            }
            else {
                alertTitle = "Registration Successful"
                alertMessage = "You may now login. Thank You!"
                alertActionTitle = "OK"
                completionHandler = { _ in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "loginSignupID")
                    self.present(controller, animated: true, completion: nil)
                }
                
//                guard let result = user else {
//                    return
//                }
//                let uid = result.user.uid
//                let values = ["FirstName": self.firstName,
//                              "LastName": self.lastName,
//                              "Email": self.emailTextField]
//                ref?.child("Users").child(uid).setValue(values)
//                ref?.updateChildValues(values, withCompletionBlock: { (err, ref) in
//                    if err != nil {
//                        print(err!)
//                        return
//                    }
//
//                    print("Saved user successfully into Firebase")
//                })

                
                
                
            }
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: completionHandler))
            self.present(alert, animated: true, completion: nil)
        })
    
        
    }
    
}
