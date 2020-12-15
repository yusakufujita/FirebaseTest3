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
import MessageUI


class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

//    var twitterProvider : OAuthProvider?
    
    var provider:OAuthProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.twitterProvider = OAuthProvider(providerID:"twitter.com");
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["lang":"ja"]
    }
    
    //再びログインされるのを防ぐ機能を作る
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func twiiterLogin(_ sender: Any) {
        
        self.provider = OAuthProvider(providerID: TwitterAuthProviderID)
        provider?.customParameters = ["force_login":"true"]
        provider?.getCredentialWith(nil, completion: {(credential, error) in
//            ログインの処理
            Auth.auth().signIn(with: credential!) { (result, error) in
                if error != nil {
                    print("エラー")
                    return
                }
                
                if result != nil {
                    print("失敗")
                }
                
                //画面遷移
                let viewVC = self.storyboard?.instantiateViewController(identifier: "viewVC") as! MypageViewController
                viewVC.userName = (result?.displayName)!
                self.navigationController?.pushViewController(viewVC, animated: true)
                self.performSegue(withIdentifier: "segue1", sender: nil)

            }
        })
        
//        self.twitterProvider?.getCredentialWith(_: nil){ (credential, error) in
//                    if error != nil {
//                        // Handle error.
//                        print("エラー")
//                    }
//                    if let credential = credential {
//                        Auth.auth().signIn(with: credential) { (authResult, error) in
//                            if error != nil {
//                                // Handle error.
//                                print("エラー")
//                            }
//                            // User is signed in.
//                            // IdP data available in authResult.additionalUserInfo.profile.
//                            // Twitter OAuth access token can also be retrieved by:
//                            // authResult.credential.accessToken
//                            // Twitter OAuth ID token can be retrieved by calling:
//                            // authResult.credential.idToken
//                            // Twitter OAuth secret can be retrieved by calling:
//                            // authResult.credential.secret
//                            self.performSegue(withIdentifier: "segue1", sender: nil)
//
//                        }
//                    }
//                }
    }
    
    


    @IBAction func loginButton(_ sender: Any) {
        let name = self.nameText.text
        let mail = self.mailText.text
        let password = self.passwordText.text
        Auth.auth().createUser(withEmail: mail ?? "", password: password ?? "") { authResult, error in
            if let user = authResult?.user {
                let req = user.createProfileChangeRequest()
                req.displayName = name
                req.commitChanges() {[weak self] error in
                    guard let self = self else {return}
                    if error == nil {
                        print("OK")
                        self.performSegue(withIdentifier: "segue1", sender: nil)
                    }
                }
            }


            if error != nil {
                print("error")
                return
            }else {
                print(authResult)
            }
        }

    }
    

}

