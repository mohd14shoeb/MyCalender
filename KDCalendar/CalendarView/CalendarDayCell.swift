//
//  KDCalendarDayCell.swift
//  KDCalendar
//
//  Created by Michael Michailidis on 02/04/2015.
//  Copyright (c) 2015 Karmadust. All rights reserved.
//

import UIKit

let cellColorDefault = UIColor(white: 0.0, alpha: 0.1)
let cellColorToday = UIColor(red: 46.0/255.0, green: 184.0/255.0, blue: 195.0/255.0, alpha: 1.0)
let borderColor = UIColor(red: 254.0/255.0, green: 73.0/255.0, blue: 64.0/255.0, alpha: 0.8)

class CalendarDayCell: UICollectionViewCell {

    
    var isToday : Bool = false {
        
        didSet {
           
            if isToday == true {
                //self.pBackgroundView.backgroundColor = cellColorToday
                self.pBackgroundView.layer.cornerRadius = self.frame.width * 0.6
                self.pBackgroundView.layer.borderWidth = 2.0
                self.pBackgroundView.layer.borderColor = cellColorToday.CGColor
            }
            else {
                self.pBackgroundView.backgroundColor = cellColorDefault
                self.pBackgroundView.layer.cornerRadius = 4.0
                self.pBackgroundView.layer.borderWidth = 0.0
                self.pBackgroundView.layer.borderColor = borderColor.CGColor
            }
        }
    }
    
    override var selected : Bool {
        
        didSet {
            
            if selected == true {
                self.pBackgroundView.layer.borderWidth = 2.0
                
            }
            else {
                self.pBackgroundView.layer.borderWidth = 0.0
            }
            
        }
    }
    
    lazy var pBackgroundView : UIView = {
        var vFrame = CGRectInset(self.frame, 3.0, 3.0)
        let view = UIView(frame: vFrame)
        view.layer.cornerRadius = 4.0
        view.layer.borderColor = borderColor.CGColor
        view.layer.borderWidth = 0.0
        view.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        view.backgroundColor = cellColorDefault
        
        
        return view
    }()
    
     lazy var pColorView : UIImageView = {
        var view = UIImageView()
        return view
    }()
    
    lazy var textLabel : UILabel = {
       
        let lbl = UILabel()
        lbl.textAlignment = NSTextAlignment.Center
        lbl.textColor = UIColor.darkGrayColor()
        
        return lbl
        
    }()

    lazy var img1 : UIImageView = {
        
        let img1 = UIImageView()
        img1.backgroundColor = UIColor.blueColor()
        return img1
    }()
    lazy var img2 : UIImageView = {
        
        let img2 = UIImageView()
        img2.backgroundColor = UIColor.yellowColor()
        return img2
    }()
    lazy var img3 : UIImageView = {
        
        let img3 = UIImageView()
        img3.backgroundColor = UIColor.greenColor()
        return img3
    }()
    lazy var img4 : UIImageView = {
        
        let img4 = UIImageView()
        img4.backgroundColor = UIColor.redColor()
        return img4
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        img1.frame = CGRectMake(4, 4, self.frame.width*0.17, self.frame.height*0.2)
        img2.frame = CGRectMake(self.frame.width*0.85 - 6, 4, self.frame.width*0.17, self.frame.height*0.2)
        img3.frame = CGRectMake(4, self.frame.height*0.8 - 5, self.frame.width*0.17, self.frame.height*0.2)
        img4.frame = CGRectMake(self.frame.width*0.85 - 6, self.frame.height*0.8 - 5, self.frame.width*0.17, self.frame.height*0.2)
        pColorView.frame = CGRectMake(3, 3, self.frame.width - 6, self.frame.height - 6)
        
        self.addSubview(pColorView)
        self.addSubview(img1)
        self.addSubview(img2)
        self.addSubview(img3)
        self.addSubview(img4)
        self.addSubview(self.pBackgroundView)
        self.textLabel.frame = self.bounds
        self.addSubview(self.textLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
