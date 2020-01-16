//
//  ReviewTutorProfileViewController.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-03-24.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit
import GoogleMaps
import UserNotifications

class ReviewTutorProfileViewController: UIViewController {
    
    //overview screen
    @IBOutlet weak var tutorProfileImageView: UIImageView!
    @IBOutlet weak var generatedBiographyLabel: UILabel!
    @IBOutlet weak var overviewContentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var overviewContentView: UIView!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var tutorFeeLabel: UILabel!
    @IBOutlet weak var tutorNameLabel: UILabel!
    @IBOutlet weak var tutorTitleLabel: UILabel!
    
    //rating screen
    @IBOutlet weak var reviewTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var ratingContentView: UIView!
    @IBOutlet weak var monthlyStarRatingView: StarRatingView!
    @IBOutlet weak var monthlyRatingLabel: UILabel!
    @IBOutlet weak var overallRatingLabel: UILabel!
    @IBOutlet weak var fiveStarRatingCounterLabel: UILabel!
    @IBOutlet weak var ratingContentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewMoreButton: UILabel!
    
    //qualifications screen
    
    //others
    
    @IBOutlet weak var tabView: GradientView!
    @IBOutlet weak var headerView: GradientView!
    @IBOutlet weak var subjectHeadingLabel: UILabel!
    @IBOutlet weak var tutorNameHeadingLabel: UILabel!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var qualificationsButton: UIButton!
    @IBOutlet weak var availabilityLabel: UILabel!
    
    //request popup
    
    
    @IBOutlet weak var successView: UIView!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var calculationOfCostLabel: UILabel!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet var requestConfirmationPopupView: UIView!
    @IBOutlet weak var estimatedCostLabel: UILabel!
    @IBOutlet weak var requestConfirmationButton: UIButton!
    
    private var cost: Float = 0
    public var dataSource: Tutor?
    public var subjectHeading: String?
    let timePickerStart = UIDatePicker()
    let timePickerEnd = UIDatePicker()
    
    let screen = UIScreen.main.bounds
    
    @IBAction func changedStartTime(_ sender: Any) {
        calculateCost()
    }
    
    @IBAction func changedEndTime(_ sender: Any) {
        calculateCost()
    }
    
    @IBAction func tappedOverview(_ sender: Any) {
        qualificationsButton.titleLabel?.alpha = 0.5
        overviewButton.titleLabel?.alpha = 1
        ratingButton.titleLabel?.alpha = 0.5
        
        ratingContentView.transform = .identity
        
        UIView.animate(withDuration: 0.5, animations: {
            self.overviewContentView.transform = .identity
            self.ratingContentView.transform = CGAffineTransform(translationX: self.screen.width, y: 0)
        })
    }
    
    @IBAction func tappedBackArrow(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBAction func tappedQualifications(_ sender: Any) {
        qualificationsButton.titleLabel?.alpha = 1
        overviewButton.titleLabel?.alpha = 0.5
        ratingButton.titleLabel?.alpha = 0.5
        
        
        
    }
    
    @IBAction func tappedRating(_ sender: Any) {
        qualificationsButton.titleLabel?.alpha = 0.5
        overviewButton.titleLabel?.alpha = 0.5
        ratingButton.titleLabel?.alpha = 1
        
        UIView.animate(withDuration: 0.5, animations: {
            self.overviewContentView.transform = CGAffineTransform(translationX: -self.screen.width, y: 0)
            self.ratingContentView.transform = .identity
        })
    }
    
    @IBAction func confirmedRequest(_ sender: Any) {
        
            if let tutor = dataSource {
                
                let newRequest = TutorRequestEvent(tutor: tutor, subject: subjectHeading ?? "", startTime: startTimePicker.date, endTime: endTimePicker.date, cost: self.cost)
              
                GlobalVariables.user.pendingRequests.append(newRequest)
                
                //for the sake of demo
                GlobalVariables.user.pendingRequests[0].isConfirmed = true
                
                
        }
        
        sleep(1)
        UIView.animate(withDuration: 0.66, animations: {
            self.successView.alpha = 1
        }) { (success) in
            //
        }
        
        //send a push notification. For demo purposes
        let content = UNMutableNotificationContent()
        content.title = "Request Confirmed"
        if let tutor = dataSource {
            content.body = tutor.name + " has accepted your request."
        }
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
        //
        })
    }
    
    @IBAction func requestedTutor(_ sender: Any) {
        
        if let data = dataSource {
            
            endTimePicker.minimumDate = Date(timeIntervalSinceNow: 1501)
            endTimePicker.maximumDate = Date(timeIntervalSinceNow: data.availability)
            startTimePicker.minimumDate = Date(timeIntervalSinceNow: -299)
            startTimePicker.maximumDate = Date(timeIntervalSinceNow: data.availability - 1800)
    
            DispatchQueue.main.async {
                self.endTimePicker.reloadInputViews()
                self.startTimePicker.reloadInputViews()
                self.view.layoutSubviews()
            }
            
             let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            let estimatedCostText = NSMutableAttributedString(string: "Estimated cost: ", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 23) ?? UIFont.systemFont(ofSize: 23) ])
            estimatedCostText.append(NSAttributedString(string: formatter.string(from: data.feePerHour as NSNumber) ?? "", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 23) ?? UIFont.systemFont(ofSize: 23) ]))
            
            estimatedCostLabel.attributedText = estimatedCostText
            
            let feeText = formatter.string(from: data.feePerHour/2 as NSNumber) ?? ""
            calculationOfCostLabel.text = "(30 minutes x \(feeText)/hr)"
        }
       
        let myBlue = UIColor(red: 51/255, green: 95/255, blue: 175/255, alpha: 1)
        
        startTimePicker.setValue(myBlue, forKeyPath: "textColor")
        endTimePicker.setValue(myBlue, forKeyPath: "textColor")
        endTimePicker.setDate(Date(timeIntervalSinceNow: 1800), animated: false)
     

        //make the popup appear
        requestConfirmationPopupView.center = self.view.center
        requestConfirmationPopupView.transform = CGAffineTransform(scaleX: 0, y: 0)
        view.addSubview(requestConfirmationPopupView)
        UIView.animate(withDuration: 1, animations: {
            self.requestConfirmationPopupView.transform = .identity
            self.blurView.alpha = 0.5
        })
        
        calculateCost()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var tableViewHeightConstant: CGFloat = 0;
        for i in 0...reviewTableView.numberOfRows(inSection: 0)-1 {
            tableViewHeightConstant = tableViewHeightConstant + (reviewTableView.cellForRow(at: IndexPath(row: i, section: 0))?.frame.height ?? 0)
        }
        self.view.layoutIfNeeded()
        reviewTableViewHeightConstraint.constant = tableViewHeightConstant
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviewTableView.rowHeight = UITableView.automaticDimension
        self.reviewTableView.estimatedRowHeight = 100.0
        
        let exitGesture = UITapGestureRecognizer(target: self, action: #selector(exitPopup))
        
        blurView.addGestureRecognizer(exitGesture)
        
        blurView.alpha = 0
        successView.alpha = 0
        requestConfirmationPopupView.layer.cornerRadius = 18
        requestConfirmationButton.layer.cornerRadius = requestConfirmationButton.frame.height/2
        subjectHeadingLabel.text = subjectHeading
        ratingContentView.transform = CGAffineTransform(translationX: screen.width, y: 0)
        
        ratingButton.titleLabel?.alpha = 0.5
        qualificationsButton.titleLabel?.alpha = 0.5
        
        tutorProfileImageView.layer.cornerRadius = tutorProfileImageView.frame.height/2
        tutorProfileImageView.image = dataSource?.profilePicture
        biographyLabel.text = dataSource?.biography ?? "No biography available."
        
    
        
    
        tutorNameLabel.text? = dataSource!.name
        tutorTitleLabel.text? = dataSource!.title
        tutorNameHeadingLabel.text? = dataSource!.name
        generateBiographies()
        generateAvailability()
        generateRatings()
        
        DispatchQueue.main.async {
            self.view.layoutIfNeeded()
            self.overviewContentViewHeightConstraint.constant = self.generatedBiographyLabel.frame.maxY + 24
            
            self.ratingContentViewHeightConstraint.constant = self.viewMoreButton.frame.maxY + 24 - self.tabView.frame.maxY
            self.view.layoutIfNeeded()
        }
        
        tutorFeeLabel.text? = "$" + String(dataSource!.feePerHour) + " /hr"
    }
    
    @objc private func exitPopup() {
        
        UIView.animate(withDuration: 0.5, animations: {
           
            self.blurView.alpha = 0
            self.requestConfirmationPopupView.transform = CGAffineTransform(scaleX: 0, y: 0)
        })
        
        requestConfirmationPopupView.removeFromSuperview()
    }
    
    private func generateRatings() {
        if let tutor = self.dataSource {
            let ratingText = NSMutableAttributedString(attributedString: NSAttributedString(string: String(tutor.averageRating), attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Bold", size: 40) ?? UIFont.systemFont(ofSize: 40)]))
            ratingText.append(NSAttributedString(string: " stars", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 40) ?? UIFont.systemFont(ofSize: 40)]))
            ratingText.addAttribute(.foregroundColor, value: UIColor(red: 23/255, green: 80/255, blue: 183/255, alpha: 1), range: rangeForEntireLength(str: ratingText))
            overallRatingLabel.attributedText = ratingText
            
            let fiveStarsRatingText = NSMutableAttributedString(attributedString: NSAttributedString(string: "Including ", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Light", size: 18) ?? UIFont.systemFont(ofSize: 18)]))
            
            fiveStarsRatingText.append(NSAttributedString(string: String(tutor.fiveStarRatings), attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)]))
            
            fiveStarsRatingText.append(NSAttributedString(string: " 5-star reviews", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Light", size: 18) ?? UIFont.systemFont(ofSize: 18)]))
            
            fiveStarRatingCounterLabel.attributedText = fiveStarsRatingText
            
            let monthlyRatingText = NSMutableAttributedString(string: String(tutor.recentRating), attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)])
            monthlyRatingText.append(NSAttributedString(string: " stars", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)]))
            monthlyRatingLabel.attributedText = monthlyRatingText
            
            monthlyStarRatingView.rating = tutor.recentRating
        }
    }
    
    private func generateAvailability() {
        let myFirstAttribute = [ NSAttributedString.Key.font: UIFont(name: "Roboto-Light", size: 22) ?? UIFont.systemFont(ofSize: 22) ]
        let mySecondAttribute = [ NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 22) ?? UIFont.systemFont(ofSize: 22) ]
        let availabilityTextStart = NSAttributedString(string: "Available for: ", attributes: myFirstAttribute)
        let availabilityText = NSMutableAttributedString(attributedString: availabilityTextStart)
        let availability = NSAttributedString(string: dataSource!.availability.toString(), attributes: mySecondAttribute)
        availabilityText.append(availability)
        availabilityLabel.attributedText? = availabilityText
    }
    
    private func generateBiographies() {
        
        let fontSize: CGFloat = 17
        let baseFont = "Roboto-Light"
        let standOutFont = "Roboto-Regular"
        
        var subjectsToStringAttributed: NSMutableAttributedString = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
        if let subjects = dataSource?.subjects {
            if subjects.count == 0 {
                subjectsToStringAttributed = NSMutableAttributedString(string: "pretty much anything", attributes: [NSAttributedString.Key.font: UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
            }
            else if subjects.count == 1 {
                subjectsToStringAttributed = NSMutableAttributedString(string: subjects[0], attributes: [NSAttributedString.Key.font: UIFont(name: standOutFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
            } else {
                for i in 0...subjects.count-2 {
                    subjectsToStringAttributed.append(NSMutableAttributedString(string: subjects[i], attributes: [NSAttributedString.Key.font: UIFont(name: standOutFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
                    subjectsToStringAttributed.append(NSMutableAttributedString(string: ", ", attributes: [NSAttributedString.Key.font: UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
                }
                subjectsToStringAttributed.append(NSMutableAttributedString(string: "and ", attributes: [NSAttributedString.Key.font: UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
                subjectsToStringAttributed.append(NSMutableAttributedString(string: subjects[subjects.count-1], attributes: [NSAttributedString.Key.font: UIFont(name: standOutFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
            }
            
        }
        
        var daysSinceJoinedToString = ""
        var shouldAddS = false
        if let timeSinceJoined = dataSource?.timeSinceStart {
            let daysSinceJoined = floor(timeSinceJoined/(60*60*24))
            switch daysSinceJoined {
            case 365...Double.greatestFiniteMagnitude :
                daysSinceJoinedToString = String(format: "%.0f", daysSinceJoined/365) + " year"
                shouldAddS = daysSinceJoined/365 >= 2
                break
            case 30.5...365 :
                daysSinceJoinedToString = String(format: "%.0f", daysSinceJoined/30.5) + " month"
                shouldAddS = daysSinceJoined/31 >= 2
                break
            case 7...30.5 :
                daysSinceJoinedToString = String(format: "%.0f", daysSinceJoined/7) + " week"
                shouldAddS = daysSinceJoined/7 >= 2
                break
            default :
                daysSinceJoinedToString =
                    String(format: "%.0f", daysSinceJoined) + " day"
                shouldAddS = daysSinceJoined >= 2 || daysSinceJoined < 1
                break
            }
            
        }
        
        if shouldAddS {
            daysSinceJoinedToString = daysSinceJoinedToString + "s"
        }
        
        var studentsTaught = ""
        if let _studentsTaught = dataSource?.studentsTaught {
            studentsTaught = String(_studentsTaught)
        }
        
        let studentsTaughtAttributed = NSMutableAttributedString(string: studentsTaught, attributes: [NSAttributedString.Key.font: UIFont(name: standOutFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
       
        let daysSinceJoinedToStringAttributed = NSMutableAttributedString(string: daysSinceJoinedToString, attributes: [NSAttributedString.Key.font : UIFont(name: standOutFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
                        
        
                        
        let generatedBiographyAttributedString = NSMutableAttributedString(string: "My favorite subjects to teach include ", attributes: [NSAttributedString.Key.font : UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)])
        
        generatedBiographyAttributedString.append(subjectsToStringAttributed)
        generatedBiographyAttributedString.append(NSMutableAttributedString(string: ", and I've already taught ", attributes: [NSAttributedString.Key.font : UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
        generatedBiographyAttributedString.append(studentsTaughtAttributed)
        generatedBiographyAttributedString.append(NSMutableAttributedString(string: " students just like you in my ", attributes: [NSAttributedString.Key.font : UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
        generatedBiographyAttributedString.append(daysSinceJoinedToStringAttributed)
        generatedBiographyAttributedString.append(NSMutableAttributedString(string: " of using this app.", attributes: [NSAttributedString.Key.font: UIFont(name: baseFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)]))
        
        generatedBiographyLabel.attributedText = generatedBiographyAttributedString
    }
    
    private func calculateCost() {
        let timeDifference = endTimePicker.date.timeIntervalSince(startTimePicker.date)
        
        if timeDifference > 0 {
           let hoursBook: Double = Double(timeDifference)/3600
            let numFormatter = NumberFormatter()
            let timeText = String(format: "%.2f", hoursBook)
            
            if let data = dataSource {
                let estimatedCost: Float = Float(hoursBook)*data.feePerHour
                cost = estimatedCost
                
                numFormatter.numberStyle = .currency
                let costText = numFormatter.string(from: estimatedCost as NSNumber) ?? ""
                
                let estimatedCostText = NSMutableAttributedString(string: "Estimated cost: ", attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 23) ?? UIFont.systemFont(ofSize: 23) ])
                estimatedCostText.append(NSAttributedString(string: costText, attributes: [NSAttributedString.Key.font: UIFont(name: "Roboto-Medium", size: 23) ?? UIFont.systemFont(ofSize: 23) ]))
                
                estimatedCostLabel.attributedText = estimatedCostText
                let feeText = numFormatter.string(from: data.feePerHour as NSNumber) ?? ""
                calculationOfCostLabel.text = "(" + timeText + " hours x " + feeText + "/hr)"
            }
            
        }
    }
}

extension ReviewTutorProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.tutoringHistory.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        
        if let myTutor = dataSource {
            cell.reviewDescriptionLabel.text = myTutor.tutoringHistory[indexPath.row].review
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM dd, yyyy"
            formatter.dateStyle = .long
            cell.dateLabel.text = formatter.string(from: myTutor.tutoringHistory[indexPath.row].date)
            DispatchQueue.main.async {
                cell.bubbleViewHeightConstraint.constant = cell.reviewDescriptionLabel.frame.maxY + 16
                
            }
            
        }
    
        
        
        if indexPath.row % 2 == 1 {
            
            cell.imageViewTrailingConstraint.priority = UILayoutPriority(rawValue: 900)
            cell.tailImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
            
        }
        
        return cell
    }
    
    
    
}
extension TimeInterval {
    func toString() -> String {
        
        let ti = NSInteger(self)
        
        if ti >= 3600 {
            return String(ti/3600) + " hours"
        } else {
            return String((ti/60) % 60) + " minutes"
        }
    }
}

func rangeForEntireLength(str: NSAttributedString)-> NSRange {
    return NSRange(location: 0, length: str.length)
}
