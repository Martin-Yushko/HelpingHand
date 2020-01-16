//
//  Database.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-03-09.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import Foundation
import GoogleMaps

struct Tutor {
    //basics
    var name: String = ""
    var location: CLLocation
    var subjects: [String] = []
    var title: String = ""
    var profilePicture: UIImage
    var biography: String = ""
    var education: [Education] = []
    var experience: [String] = []
    var feePerHour: Float
    var availability: TimeInterval = 0
    
    //history
    var tutoringHistory: [TutoringEvent] = []
    var studentsTaught: Int {
        return tutoringHistory.count
    }
    
    //statistics
    var startDate: Date = Date()
    var timeSinceStart: TimeInterval {
            //get current time/date
            let currentDate = Date(timeIntervalSinceNow: 0)
            
        return currentDate.timeIntervalSince(startDate)
    }
    
    //rating
    var fiveStarRatings: Int = 0
    var averageRating: Float = 0
    var recentRating: Float = 0
    
    
    //initialiser(s)
    init(tutorName: String, title: String, tutorLocation: CLLocation, tutorPicture: UIImage, favoriteSubjects: [String], fee: Float, biography: String, availability: TimeInterval, startTime: Date, history: [TutoringEvent], averageRating: Float, monthlyRating: Float, perfectRatings: Int) {
        name = tutorName
        self.title = title
        profilePicture = tutorPicture
        location = tutorLocation
        subjects = favoriteSubjects
        feePerHour = fee
        self.biography = biography
        self.availability = availability
        startDate = startTime
        tutoringHistory = history
        self.averageRating = averageRating
        recentRating = monthlyRating
        fiveStarRatings = perfectRatings
    }
    
}

struct TutoringEvent {
    var date: Date
    var review: String?
    
    //initialiser(s)
    init(date: Date, review: String){
        self.date = date
        self.review = review
    }

    init(date: Date){
        self.date = date
    }
}

struct Education {
    var institutionName: String?
    var startYear: Int?
    var endYear: Int?
    var description: String?
    
    //initialiser(s)
    init(in institution: String, from firstYear: Int, to secondYear: Int, description: String) {
        institutionName = institution
        startYear = firstYear
        endYear = secondYear
        self.description = description
    }
}


struct User {
    var name: String
    var title: String
    var history: [TutoringEvent] = []
    var pendingRequests: [TutorRequestEvent] = []
    var budgetRangeLower: Float
    var budgetRangeUpper: Float
    var tutorRatingRequirement: Float
    var subjects: [String] = []
    var biography: String = ""
    var paymentHistory: [PaymentEvent] = []
    
    init(name: String, title: String, biography: String, upperLimit: Float, lowerLimit: Float, minimumTutorRating: Float, subjects: [String]) {
        self.name = name
        self.title = title
        self.biography = biography
        self.budgetRangeLower = lowerLimit
        self.budgetRangeUpper = upperLimit
        self.tutorRatingRequirement = minimumTutorRating
        self.subjects = subjects
    }
}

struct TutorRequestEvent {
    var tutor: Tutor
    var subject: String
    var startTime: Date
    var endTime: Date
    var isConfirmed: Bool = false {
        didSet {
            self.hasNotification = true
        }
    }
    var totalCost: Float
    var hasNotification = false
    
    init(tutor: Tutor, subject: String, startTime: Date, endTime: Date, cost: Float) {
        self.tutor = tutor
        self.subject = subject
        self.startTime = startTime
        self.endTime = endTime
        self.totalCost = cost
        self.isConfirmed = true
    }
}
struct PaymentEvent {
    
}

struct TutorPosting {
    var tutor: Tutor
    var subject: String
    var display = true
    
    init(tutor: Tutor, subject: String) {
        self.tutor = tutor
        self.subject = subject
    }
}


//custom logic operators for the above structs

func ==(left: TutorRequestEvent, right: TutorRequestEvent) -> Bool {
    //make ID for this
    return left.tutor == right.tutor && left.subject == right.subject && left.startTime == right.startTime && left.endTime == right.endTime
}

func ==(left: Tutor, right: Tutor) -> Bool {
    //make ID for this
    return left.name == right.name && left.averageRating == right.averageRating && left.biography == right.biography && left.timeSinceStart == right.timeSinceStart && left.location == right.location
}
