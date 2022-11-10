//
//  SecondViewController.swift
//  ProtocolAndDelegates
//
//  Created by 醒着像睡着 on 11/8/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    var sendNameDelegate : SendNameDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func setName(_ sender: Any) {
        guard let name = txtName.text else {return}
        
        sendNameDelegate?.sendName(name: name)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
