//
//  DashboardViewController.swift
//  PatientHealthChart
//
//  Created by 醒着像睡着 on 11/10/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


class DashboardViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var dateOfBirthPicker: UIDatePicker!
    
    
    @IBOutlet weak var txtHeightFT: UITextField!
    
    @IBOutlet weak var txtHeightInchs: UITextField!
    
    
    @IBOutlet weak var txtWeight: UITextField!
    
    
    
    var db: Firestore?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()

    }
    
    @IBAction func savePatientDetailsAction(_ sender: Any) {
        //first name
        //last name
        //dob
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let firstName = txtFirstName.text else {return}
        guard let lastName = txtLastName.text else {return}
        guard let heightFT = txtHeightFT.text else {return}
        guard let heightInches = txtHeightInchs.text else {return}
        guard let weight = txtWeight.text else {return}
        let DOB = dateOfBirthPicker.date
        
        
        // Add a new document with a generated ID
        guard let db = db else {return}
        let path = "Patients";
        db.collection("Patients").document(uid).setData([
            "FirstName": firstName,
            "LastName": lastName,
            "HeightInFT": Int(heightFT) ?? 5,
            "HeightInInches": Int(heightInches) ?? 0,
            "Weight": Int(weight) ?? 150]
        ){ err in
            if let err = err {
                print("Error adding document: \(err)")
            }
        }
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
    

}
