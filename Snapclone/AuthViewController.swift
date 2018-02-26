//
//  AuthViewController.swift
//  Snapclone
//
//  Created by Andy Harris on 25/02/2018.
//  Copyright © 2018 Andy Harris. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI

class AuthViewController: UIViewController {

    var loginMode = true
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var topButton: UIButton!
    
    @IBAction func topButtonTapped(_ sender: Any) {
        
        // get email and password
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if loginMode {
                    // login
                    
                  
                }
                else {
                    // sign up
                    // tthis code is from course with lady
                    // firebase will return "user" and "error"
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print(error!)
                        }
                        else {
                            // success
                            print("registration successful")
                        } // end  of if.. else
                    } // end of auth.auth().create user
                    
                } // end if..else

            } // if let passowrd
        } // if let emailtextfield
        
    } // end func
    
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBAction func bottomButtonTapped(_ sender: Any) {
        if loginMode {
            // switch to sign up
            topButton.setTitle("Sign Up", for: .normal)
            bottomButton.setTitle("Switch to Login", for: .normal)
            loginMode = false
        } else{
            //switch to login
            topButton.setTitle("Login", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
            loginMode = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

