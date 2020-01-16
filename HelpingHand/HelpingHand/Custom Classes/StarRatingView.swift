//
//  StarRatingView.swift
//  HelpingHand
//
//  Created by Martin Yushko on 2019-02-05.
//  Copyright © 2019 Team Alpha. All rights reserved.
//

import UIKit

@IBDesignable
class StarRatingView: UIView {

    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var star_1: UIImageView!
    @IBOutlet weak var star_2: UIImageView!
    @IBOutlet weak var star_3: UIImageView!
    @IBOutlet weak var star_4: UIImageView!
    @IBOutlet weak var star_5: UIImageView!
    var starView: [UIImageView] = []
    
    @IBInspectable var rating: Float = 0 {
        didSet {
            updateStars(rating)
        }
    }
    @IBInspectable var filledStarImage: UIImage? = UIImage(named: "filledStar")
    @IBInspectable var halfFilledStarImage: UIImage? = UIImage(named: "halfFilledStar")
    @IBInspectable var emptyStarImage: UIImage? = UIImage(named: "emptyStar")
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        // Set stack view height to equal width of each individual imageView in it
        stackViewHeightConstraint.constant = self.frame.width/5 - 4
    }
    
    override func awakeFromNib() {
        
        self.backgroundColor = .clear
        updateStars(self.rating)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("StarRatingView", owner: self, options: nil)
        contentView.fixInView(self)
        starView = [star_1, star_2, star_3, star_4, star_5]
    }
    
    func updateStars(_ rating: Float) {
        //change fill settings in stars
        
        if rating == 4.5 {
            print("hi")
            
        }
        
        //example: 4.5 rating
        for i in 0...Int(floor(rating))-1 { // from 0 to 3
            starView[i].image = filledStarImage // [0,1,2,3] are filled: ****_
        }
        if rating - floor(rating) >= 0.4 { // 4.5 - 4 = 0.5 > 0.4, so proceed
            starView[Int(floor(rating))].image = halfFilledStarImage // [4] is now halffilled: ****/
        }
        let currentCounter = Int(floor(rating)) + 1 // currentCounter = 4 + 1 = 5
        
        if currentCounter < 4 { // 5 !< 4 so skip this last part
            for i in currentCounter...4 {
                starView[i].image = emptyStarImage
            }
        } else if currentCounter == 4 {
            starView[4].image = emptyStarImage
        }
    }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }

}
