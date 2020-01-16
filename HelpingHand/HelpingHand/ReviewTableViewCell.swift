//
//  ReviewTableViewCell.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-03-29.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var bubbleView: UIView!
    
    @IBOutlet weak var tailImageView: UIImageView!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var reviewDescriptionLabel: UILabel!
    
    @IBOutlet weak var bubbleViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleView.layer.cornerRadius = 12
    }
}
