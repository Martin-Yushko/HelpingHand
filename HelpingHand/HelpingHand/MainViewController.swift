//
//  MainViewController.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-02-26.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit
import GoogleMaps
import UserNotifications

class MainViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var searchBarView: GradientView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var menuView: GradientView!
    
    @IBOutlet weak var dimView: UIView!
    
    @IBOutlet weak var dimViewButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var menuViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var pendingRequestsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBAction func openMenu(_ sender: Any) {
        openMenu()
        dimViewButton.isUserInteractionEnabled = true
    }
    
    @IBAction func clickedOutsideMenu(_ sender: Any) {
        closeMenu()
        dimViewButton.isUserInteractionEnabled = false
    }
    
    func matchesCategory(_ string: String, for posting: TutorPosting) -> Bool {
        /*
         
         static let english = ["ELL","english","language","communication"]
         static let french = ["French", "FRAL", "Francais", "foreign", "language"]
         static let math = ["Math","Geometry","Calculus","Algebra","Arithmatic", "Triganometry"]
         static let socialStudies = ["Geography","history","geology"]
         static let science = ["Biology","Anatomy","Chemistry","Physics","Programming","Engineering"]
         
         */
        
        //english
        
        let str = string.lowercased()
        
        var isEnglish = false
        
        for i in 0...subjectCategories.english.count-1 {
            if str.contains(subjectCategories.english[i].lowercased()) || subjectCategories.english[i].lowercased().contains(str) {
                isEnglish = true
            }
        }
        
        if isEnglish {
                for j in 0...subjectCategories.english.count-1 {
                    if posting.subject.lowercased().contains(subjectCategories.english[j]) || subjectCategories.english[j].lowercased().contains(posting.subject.lowercased()) {
                        return true
                    }
            }
        }
        
        
        
        return false
    }
    
    
    @IBAction func filterTutorPostings(_ sender: Any) {
        if searchTextField.text != "" {
            let search: String = searchTextField.text!.lowercased()
            
            //check if search is consistent with a subject
            for i in 0...tutorPostings.count-1 {
                if !tutorPostings[i].subject.lowercased().contains(search) && !search.contains(tutorPostings[i].subject.lowercased()){
                    //check if search is consistent with a tutor name
                    if !tutorPostings[i].tutor.name.lowercased().contains(search) && !search.contains(tutorPostings[i].tutor.name.lowercased()){
                            tutorPostings[i].display = matchesCategory(search, for: tutorPostings[i])
                    } else {
                        tutorPostings[i].display = true
                    }
                } else {
                    tutorPostings[i].display = true
                    //tutorPostings[i].display = tutorPostings[i].tutor.averageRating >= GlobalVariables.user.tutorRatingRequirement
                }
            }
            
            if search == "all" {
                for i in 0...tutorPostings.count-1 {
                    tutorPostings[i].display = true

                }
            }
            
            self.updateMap()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    var menuIsOpen: Bool = false
    var tutorPostings: [TutorPosting] = []
    var hasNotification = false
    private let locationManager = CLLocationManager()
    private var selectedMarker: MapMarkerWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //request user for permission to send notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, error) in
            //
        }
        
        
        searchTextField.delegate = self
        //Initialize the map
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        //disable interaction for dimview button since menu is initially hidden
        dimViewButton.isUserInteractionEnabled = false
        
        // Add a left swipe listener - for closing menu view
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        //Add a right swipe listener - for opening menu view
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        
        //move the menu view out of view until the menu icon is clicked
        self.menuViewLeadingConstraint.constant = -menuViewWidthConstraint.constant
        
        
        //Change placeholder text color
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)])
        
        //Offset left alignment of text
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 20))
        paddingView.backgroundColor = UIColor.clear
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
       
        //Put the search icon image to the right of text field
        searchTextField.rightViewMode = .always
        let textFieldImageView = UIImageView(image: UIImage(named: "searchIcon"))
        let padding = 14
        textFieldImageView.frame = CGRect(x: 0, y: 0, width: 28 + padding, height: 28)
        textFieldImageView.contentMode = .center
        searchTextField.rightView = textFieldImageView
        
        tutorPostings = GlobalVariables.tutorPostings
        mapView.settings.myLocationButton = false
        updateMapFirstTime()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkForNotifications()
        
        if hasNotification {
            self.menuButton.setImage(UIImage(named: "menuIconWithNotification"), for: .normal)
            //to account for the larger image frame when notification dot is in it
            self.menuButton.transform = CGAffineTransform(translationX: 3, y: 0)
            self.pendingRequestsButton.setImage(UIImage(named: "pendingRequestsIconWithNotification"), for: .normal)
            //same thing
            self.pendingRequestsButton.transform = CGAffineTransform(translationX: -3, y:0)
        } else {
            self.menuButton.setImage(UIImage(named: "menuIcon"), for: .normal)
            self.menuButton.transform = .identity
            self.pendingRequestsButton.setImage(UIImage(named: "pendingRequestsIcon"), for: .normal)
            self.pendingRequestsButton.transform = .identity
        }
    }
    func openMenu() {
        menuViewLeadingConstraint.constant = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dimView.alpha = 1
            self.view.layoutIfNeeded()
        })
        
        menuIsOpen = true
    }
    
    func closeMenu() {
        menuViewLeadingConstraint.constant = -menuViewWidthConstraint.constant
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dimView.alpha = 0
            self.view.layoutIfNeeded()
        })
        
        menuIsOpen = false
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) /*add -> void if problem*/{
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            if !menuIsOpen {
                openMenu()
            }
        } else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            if menuIsOpen {
                closeMenu()
            }
        }
    }
    
    func updateMapFirstTime() {
        
        //Conduct initial filter based on user's filter settings
        for i in 0...tutorPostings.count-1 {
            //Eliminate by rating and budget
            if tutorPostings[i].tutor.averageRating >= GlobalVariables.user.tutorRatingRequirement && tutorPostings[i].tutor.feePerHour <= GlobalVariables.user.budgetRangeUpper && tutorPostings[i].tutor.feePerHour >= GlobalVariables.user.budgetRangeLower {
                tutorPostings[i].display = false
                for j in 0...GlobalVariables.user.subjects.count-1 {
                    //Eliminate if doesn't match any of user's subjects
                    if tutorPostings[i].subject.lowercased() == GlobalVariables.user.subjects[j].lowercased() {
                        tutorPostings[i].display = true
                    }
                }
            } else {
                tutorPostings[i].display = false
            }
        }
        
        
        updateMap()
    }
    
    func checkForNotifications() {
        
        //pendingRequests
        if GlobalVariables.user.pendingRequests.count == 0 {
            hasNotification = false
            return }
        for i in 0...GlobalVariables.user.pendingRequests.count-1 {
            if GlobalVariables.user.pendingRequests[i].hasNotification {
                self.hasNotification = true
                //once found at least one pending notification, we can now break from checking for notifications
                return
            }
        }
        
        //if the loop completed without having being returned from, it means that there are no notifications outstanding
        hasNotification = false
    }
    
    func updateMap() {
        
        //remove all pins from map
        mapView.clear()
        
        //creates the pins for each tutor posting in database that has display set on true
        for i in 0...tutorPostings.count-1 {
            if tutorPostings[i].display {
                let multiplier = 1
                let markerHeight = 90 * multiplier
                let markerWidth = 210 * multiplier
                
                //set location of marker
                let tutorMarker = GMSMarker(position: tutorPostings[i].tutor.location.coordinate)
                
                
                let markerWindow = MapMarkerWindow(frame: CGRect(x: 0, y: 0, width: markerWidth, height: markerHeight))
                
                markerWindow.starRatingView.rating = tutorPostings[i].tutor.averageRating
                markerWindow.subjectLabel?.text = tutorPostings[i].subject
                markerWindow.tutorLabel?.text = tutorPostings[i].tutor.name
                //markerWindow.starRatingView?.rating = 5
                markerWindow.dataSource = tutorPostings[i].tutor
                tutorMarker.iconView = markerWindow
                //place in map
                //tutorMarker.opacity = 0
                
                tutorMarker.map = mapView
                
                //DispatchQueue.main.async {
                 //   UIView.animate(withDuration: 1, animations: {
                  //      tutorMarker.opacity = 1
                  //  })
               // }
                
            }
            // TO OPTIMIZE, MAKE MARKERWINDOW RESPONSIBLE FOR ALL ACTIONS WITH DATASOURCE
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reviewTutorProfileSegue" {
            if let destinationVC = segue.destination as? ReviewTutorProfileViewController {
                if let dataSource = selectedMarker?.dataSource {
                    destinationVC.subjectHeading = selectedMarker?.subjectLabel?.text
                    destinationVC.dataSource = dataSource
                }
            }
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.rightView? = UIView()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFieldImageView = UIImageView(image: UIImage(named: "searchIcon"))
        let padding = 14
        textFieldImageView.frame = CGRect(x: 0, y: 0, width: 28 + padding, height: 28)
        textFieldImageView.contentMode = .center
        searchTextField.rightView = textFieldImageView
    }
    
}

extension  MainViewController: CLLocationManagerDelegate {
    
    //Called when user grants or revokes location access permission
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Verify whether permission has been granted
        guard status == .authorizedWhenInUse else {
            return
        }
        
        //Upate location of user in real-time
        locationManager.startUpdatingLocation()
        
        //Show user's current location on the map
        mapView?.isMyLocationEnabled = true
        
        //Add button that returns user to current location
        mapView?.settings.myLocationButton = true
    
    }
    
    //Executed if recieves new location data
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
        }
        
        //Camera gets centered on user's location
        mapView?.camera = GMSCameraPosition(target: location.coordinate, zoom: 15)
        //Stop updating location past the initial location
        locationManager.stopUpdatingLocation()
    }

}

extension MainViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let markerInfo = marker.iconView as? MapMarkerWindow {
            self.selectedMarker = markerInfo
        }
        performSegue(withIdentifier: "reviewTutorProfileSegue", sender: self)
        return true
    }
}
