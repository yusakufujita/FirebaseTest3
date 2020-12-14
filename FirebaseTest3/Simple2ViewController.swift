//
//  ExampleViewController.swift
//  FirebaseTest3
//
//  Created by 藤田優作 on 2020/12/09.
//

import UIKit

class Simple2ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var text: String?
    var backgroundColor: UIColor?
    
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
