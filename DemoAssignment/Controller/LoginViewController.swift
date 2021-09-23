//
//  LoginViewController.swift
//  DemoAssignment
//
//  Created by Shadab Hussain on 23/09/21.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var singButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
           self.navigationController?.pushViewController(newViewController, animated: true)
        validFiled()
    }
    
    @IBAction func singTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "singUp") as! SignUpViewController
           self.navigationController?.pushViewController(newViewController, animated: true)
    }
    func validFiled(){
        if emailTextField.text?.isEmpty == true {
            print("No Text in Email Filed")
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("No Text  in Passwors Field")
            return
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard self != nil else { return }
            if let error = error {
                print("error\(error.localizedDescription)")
            }
           
            self!.checkUserInfo()

    }
}
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
           
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
               self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
}
