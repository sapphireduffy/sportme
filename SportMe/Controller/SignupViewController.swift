//
//  SignupViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 03/08/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.


import UIKit



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
        
    }
    
    
}
