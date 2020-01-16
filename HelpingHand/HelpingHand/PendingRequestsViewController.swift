//
//  PendingRequestsViewController.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-04-15.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class PendingRequestsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var cancelConfirmationPopupView: UIView!
    @IBOutlet weak var dimView: UIView!
    
    @IBOutlet weak var noRequestsLabel: UILabel!
    
    var sendingData: Any?
    var cancelledRequest: TutorRequestEvent?

    @IBAction func confirmedCancelation(_ sender: Any) {
        
        if let targetRequest = cancelledRequest {
                if let indexOfRequest = GlobalVariables.user.pendingRequests.firstIndex(where: { (request: TutorRequestEvent) in
                    request == targetRequest
                }) {
                    GlobalVariables.user.pendingRequests.remove(at: indexOfRequest)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    dimView.alpha = 0
                    cancelConfirmationPopupView.removeFromSuperview()
                }
            
            if GlobalVariables.user.pendingRequests.count == 0 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.noRequestsLabel.alpha = 0.8
                })
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dimView.alpha = 0
        tableView.allowsSelection = false
        noRequestsLabel.alpha = 0.8
    }
    
    override func viewWillAppear(_ animate: Bool) {
        super.viewWillAppear(animate)
        
        if GlobalVariables.user.pendingRequests.count > 0 {
            noRequestsLabel.alpha = 0
        }
    }
    
    func callSegueFromCellToReviewTutorProfile(myData tutorRequest: TutorRequestEvent) {
        sendingData = tutorRequest
        self.performSegue(withIdentifier: "reviewTutorProfileSegue", sender: self )
        
    }
    
    func callSegueFromCellToMessageTutor(myData name: String) {
        
        sendingData = name
        performSegue(withIdentifier: "segueToMessages", sender: self)
    }
    
    func cancelTutor(myData tutorRequest: TutorRequestEvent) {
        
        cancelledRequest = tutorRequest
        cancelConfirmationPopupView.transform = CGAffineTransform(scaleX: 0, y: 0)
        cancelConfirmationPopupView.center = self.view.center
        view.addSubview(cancelConfirmationPopupView)
        UIView.animate(withDuration: 1, animations: {
            self.dimView.alpha = 0.5
            self.cancelConfirmationPopupView.transform = .identity
        })
    }
    
    func checkCellsMode() {
        for i in 0...tableView.numberOfRows(inSection: 0)-1 {
            if let cell = tableView(tableView, cellForRowAt: IndexPath(row: i, section: 0)) as? pendingRequestCell {
                if cell.isInSecondMode {
                    cell.didSwipeLeft()
                    break
                }
            }
        }
    }

    @IBAction func tappedBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reviewTutorProfileSegue" {
            if let destinationVC = segue.destination as? ReviewTutorProfileViewController {
                if let data = sendingData as? TutorRequestEvent {
                    destinationVC.dataSource = data.tutor
                    destinationVC.subjectHeading = data.subject
                }
            }
        } else if segue.identifier == "segueToMessages" {
            if let destinationVC = segue.destination as? MessagesViewController {
                if let name = sendingData as? String {
                    destinationVC.tutorName = name
                }
            }
        }
    }
}

extension PendingRequestsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariables.user.pendingRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pendingRequestCell") as? pendingRequestCell {
            
            let data = GlobalVariables.user.pendingRequests
            cell.dataSource = data[data.count - 1 - indexPath.row]
            cell.delegate = self

            return cell
        
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

}

extension PendingRequestsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if GlobalVariables.user.pendingRequests[row].hasNotification {
            if let myCell = cell as? pendingRequestCell {
                guard let arrowWithNotification = UIImage(named: "forwardCCellArrowWithNotification") else {return}
                guard let messageWithNotification = UIImage(named: "messageIconWithNotification") else {return}
                
                myCell.tapArrowButton.setImage(arrowWithNotification, for: .normal)
                myCell.messageImageView.image = messageWithNotification
            }
             GlobalVariables.user.pendingRequests[row].hasNotification = false
        }
    }
    
   
}
