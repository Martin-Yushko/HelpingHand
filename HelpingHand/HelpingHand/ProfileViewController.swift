//
//  ProfileViewController.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-04-18.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var biographyTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBAction func tappedBackArrow(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
         populateData()
    }
    
    private func populateData() {
        biographyTextView.text = GlobalVariables.user.biography
        
        let newSize = biographyTextView.sizeThatFits(CGSize(width: biographyTextView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        biographyTextView.frame.size = CGSize(width: max(newSize.width, biographyTextView.frame.width), height: newSize.height)
        biographyTextView.isScrollEnabled = false
        //wrap around image
        let imageFrame = UIBezierPath(roundedRect: CGRect(x: profileImageView.frame.minX, y: -biographyTextView.frame.minY, width: profileImageView.frame.width, height: profileImageView.frame.height), cornerRadius: profileImageView.frame.width/2)
        let cornerFrame = UIBezierPath(rect: CGRect(x: biographyTextView.frame.width-40, y: 0, width: 40, height: 37))
        biographyTextView.textContainer.exclusionPaths = [imageFrame, cornerFrame]
        
        view.layoutSubviews()
        view.layoutSubviews()
        nameLabel.text = GlobalVariables.user.name
        titleLabel.text = GlobalVariables.user.title
        
    }
    
    
}
