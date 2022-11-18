//
//  imagePostTableViewCell.swift
//  InstaTok
//
//  Created by 醒着像睡着 on 11/17/22.
//

import UIKit

class imagePostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var caption: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    
    @IBOutlet weak var dateTime: UILabel!
    
    
}
