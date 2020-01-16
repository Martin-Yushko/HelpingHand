//
//  pendingRequestCell.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-04-15.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class pendingRequestCell: UITableViewCell {

    @IBOutlet weak var tutorProfileImageView: UIImageView!
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var labelsView: UIView!
    @IBOutlet weak var tapArrowButton: UIButton!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    
    //after swiping elements
    @IBOutlet weak var reviewProfileLabel:
    UILabel!
    @IBOutlet weak var cancelRequestLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cancelImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var tapBackArrowButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var reviewTutorProfileButton: UIButton!
    

    @IBOutlet weak var tutorImageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tutorImageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tutorImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var tutorImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tutorImageViewCenterYConstraint: NSLayoutConstraint!
    
    var delegate: PendingRequestsViewController?
    public var isInSecondMode = false
    
    var dataSource: TutorRequestEvent? {
        didSet {
            if let data = dataSource {
                tutorProfileImageView.image = data.tutor.profilePicture
                tutorNameLabel.text? = data.tutor.name
                subjectLabel.text? = data.subject
                let formatter = DateFormatter()
                formatter.dateFormat = "hh:mm aa"
                let startTime = formatter.string(from: data.startTime)
                let endTime = formatter.string(from: data.endTime)
                timeLabel.text? = (startTime + " - " + endTime).lowercased()
                
                let statusText = NSMutableAttributedString(string: "Status : ", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 4/255, green: 59/255, blue: 159/255, alpha: 0.8)])
               
                if data.isConfirmed {
                    statusText.append(NSAttributedString(string: "CONFIRMED", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 163/255, blue: 112/255, alpha: 1)]))
                } else {
                    statusText.append(NSAttributedString(string: "PENDING", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)]))
                    messageImageView.alpha = 0.5
                    messageLabel.alpha = 0.6
                    messageButton.isEnabled = false
                }
                let anotherFormatter = NumberFormatter()
                anotherFormatter.numberStyle = .currency
                totalCostLabel.text = anotherFormatter.string(for: data.totalCost)!
                
                //THIS IS BUGGED
                statusText.addAttributes( [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 19) ?? UIFont.systemFont(ofSize: 19) ], range: rangeForEntireLength(str: statusText))
                
                statusLabel.attributedText = statusText
            }
        }
    }
    

    @IBAction func tappedReviewTutorProfile(_ sender: Any) {
        if let delegater = delegate {
            if let data = dataSource {
                delegater.callSegueFromCellToReviewTutorProfile(myData: data)
            }
        }
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        if let delegater = delegate {
            if let data = dataSource {
                delegater.cancelTutor(myData: data)
            }
        }
    }
    
    @IBAction func tappedMessage(_ sender: Any) {
        
        if messageImageView.image == UIImage(named: "messageIconWithNotification") {
            self.messageImageView.image = UIImage(named: "messageIcon")
            self.tapArrowButton.setImage(UIImage(named: "cellArrow"), for: .normal)
            
            let indexOfRequest = GlobalVariables.user.pendingRequests.firstIndex { (tutorRequest) -> Bool in
                guard let myRequest = dataSource else {return false}
                if tutorRequest == myRequest {
                    return true
                }
                return false
            }
            if let index = indexOfRequest {
                GlobalVariables.user.pendingRequests[index].hasNotification = false
            }
        }
        
        if let delegater = delegate {
            if let data = dataSource?.tutor.name {
                delegater.callSegueFromCellToMessageTutor(myData: data)
            }
        }
        
    }
    
    @IBAction func tappedCellBack(_ sender: Any) {
        didSwipeLeft()
    }
    
    
    @IBAction func tappedCell(_ sender: Any) {
        didSwipeRight()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cancelButton.isEnabled = false
        messageButton.isEnabled = false
        
        tapBackArrowButton.alpha = 0
        messageLabel.transform = CGAffineTransform(translationX: -300, y: 0)
        cancelRequestLabel.transform = CGAffineTransform(translationX: -300, y: 0)
        reviewProfileLabel.alpha = 0
        messageImageView.transform = CGAffineTransform(translationX: -300, y: 0)
        cancelImageView.transform = CGAffineTransform(translationX: -300, y: 0)
 
        tutorProfileImageView.layer.cornerRadius = tutorProfileImageView.frame.width/2
        tutorProfileImageView.clipsToBounds = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeRight.direction = .right
        self.contentView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRight.direction = .left
        self.contentView.addGestureRecognizer(swipeLeft)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didSwipeRight() {
        if isInSecondMode { return }
        UIView.animate(withDuration: 0.75, animations: {
            self.statusLabel.alpha = 0
            self.tapArrowButton.alpha = 0
            self.tapBackArrowButton.alpha = 1
            self.tutorImageViewWidthConstraint.constant = 60
            self.tutorImageViewHeightConstraint.constant = 60
            self.tutorProfileImageView.layer.cornerRadius = 30
            self.tutorImageViewTrailingConstraint.priority = UILayoutPriority(rawValue: 900)
            self.tutorImageViewCenterYConstraint.priority = UILayoutPriority(rawValue: 900)
            
            self.labelsView.transform = CGAffineTransform(translationX: 300, y: 0)
            self.messageLabel.transform = CGAffineTransform(translationX: -300, y: 0)
            self.cancelRequestLabel.transform = .identity
            self.totalCostLabel.alpha = 0
            self.reviewProfileLabel.alpha = 1
            self.messageImageView.transform = .identity
            self.messageLabel.transform = .identity
            self.cancelImageView.transform = .identity
            self.contentView.layoutIfNeeded()
        })
        
        cancelButton.isEnabled = true
        messageButton.isEnabled = true
        
        if let myDelegate = delegate {
            myDelegate.checkCellsMode()
        }
        
        isInSecondMode = true
        
    }

    @objc func didSwipeLeft() {
        
        if !isInSecondMode { return }
        
        cancelButton.isEnabled = false
        messageButton.isEnabled = false
        
        UIView.animate(withDuration: 0.75, animations: {
            self.tapArrowButton.alpha = 1
            self.statusLabel.alpha = 1
            self.tapBackArrowButton.alpha = 0
            self.tutorImageViewWidthConstraint.constant = 92
            self.tutorImageViewHeightConstraint.constant = 92
            self.tutorProfileImageView.layer.cornerRadius = 46
            self.tutorImageViewTrailingConstraint.priority = UILayoutPriority(rawValue: 800)
            self.tutorImageViewCenterYConstraint.priority = UILayoutPriority(rawValue: 800)
            
            self.labelsView.transform = .identity
            self.messageLabel.transform = CGAffineTransform(translationX: -300, y: 0)
            self.cancelRequestLabel.transform = CGAffineTransform(translationX: -300, y: 0)
            self.totalCostLabel.alpha = 1
            self.reviewProfileLabel.alpha = 0
            self.messageImageView.transform = CGAffineTransform(translationX: -300, y: 0)
            self.cancelImageView.transform = CGAffineTransform(translationX: -300, y: 0)
            
            self.contentView.layoutIfNeeded()
        })
        
       isInSecondMode = false
    }
}
