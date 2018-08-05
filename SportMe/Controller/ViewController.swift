//
//  ViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 31/07/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit

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
    }
    
}

