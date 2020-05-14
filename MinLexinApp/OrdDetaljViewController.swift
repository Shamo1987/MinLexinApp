//
//  OrdDetaljViewController.swift
//  MinLexinApp
//
//  Created by Shamo Zahidov on 2020-05-07.
//  Copyright © 2020 Shamo Zahidov. All rights reserved.
//

import UIKit

class OrdDetaljViewController: UIViewController {

    @IBOutlet weak var engelskaLabel: UILabel!
    
    @IBOutlet weak var svenskaLabel: UILabel!
    
    var minord:Ord?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = minord{
            engelskaLabel.text = k.engelska
            svenskaLabel.text = k.svenska
        }
    }
    

    

}
