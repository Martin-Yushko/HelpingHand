//
//  MapMarkerWindow.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-03-09.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

class MapMarkerWindow: UIView {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var starRatingView: StarRatingView!
    
    public var dataSource: Tutor?
    
    @IBOutlet weak var tutorLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MapMarkerWindowView", owner: self, options: nil)
        contentView.fixInView(self)
        
        /*let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.didTap (_:)))
        
        self.addGestureRecognizer(tapGesture)*/
    }
    
   /* @objc func didTap(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "reviewTutorProfileSegue", sender: nil)
    }
    */
    
}
