//
//  MessagesViewController.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-04-16.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var tutorNameHeadingLabel: UILabel!
    
    var tutorName: String?
    
    @IBAction func tappedBackArrow(_ sender: Any) {
        dismiss(animated: true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorNameHeadingLabel.text = tutorName
    }
    
}
