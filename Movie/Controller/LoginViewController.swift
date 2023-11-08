//
//  LoginViewController.swift
//  Movie
//
//  Created by Mustafa on 25/06/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let name = userNameTextfield.text
        let pass = passwordTextfield.text
        let shouldGoNext = verfiyLogin(userName: name, password: pass)
        
        if shouldGoNext{
        
          let userDefault = UserDefaults.standard
            userDefault.setValue(true, forKey: "LoginState")
          let VC = self.storyboard?.instantiateViewController(identifier: "MovieArrayController") as! ViewController
            
            
            let navigationController = UINavigationController.init(rootViewController: VC)
            self.view.window?.rootViewController = navigationController
            self.view.window?.makeKeyAndVisible()
          //  self.navigationController?.pushViewController(VC, animated: true)
        }
        else{
            print("There is an error on entering data")
        }
        
        
        
    }
    
    func verfiyLogin(userName:String? , password:String?)->Bool {
        if userName == "Mustafa" && password == "070797"{return true}
        return false
            
        
    }
    

    
}
