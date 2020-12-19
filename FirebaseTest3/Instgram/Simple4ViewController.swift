//
//  Simple4ViewController.swift
//  FirebaseTest3
//
//  Created by 藤田優作 on 2020/12/10.
//

import UIKit

class Simple4ViewController: UIViewController {

    var text: String?
    var backgroundColor: UIColor?
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        testLabel.text = "Screen \(text ?? "")"
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
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
