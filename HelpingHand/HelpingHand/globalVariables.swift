//
//  globalVariables.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-04-18.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import Foundation
import GoogleMaps

struct subjectCategories {
    static let english = ["ELL","english","language","communication"]
    static let french = ["French", "FRAL", "Francais", "foreign", "language"]
    static let math = ["Math","Geometry","Calculus","Algebra","Arithmatic", "Triganometry"]
    static let socialStudies = ["Geography","history","geology"]
    static let science = ["Biology","Anatomy","Chemistry","Physics","Programming","Engineering"]
}

struct GlobalVariables {
    
    static var user = User(name: "Janice Whaler", title: "Student", biography: "Hello! I am currently in my first year at the University of B.C., where I'm studying sciences, and I need some help brushing up on the basics - especially Calculus. I also like to learn new languages, and have recently taken an interest in french. I Would truly love any help! And I can’t wait to meet you.", upperLimit: 40, lowerLimit: 9.98, minimumTutorRating: Float(0.0), subjects: ["Calculus", "French", "Biology", "Physics"])
    
    static var tutorPostings = [
        
        
        
        //social studies
        
        TutorPosting(tutor: Tutor(tutorName: "Roxy Haines", title: "First-nations history teacher", tutorLocation: CLLocation(latitude: 49.169153, longitude: -123.123795), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["History", "First Nations People", "Geography"], fee: 17.95, biography: "I believe everyone should be informed about the first nations people and their history. Why don't I invite you to start that adventure with me as your tutor?", availability: TimeInterval(exactly: 17200)!, startTime: Date(timeIntervalSinceNow: -12342789),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    
            ], averageRating: 4.02, monthlyRating: 4.07, perfectRatings: 32 ), subject: "First-nations History"),
        
        TutorPosting(tutor: Tutor(tutorName: "Tabatha Gould", title: "Social studies teacher", tutorLocation: CLLocation(latitude: 49.179153, longitude: -123.124795), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["History", "Geology", "Introduction to Law"], fee: 16.50, biography: "I am a part-time teacher at a local school, and I'll love to help as many students or curious adults as I possibly can! Just send me a request, and we're off!", availability: TimeInterval(exactly: 19200)!, startTime: Date(timeIntervalSinceNow: -1000000),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    
            ], averageRating: 3.92, monthlyRating: 3.97, perfectRatings: 22 ), subject: "Geography"),
        
        
        
        
        
        
        
        
        //Math
        
        
        
        
        TutorPosting(tutor: Tutor(tutorName: "Jeff Wu", title: "Retired Teacher", tutorLocation: CLLocation(latitude: 49.159153, longitude: -123.133795), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["Math", "Physics", "Computer Science"], fee: 99.99, biography: "I am a grade 10 math and science teacher in a local highschool. I love teaching, and I would love to help you reach whatever goals you’ve set for yourself. Don’t hesitate to contact me!", availability: TimeInterval(exactly: 7200)!, startTime: Date(timeIntervalSinceNow: -123456789),
                                  history: [
            
            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
            
            
            ], averageRating: 5.0, monthlyRating: 4.97, perfectRatings: 5 ), subject: "Math"),
                                
        
        
        
        
        
        TutorPosting(tutor: Tutor(tutorName: "Gregg Chen", title: "Pre-calculus teacher", tutorLocation: CLLocation(latitude: 49.156153, longitude: -123.123795), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["Math", "Physics", "Calculus"], fee: 15.00, biography: "I've been teaching math for more than 30 years. I know the tricks of the trade, and if you request me, you can too! If you're struggling with calculus, math, or physics, I'm the person for you.", availability: TimeInterval(exactly: 5200)!, startTime: Date(timeIntervalSinceNow: -2342789),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    
            ], averageRating: 4.52, monthlyRating: 4.56, perfectRatings: 12 ), subject: "AP Calculus"),
        
        
        
        TutorPosting(tutor: Tutor(tutorName: "Shengton Lam", title: "High school math teacher", tutorLocation: CLLocation(latitude: 49.166153, longitude: -123.126995), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["Math", "Geometry", "IT"], fee: 13.99, biography: "What isn't there to love about math? And more importantly, shapes! Shapes make up our whole world - and understanding them is the first step in understanding any of the fundumental questions of the universe. Do you dare to ask?", availability: TimeInterval(exactly: 22200)!, startTime: Date(timeIntervalSinceNow: -5242789),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    
            ], averageRating: 1.02, monthlyRating: 1.07, perfectRatings: 0 ), subject: "Geometry"),
        
        
        TutorPosting(tutor: Tutor(tutorName: "David Stone", title: "Math teacher", tutorLocation: CLLocation(latitude: 49.170153, longitude: -123.100000), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["Math", "Physics", "Computer Science"], fee: 1999.99, biography: "Why is my cost so high, you ask? Well, I'm that good", availability: TimeInterval(exactly: 7100)!, startTime: Date(timeIntervalSinceNow: -123489),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    
            ], averageRating: 4.02, monthlyRating: 4.07, perfectRatings: 1 ), subject: "Math Foundations"),
        
        
        TutorPosting(tutor: Tutor(tutorName: "Luke Wilborn", title: "Math Professor", tutorLocation: CLLocation(latitude: 49.159154, longitude: -123.133796), tutorPicture: UIImage(named: "samProfilePicture")!, favoriteSubjects: ["Math", "Physics", "Computer Science"], fee: 11.99, biography: "I want to spread the wonderful world of math!", availability: TimeInterval(exactly: 17200)!, startTime: Date(timeIntervalSinceNow: -2000000),
                                  history: [
                                    
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                    TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
            ], averageRating: 1.90, monthlyRating: 1.77, perfectRatings: 1 ), subject: "Trigonometry"),
        
        
        
        
        
        //science
        
                                TutorPosting(tutor: Tutor(tutorName: "Jillian Ross", title: "Chemistry, Biology Teacher", tutorLocation: CLLocation(latitude: 49.161079, longitude: -123.141184), tutorPicture: UIImage(named: "jillianProfilePicture")!, favoriteSubjects: ["Biology", "Chemistry"], fee: 19.99, biography: "I am a grade 10 math and science teacher in a local highschool. I love teaching, and I would love to help you reach whatever goals you’ve set for yourself. Don’t hesitate to contact me!", availability: TimeInterval(exactly: 750000)!, startTime: Date(timeIntervalSinceNow: -100550000),
                                                          history: [
                                    
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    ], averageRating: 4.50, monthlyRating: 4.80, perfectRatings: 4 ), subject: "Biology"),
                                
                                
                                TutorPosting(tutor: Tutor(tutorName: "Bob Adjeed", title: "Physics Tutor", tutorLocation: CLLocation(latitude: 49.164147, longitude: -123.142564), tutorPicture: UIImage(named: "samProfilePicture")!, favoriteSubjects: ["Physics"], fee: 15.00, biography: "I can help you out! Just hit that request button and I'm all yours", availability: TimeInterval(exactly: 3600)!, startTime: Date(timeIntervalSinceNow: -10000000),
                                                          history: [
                                    
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    ], averageRating: 3.90, monthlyRating: 3.95, perfectRatings: 3 ), subject: "Physics"),
                                
                                
                                TutorPosting(tutor: Tutor(tutorName: "Jeff Wu", title: "Retired Teacher", tutorLocation: CLLocation(latitude: 49.159153, longitude: -123.133795), tutorPicture: UIImage(named: "jeffProfilePicture")!, favoriteSubjects: ["Math", "Physics", "Computer Science"], fee: 99.99, biography: "I am a grade 10 math and science teacher in a local highschool. I love teaching, and I would love to help you reach whatever goals you’ve set for yourself. Don’t hesitate to contact me!", availability: TimeInterval(exactly: 7200)!, startTime: Date(timeIntervalSinceNow: -123456789),
                                                          history: [
                                    
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "You were really helpful! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "Wow you are an amazing tutor!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                    
                                    ], averageRating: 4.99, monthlyRating: 4.98, perfectRatings: 8 ), subject: "Computer Science"),
                                
                                
                                
                                
                                
//languages
                                
                                
                                TutorPosting(tutor: Tutor(tutorName: "Juliet Wong", title: "English Proffesor", tutorLocation: CLLocation(latitude: 49.159154, longitude: -123.133796), tutorPicture: UIImage(named: "julietProfilePicture")!, favoriteSubjects: ["English", "ELL"], fee: 21.00, biography: "I teach highschool students of all backgrounds the wonderful world of english! Don't hesitate to request me; I'll be thrilled to help you out", availability: TimeInterval(exactly: 17290)!, startTime: Date(timeIntervalSinceNow: -123456799),
                                                          history: [
                                                            
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "I like how you explain the ideas behind the concept instead of expecting me to simply memorize everything. It definently helped me remember things better!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "My only complaint is that sometimes, you get overly excited and forget to make sure that I’m following everything you’re saying. But other than that, your tutelage was great!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                                            
                                                            
                                    ], averageRating: 4.71, monthlyRating: 4.60, perfectRatings: 5 ), subject: "English"),
                                
                                
                                TutorPosting(tutor: Tutor(tutorName: "Vickey Chen", title: "ELL student teacher", tutorLocation: CLLocation(latitude: 49.149154, longitude: -123.132296), tutorPicture: UIImage(named: "rachelProfilePicture")!, favoriteSubjects: ["English", "ELL"], fee: 21.00, biography: "I teach highschool students of all backgrounds the wonderful world of english! Don't hesitate to request me; I'll be thrilled to help you out", availability: TimeInterval(exactly: 27290)!, startTime: Date(timeIntervalSinceNow: -12345799),
                                                          history: [
                                                            
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -72000), review: "I like how you explain the ideas behind the concept instead of expecting me to simply memorize everything. It definently helped me remember things better!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -172000), review: "My only complaint is that sometimes, you get overly excited and forget to make sure that I’m following everything you’re saying. But other than that, your tutelage was great!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -272000), review: "I like how you took the time to explain everything in terms that I would undestand"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -372000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -472000), review: "Oh..my..god. You are the best tutor I have ever seen. Wow!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -572000), review: "I'll definently look forward to booking you again! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -672000), review: "Thanks!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -772000), review: "You were easy to understand the entire time! Thank you!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -872000), review: "I aced my test because of you! :)"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -972000), review: "You should be more confident! You were so good!"),
                                                            TutoringEvent(date: Date(timeIntervalSinceNow: -1072000), review: "Let me tell you... for your first time, you did a stellar job!")
                                                            
                                                            
                                    ], averageRating: 3.71, monthlyRating: 3.60, perfectRatings: 4 ), subject: "ELL")
    
    
    ]
}

extension CLLocation {
    public func random() -> CLLocation {

        let lat = Double.random(in: 49...49.3)
        let long = Double.random(in: -123...(-123.3))

        return CLLocation(latitude: lat, longitude: long)
    }
}
