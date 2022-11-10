//
//  KeychainService.swift
//  EquipmentMaintainnce
//
//  Created by 醒着像睡着 on 11/9/22.
//

import Foundation
import KeychainSwift

class KeyChainService{
    var _keyChain = KeychainSwift()
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }
    }
    
}


