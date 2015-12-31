//
//  SettingViewController.swift
//  TipsMe
//
//  Created by Student on 12/16/15.
//  Copyright (c) 2015 Alex Ntowe. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue:Double? = defaults.doubleForKey("tipPercentage")
        let viewColorKey:Double? = defaults.doubleForKey("viewColor")
        if let tipValueExit = tipValue {
            switch tipValueExit {
            case 0.10: tipPercentage.selectedSegmentIndex = 0
            case 0.15: tipPercentage.selectedSegmentIndex = 1
            case 0.20: tipPercentage.selectedSegmentIndex = 2
            default: tipPercentage.selectedSegmentIndex = 0
            }
            println("View Will appear: \(tipValueExit)")
            view.setNeedsDisplay()
            
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
            tipPercentage.backgroundColor = viewColorExit
            view.setNeedsDisplay()
        }
        
        UIView.animateWithDuration(1, animations: {
            println(self.tipPercentage.center.y)
            self.tipPercentage.center.y = 350
            
            println(self.tipPercentage.center.y)
            
            }
        )
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redColor(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(2, forKey: ("viewColor"))
        defaults.synchronize()
        view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
        tipPercentage.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
        view.setNeedsDisplay()
    }
    @IBAction func greenColor(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(0, forKey: ("viewColor"))
        defaults.synchronize()
        view.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9)
        tipPercentage.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9)
        view.setNeedsDisplay()
        
    }
    @IBAction func blueColor(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(1, forKey: ("viewColor"))
        defaults.synchronize()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.9)
        tipPercentage.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.9)
        view.setNeedsDisplay()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    @IBOutlet weak var tipPercentage: UISegmentedControl!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueHasChanged(sender: AnyObject) {
        
        var tipPercentages = [0.10,0.15,0.20]
        let defaults = NSUserDefaults.standardUserDefaults()
        println(tipPercentage.center.y)
        defaults.setDouble(tipPercentages[tipPercentage.selectedSegmentIndex], forKey: ("tipPercentage"))
        defaults.synchronize()
        println(tipPercentages[tipPercentage.selectedSegmentIndex])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
