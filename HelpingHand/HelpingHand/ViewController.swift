//
//  ViewController.swift
//  HelpingHand
//
//  Created by Jack He on 1/15/19.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        usernameTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
    }


}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.opacity = 0.8
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }

}

