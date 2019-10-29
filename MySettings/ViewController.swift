//
//  ViewController.swift
//  MySettings
//
//  Created by Bernard Slater on 10/23/19.
//  Copyright © 2019 Bernard Slater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var favoritecolor: UITextField!
    @IBOutlet weak var jobtitle: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.fullname.text, forKey: "fullname")
            defaults.set(self.address.text, forKey: "address")
            defaults.set(self.username.text, forKey: "username")
            defaults.set(self.password.text, forKey: "password")
            defaults.set(self.favoritecolor.text, forKey: "favoritecolor")
            defaults.set(self.jobtitle.text, forKey: "jobtitle")
        
        
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    
    
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            let defaults: UserDefaults = UserDefaults.standard
                  if defaults.string(forKey: "fullname") != nil{
                        fullname.text = defaults.string(forKey: "fullname")
                  }
                  if defaults.string(forKey: "address") != nil{
                      address.text = defaults.string(forKey: "email")
                  }
                  if defaults.string(forKey: "bdate") != nil{
                      let bdate  = defaults.string(forKey: "bdate")
                      let dateFormatter = DateFormatter()
                      dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                      let date = dateFormatter.date(from: bdate!) //according to date format your date string
                      datepicker.setDate(date!, animated: true)
                    }
                    if defaults.string(forKey: "username") != nil{
                        username.text = defaults.string(forKey: "username")
             
                    }
                    if defaults.string(forKey: "password") != nil{
                       password.text = defaults.string(forKey: "password")
                    
                    }
                    if defaults.string(forKey: "favoritecolor") != nil{
                       favoritecolor.text = defaults.string(forKey: "favoritecolor")
                            
                    }
                    if defaults.string(forKey: "jobtitle") != nil{
                      jobtitle.text = defaults.string(forKey: "jobtitle")
                            
                        
                        
                        
                        
            }
        }
        
       func clear()
       {
        address.resignFirstResponder()
               fullname.resignFirstResponder()
        }


    }

