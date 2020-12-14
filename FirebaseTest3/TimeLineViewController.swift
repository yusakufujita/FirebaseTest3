//
//  TimeLineViewController.swift
//  FirebaseTest3
//
//  Created by 藤田優作 on 2020/12/08.
//

import UIKit
import NSVAnimatedTabBar

class TimeLineViewController: UIViewController,NSVAnimatedTabControllerDelegate {
    
    func shouldOpenSubOptions() -> Bool {
        self.performSegue(withIdentifier: "segue1", sender: nil)
        return true
    }
    


    @IBOutlet weak var containerStackView: UIStackView!
    let controller =  NSVAnimatedTabController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        controller.configure(tabControllers: [getController1(index: 1, color: .white),getController2(index: 2, color: .green),getController3(index: 3, color: .white),getController4(index: 4, color: .cyan)],
                             with: DefaultAnimatedTabOptions())
        containerStackView.addArrangedSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
        
        // Do any additional setup after loading the view.
    }
    
    func getController1(index: Int, color: UIColor) -> UIViewController {
        let controller = storyboard!.instantiateViewController(withIdentifier: "Simple1") as? Simple1ViewController
        controller?.text = index.description
        controller?.backgroundColor = color
        return controller!
    }
    
    func getController2(index: Int, color: UIColor) -> UIViewController {
        let controller1 = storyboard!.instantiateViewController(withIdentifier: "SImple2") as? Simple2ViewController
        controller1?.text = index.description
        controller1?.backgroundColor = color
        return controller1!
    }

    func getController3(index: Int, color: UIColor) -> UIViewController {
        let controller1 = storyboard!.instantiateViewController(withIdentifier: "Simple3") as? Simple3ViewController
        controller1?.text = index.description
        controller1?.backgroundColor = color
        return controller1!
    }
    func getController4(index: Int, color: UIColor) -> UIViewController {
        let controller1 = storyboard!.instantiateViewController(withIdentifier: "Simple4") as? Simple4ViewController
        controller1?.text = index.description
        controller1?.backgroundColor = color
        return controller1!
    }
    
    func shouldSelect(at index: Int, item: AnimatedTabItem, tabController: UIViewController) -> Bool {
        return true
    }
    
    func didSelect(at index: Int, item: AnimatedTabItem, tabController: UIViewController) {
        print(index)

    }
    
    func shouldSelect(at index: Int, item: CenterItemSubOptionItem) -> Bool {
        return true
    }
    
    func didSelect(at index: Int, item: CenterItemSubOptionItem) {
//        print("center")
        print(index)
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
