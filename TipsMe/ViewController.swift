//
//  ViewController.swift
//  TipsMe
//
//  Created by Student on 12/15/15.
//  Copyright (c) 2015 Alex Ntowe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var themeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
    var themeColor1 = UIColor.clearColor()


    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLable: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalLabel2people: UILabel!
    
    @IBOutlet weak var totalLabel3people: UILabel!
    
    @IBOutlet weak var totalLabel4people: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBAction func tapGesture(sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
    }
    @IBOutlet weak var coverView: UIView!
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue:Double? = defaults.doubleForKey("tipPercentage")
        let viewColorKey:Double? = defaults.doubleForKey("viewColor")
        if let tipValueExit = tipValue {
            switch tipValueExit {
            case 0.10: tipControl.selectedSegmentIndex = 0
            case 0.15: tipControl.selectedSegmentIndex = 1
            case 0.20: tipControl.selectedSegmentIndex = 2
            default: tipControl.selectedSegmentIndex = 0
            }
            println("View Will appear: \(tipValueExit)")
            onEditingChanged(nil)
            
        }
        var viewColorExit = UIColor.greenColor()
        if let viewColorKeyExit = viewColorKey {
            
            switch viewColorKeyExit {
            case 0: viewColorExit = UIColor.greenColor()
            case 1: viewColorExit = UIColor.blueColor()
            case 2: viewColorExit = UIColor.redColor()
            default: viewColorExit = UIColor.greenColor()
            }
            view.backgroundColor = viewColorExit
            billField.backgroundColor = viewColorExit
            coverView.backgroundColor = viewColorExit
            tipControl.backgroundColor = viewColorExit
            tipLable.textColor = viewColorExit
            totalLabel.textColor = viewColorExit
            totalLabel2people.textColor = viewColorExit
            totalLabel3people.textColor = viewColorExit
            totalLabel4people.textColor = viewColorExit
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //view.backgroundColor = UIColor(red: 52, green: 22, blue: 22, alpha: 0.5)
        billField.becomeFirstResponder()
        self.bottomView.alpha = 0
       // bottomView.hidden = true
        tipControl.alpha = 0
        tipLable.text="0.00"
        totalLabel.text="0.00"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var bottomView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func globalChange(sender: AnyObject) {
        onEditingChanged(nil)
    }
    var tipPercentages = [0.10,0.15,0.20]
    @IBAction func onEditingChanged(sender: UITextField?) {
        
        totalLabel.numberOfLines = 0
        println("Before\(count(billField.text))")
        var textFielValue:String {
            return dropFirst(billField.text)
        }
        if count(billField.text)<1 {
            billField.text="$"
            UIView.animateWithDuration(1, animations: {
                self.bottomView.alpha = 0
                self.tipControl.alpha = 0
            
            }
            )
            //bottomView.hidden = true
           // tipControl.hidden = true
        }
        else if count(billField.text)==2 && billField.text.hasPrefix("$"){
            UIView.animateWithDuration(1, animations: {
                self.bottomView.alpha = 1
                self.tipControl.alpha = 1

                }
            )
            //bottomView.hidden = false
            tipControl.hidden = false
            billField.text=textFielValue   }
        println("After\(count(billField.text))")
        
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string:billField.text!).doubleValue
        var tip = billAmount*tipPercentage
        var total = billAmount+tip
           
        
                
       
        tipLable.text = String(format: "$%0.2f",tip)
        totalLabel.text = String(format: "$%0.2f",total)
        totalLabel2people.text = String(format: "$%0.2f",total/2)
        totalLabel3people.text = String(format: "$%0.2f",total/3)
        totalLabel4people.text = String(format: "$%0.2f",total/4)
        
    }

    @IBOutlet weak var tipControl: UISegmentedControl!
}

