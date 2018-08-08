//
//  SignupViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 03/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.


import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {
    
    //Outlets
    
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
                
            }
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: completionHandler))
            self.present(alert, animated: true, completion: nil)
        })
    
        
    }
    
}
