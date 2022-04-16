//
//  ViewController.swift
//  LoginDemo
//
//  Created by Vincent Pan on 2022/2/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: GIDSignInButton) {
        GoogleLoginManager.shared.signIn(presentViewController: self)
    }
    
    
}
