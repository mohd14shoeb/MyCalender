//
//  ViewController.swift
//  KDCalendar
//
//  Created by Michael Michailidis on 01/04/2015.
//  Copyright (c) 2015 Karmadust. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, CalendarViewDataSource, CalendarViewDelegate {

    
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var calendarView: CalendarView!
    var date:NSDate = NSDate()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        calendarView.layer.cornerRadius = 5.0
        calendarView.clipsToBounds = true
        calendarView.layer.borderWidth = 2.0
        calendarView.layer.borderColor = UIColor(red: 46.0/255.0, green: 46.0/255.0, blue: 46.0/255.0, alpha: 1.0).CGColor
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.direction = .Horizontal
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        self.calendarView.bringSubviewToFront(btnView)
        let dateComponents = NSDateComponents()
        dateComponents.day = -5
        
        let today = NSDate()
        
        if let date = self.calendarView.calendar.dateByAddingComponents(dateComponents, toDate: today, options: NSCalendarOptions()) {
            self.calendarView.selectDate(date)
            self.calendarView.deselectDate(date)
        }
        
        
    }
    
    func startDate() -> NSDate? {
        
        let dateComponents = NSDateComponents()
        dateComponents.month = -10
        
        let today = NSDate()
        
        let threeMonthsAgo = self.calendarView.calendar.dateByAddingComponents(dateComponents, toDate: today, options: NSCalendarOptions())
        return threeMonthsAgo
    }
    
    func endDate() -> NSDate? {
        
        let dateComponents = NSDateComponents()
      
        dateComponents.year = 2;
        let today = NSDate()
        
        let twoYearsFromNow = self.calendarView.calendar.dateByAddingComponents(dateComponents, toDate: today, options: NSCalendarOptions())
        
        return twoYearsFromNow
  
    }
    
    func calenderData() -> NSDictionary? {
        let dict = ["date":date]
        return dict
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let width = self.view.frame.size.width - 16.0 * 2
        let height = width + 20.0
        self.calendarView.frame = CGRect(x: 16.0, y: 32.0, width: width, height: height)
    }
    
    
    
    // MARK : KDCalendarDelegate
   
    func calendar(calendar: CalendarView, didSelectDate date : NSDate) {
        print("Did Select: \(date) ")
    }
    
    func calendar(calendar: CalendarView, didScrollToMonth date : NSDate) {
        //self.calendarView.setDisplayDate(, animated: true)
    }
    
    @IBAction func showPrevMonth(sender: AnyObject) {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let newComponents = NSDateComponents()
        newComponents.year =  components.year
        newComponents.month = components.month-1
        newComponents.day = components.day
        let newDate = calendar.dateFromComponents(newComponents)
        //print(newDate!)
        self.calendarView.setDisplayDate(newDate!, animated: true)
        date = newDate!
    }

    @IBAction func showNextMonth(sender: AnyObject) {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        let newComponents = NSDateComponents()
        newComponents.year =  components.year
        newComponents.month = components.month+1
        newComponents.day = components.day
        let newDate = calendar.dateFromComponents(newComponents)
        //print(newDate!)
        self.calendarView.setDisplayDate(newDate!, animated: true)
        date = newDate!
    }
}




