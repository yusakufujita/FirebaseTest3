//
//  TimeLineViewController.swift
//  FirebaseTest3
//
//  Created by 藤田優作 on 2020/12/08.
//

import UIKit
import Firebase

private let AuthVerificationIDKey = "authVerificationID"

extension UserDefaults {
    var authVerificationID: String? {
        set(newValue) {
            set(newValue, forKey: AuthVerificationIDKey)
            synchronize()
        } get {
            return string(forKey: AuthVerificationIDKey)
        }
    }
}

extension UIViewController {
    func showMessagePrompt(message: String) {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        (navigationController ?? self)?.present(alertController, animated: true, completion: nil)
    }
}


class PLoginViewController: UIViewController {
            
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func LoginButton(_ sender: Any) {
//        let phonenum = phone.text
//        let pass = password.text
//        Auth.auth().signIn(withEmail: "", password: pass ?? "") {
//            _, error in
//            if error != nil {
//                return
//            }
//            self.performSegue(withIdentifier: "segue1", sender: nil)
//        }
        
        Auth.auth().languageCode = "ja";
        
        guard let phoneNumber = phone.text else {
            print("エラー")
            return
        }

        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                if let error = error {
                    self.showMessagePrompt(message: "ErrorDescription \(error.localizedDescription)")
                    return
                }
            self.performSegue(withIdentifier: "segue1", sender: nil)
                // 確認IDをアプリ側で保持しておく
                if let verificationID = verificationID {
                    print("verificationID \(verificationID)")
                    UserDefaults.standard.authVerificationID = verificationID
                }
            }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
