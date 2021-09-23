//
//  SignUpViewController.swift
//  DemoAssignment
//
//  Created by Shadab Hussain on 23/09/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func singUpTapped(_ sender: UIButton) {
        if emailText.text?.isEmpty == true {
            print("No Text in Email Field")
            return
        }
        if passwordText.text?.isEmpty == true {
            print("No Text in Password Field")
            return
        }
        singup()
    }
    func singup(){
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error\(error?.localizedDescription)")
                return
            }
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
               self.navigationController?.pushViewController(newViewController, animated: true)
        
        }
    }
    

}
