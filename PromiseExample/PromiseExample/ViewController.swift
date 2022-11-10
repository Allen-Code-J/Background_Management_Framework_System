//
//  ViewController.swift
//  PromiseExample
//
//  Created by 醒着像睡着 on 11/9/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit

class ViewController: UIViewController {

    @IBOutlet weak var txtSymbol: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockValue(_ sender: Any) {
        
let apiKey = "74d031a021379bf5fec2d104c7a98fee"

        var url = "https://financialmodelingprep.com/api/v3/quote/"
        url += txtSymbol.text!
        url += "?apikey="
        url += apiKey
        getStockQuote(url: url)
            .done{ companyQuote in
                print(companyQuote)
            }
            .catch{error in
                print(error)
            }
        
    }
    
    func getStockQuote(url: String) -> Promise<CompanyQuote> {
        return Promise<CompanyQuote> { seal -> Void in
            AF.request(url).responseJSON { responseData in
                print(responseData)
                
                
                
                if responseData.error != nil {
                    seal.reject(responseData.error!)
                }
                
                guard let stock = JSON(responseData.data!).array?.first else { return }
                
                let quote = CompanyQuote()
                quote.symbol = stock["symbol"].stringValue
                quote.name = stock["name"].stringValue
                quote.price = stock["price"].floatValue
                seal.fulfill(quote)
            }

        }
    }
}

