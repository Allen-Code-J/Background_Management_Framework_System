//
//  DashboardViewController.swift
//  InstaTok
//
//  Created by 醒着像睡着 on 11/17/22.
//

import UIKit
import FirebaseAuth

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arr = ["Ashish", "Mark", "Tom", "Bill"]
    
    

    @IBOutlet weak var tblView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func logoutAction(_ sender: Any) {
        let keychain = KeyChainService().keyChain
        keychain.clear()

        do {
            try Auth.auth().signOut()
        }
        catch{
            print("Unable to logout")
        }

        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("imagePostTableViewCell", owner: self)?.first as! imagePostTableViewCell
                
        cell.imgView.image = UIImage(named: "LA")
        cell.caption.text = "Caption"
        cell.location.text = "Location"
        cell.dateTime.text = "DateTime"

        return cell
    }
    
}
    

