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
            
            if error != nil {
                print(error!)
            }
            else {
                print ("Registration successful")
            }
        })
        
        
        
    }
    
    
}
