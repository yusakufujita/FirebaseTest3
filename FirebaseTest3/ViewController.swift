//
//  ViewController.swift
//  FirebaseTest3
//
//  Created by 藤田優作 on 2020/12/02.
//

import UIKit
import Firebase
import TwitterKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    var provider: OAuthProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func twiiterLogin(_ sender: Any) {
        print("buttonDidPush")
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)

        guard let provider = self.provider else { return }

        provider.customParameters = [
                    "force_login": "true",
        ]

        provider.getCredentialWith(nil) { credential, error in
        guard let credential = credential, error == nil else {
                    print("Error: \(error as Optional)")
                        return
        }
//        Auth.auth().signIn(with: credential) { (result, error) in
//                        // signIn後の処理
//                }
            }
        }
    
    

//
//    @IBAction func loginButton(_ sender: Any) {
//        let name = self.nameText.text
//        let mail = self.mailText.text
//        let password = self.passwordText.text
//        Auth.auth().createUser(withEmail: mail ?? "", password: password ?? "") { authResult, error in
//            if let user = authResult?.user {
//                let req = user.createProfileChangeRequest()
//                req.displayName = name
//                req.commitChanges() {[weak self] error in
//                    guard let self = self else {return}
//                    if error == nil {
//                        print("OK")
//                        self.performSegue(withIdentifier: "segue1", sender: nil)
//                    }
//                }
//            }
//
//
//            if error != nil {
//                print("error")
//                return
//            }else {
//                print(authResult)
//            }
//        }
//
//    }
    

}

