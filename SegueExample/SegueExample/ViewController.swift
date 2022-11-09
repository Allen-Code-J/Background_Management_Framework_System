//
//  ViewController.swift
//  SegueExample
//
//  Created by 醒着像睡着 on 11/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func secondVCAction(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            guard let welcomeStr = txtName.text else{return}
            
            secondVC.welcomeStr = welcomeStr
        }
    }
}

