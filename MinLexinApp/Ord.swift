//
//  Ord.swift
//  MinLexinApp
//
//  Created by Shamo Zahidov on 2020-05-07.
//  Copyright © 2020 Shamo Zahidov. All rights reserved.
//

import Foundation

class Ord{
    
    var ord_id:String?
    var engelska:String?
    var svenska:String?
    
    
    init() {
        
    }
    
    init(ord_id:String,engelska:String,svenska:String) {
        self.ord_id = ord_id
        self.engelska = engelska
        self.svenska = svenska
        
    }
    
}
