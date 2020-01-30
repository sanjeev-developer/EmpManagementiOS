//
//  FirstViewController.swift
//  AgeCalculator
//
//  Created by sanjeev gupta on 2019-10-29.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var but_coustmet: UIButton!
    @IBOutlet var but_admin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
  
      
        self.but_coustmet.layer.cornerRadius = 10
                 self.but_coustmet.clipsToBounds = true
        
        self.but_admin.layer.cornerRadius = 10
                 self.but_admin.clipsToBounds = true
        
         //Looks for single or multiple taps.
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           //tap.cancelsTouchesInView = false

          self.view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view.
    }
    
    @IBAction func but_admin(_ sender: Any)
    {
           let obj = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         obj.decison = 0
                                     self.navigationController?.pushViewController(obj, animated: true)
    }
    
 
    @IBAction func but_coustmer(_ sender: Any) {
        
         let obj = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        obj.decison = 1
                                            self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func getPlist(withName name: String) -> [String]?
    {
        if  let path = Bundle.main.path(forResource: name, ofType: "pDatabase"),
            let xml = FileManager.default.contents(atPath: path)
        {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }

        return nil
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
