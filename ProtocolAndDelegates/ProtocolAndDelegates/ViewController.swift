//
//  ViewController.swift
//  ProtocolAndDelegates
//
//  Created by 醒着像睡着 on 11/8/22.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate {
    

    @IBOutlet weak var lblWelcome: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.sendNameDelegate = self
        }
    }
    
    func sendName(name: String) {
        lblWelcome.text = "Welcome \(name) !!!"
    }
    
    
    
    
    
   
    
}

