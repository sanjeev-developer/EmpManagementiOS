//
//  EmployeeDescViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.

import UIKit
import CoreData

class EmployeeDescViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var EmpDescTabel: UITableView!
    @IBOutlet var but_back_Empdesc: UIButton!
    var position : Int!

    @IBOutlet var txt_empid: UILabel!
    @IBOutlet var txt_empname: UILabel!
    @IBOutlet var txt_empage: UILabel!
    @IBOutlet var txt_emptype: UILabel!
    @IBOutlet var txt_total: UILabel!
    @IBOutlet var txt_vehiclestatus: UILabel!
    
    @IBOutlet var view_ptf: UIView!
    @IBOutlet var txt_hwage_ptf: UILabel!
    @IBOutlet var txt_hworked_ptf: UILabel!
    @IBOutlet var txt_fixedamount_ptf: UILabel!
    
    @IBOutlet var view_ptc: UIView!
    @IBOutlet var txt_hwage_ptc: UILabel!
    @IBOutlet var txt_hworked_ptc: UILabel!
    @IBOutlet var txt_commission_ptc: UILabel!
    
    @IBOutlet var view_fulltime: UIView!
    @IBOutlet var txt_salary_ft: UILabel!
    @IBOutlet var txt_bonus_ft: UILabel!
    
    @IBOutlet var txt_country: UILabel!
    @IBOutlet var txt_city: UILabel!
    @IBOutlet var img_user: UIImageView!
    
    @IBOutlet var view_intern: UIView!
    @IBOutlet var txt_schoolname: UILabel!
    @IBOutlet var txt_salary_intern: UILabel!
    
    var empArr = Empdata()
    var objectUpdate : NSManagedObject!
    var result:[Any] = []
    var cell : EmpDescTabelTableViewCell!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        txt_empid.text =  empArr.empid
        txt_empname.text = empArr.empname
        txt_empage.text =  empArr.dateofbirth
        txt_emptype.text =  empArr.type
        txt_country.text =  empArr.country
        txt_city.text =  empArr.city
        
        retrievevehData()
        
      self.img_user.layer.cornerRadius = img_user.bounds.width/2
        
      if(empArr.imagedata != nil)
      {
        
        let decodedData = Data(base64Encoded: empArr.imagedata!, options: .ignoreUnknownCharacters)!
               
               let imagee = UIImage(data: decodedData)
               img_user.image = imagee
        }

        if(empArr.type == "Intern")
        {
            view_intern.isHidden = false
            view_fulltime.isHidden = true
            view_ptc.isHidden = true
            view_ptf.isHidden = true
            txt_schoolname.text = empArr.schoolname
            var salary : String = empArr.salary as! String
            txt_salary_intern.text = "$ \(salary)"
            txt_total.text = "$ \(salary)"
        }
        else if(empArr.type == "FullTime")
        {
            view_intern.isHidden = true
            view_fulltime.isHidden = false
            view_ptc.isHidden = true
            view_ptf.isHidden = true
            
            var bonus : String = empArr.bonus!
            var salary : String = empArr.salary!
            
            txt_bonus_ft.text = "$ \(bonus)"
            txt_salary_ft.text = "$ \(salary)"
            
            var totalbill : Int = (Int(salary)!) + (Int(bonus)!)
            txt_total.text = "$ \(totalbill)"
        }
            
        else if(empArr.type == "PartTimeFixed")
        {
                     view_intern.isHidden = true
                     view_fulltime.isHidden = true
                     view_ptc.isHidden = true
                     view_ptf.isHidden = false
            
            var wage : String = empArr.rate!
            var hour : String = empArr.hourworked!
            var fixedamount : String = empArr.fixedamount!
            
                            txt_hwage_ptf.text = "$ \(wage)"
                            txt_hworked_ptf.text = "\(hour) hr"
                            txt_fixedamount_ptf.text = "$ \(fixedamount)"
            
            var totalbill : Int = (Int(wage)! * Int(hour)!) + (Int(fixedamount)!)
            txt_total.text = "$ \(totalbill)"
        }
        
        if(empArr.type == "PartTimeCommissioned")
        {
                      view_intern.isHidden = true
                      view_fulltime.isHidden = true
                      view_ptc.isHidden = false
                      view_ptf.isHidden = true
            
                      var wage : String = empArr.rate!
                      var hour : String = empArr.hourworked!
                      var commission : String = empArr.commissionpercent!
            
                       txt_hwage_ptc.text = "$ \(wage)"
                       txt_hworked_ptc.text = "\(hour) hr"
                       txt_commission_ptc.text = "$ \(commission)"
            
            var totalbill : Int = (Int(wage)! * Int(hour)!) + (Int(commission)!)
            txt_total.text = "$ \(totalbill)"
        }

        
        if(result.isEmpty)
        {
            txt_vehiclestatus.text =  "No"
        }
        else
        {
            txt_vehiclestatus.text =  "Yes"
        }
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return(result.count)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            objectUpdate = result[indexPath.row] as! NSManagedObject
            
            if(objectUpdate.value(forKey: "empid") as! String == empArr.empid)
                  {
            
            cell = EmpDescTabel.dequeueReusableCell(withIdentifier: "desccell", for: indexPath) as! EmpDescTabelTableViewCell
            cell.txt_title_type.text =  objectUpdate.value(forKey: "vehicletype") as! String
            cell.txt_company.text =  objectUpdate.value(forKey: "company") as! String
            cell.txt_Model.text =  objectUpdate.value(forKey: "model") as! String
            cell.txt_plate.text =  objectUpdate.value(forKey: "plate") as! String
            cell.txt_year.text =  objectUpdate.value(forKey: "company") as! String
            
            if(objectUpdate.value(forKey: "company") as! String == "Honda")
            {
             cell.img_vehicle.image = UIImage(named: "honda")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Chervolet")
            {
                cell.img_vehicle.image  = UIImage(named: "cheve")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "BMW")
            {
                cell.img_vehicle.image  = UIImage(named: "bmw")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Mercedes")
            {
                cell.img_vehicle.image  = UIImage(named: "mercedes")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Landrover")
            {
                cell.img_vehicle.image  = UIImage(named: "landrover")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Bajaj")
            {
                cell.img_vehicle.image  = UIImage(named: "chetak")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Ford")
            {
                cell.img_vehicle.image  = UIImage(named: "ford")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Suzuki")
            {
                cell.img_vehicle.image  = UIImage(named: "suzuki")
            }
            else if (objectUpdate.value(forKey: "company") as! String == "Audi")
            {
                  cell.img_vehicle.image = UIImage(named: "Audi")
            }
                    
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            print(indexPath.row)

        }

        @IBAction func but_back_clist(_ sender: Any) {
            
       let obj = self.storyboard?.instantiateViewController(withIdentifier: "CoustmerlistViewController") as! CoustmerlistViewController
                     obj.optionSelect = "empdesc"
                     self.navigationController?.pushViewController(obj, animated: true)
        }
    
    func getAgeFromDOF(date: String) -> (Int)
    {
//             edtDate.text = dateFormatter1.string(from: date)
//             let dateFormater = DateFormatter()
//             dateFormater.dateFormat = "YYYY-MM-dd"
               let dateFormatter1 = DateFormatter()
               dateFormatter1.dateStyle = .medium
               dateFormatter1.timeStyle = .none
               let dateOfBirth = dateFormatter1.date(from: date)
               let calender = Calendar.current
               let dateComponent = calender.dateComponents([.year], from:
               dateOfBirth!, to: Date())
               return dateComponent.year!
           }
    
    
        
        func retrievevehData() {
    
                   //As we know that container is set up in the AppDelegates so we need to refer that container.
                   guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
                   //We need to create a context from this container
                   let managedContext = appDelegate.persistentContainer.viewContext
    
                   //Prepare the request of type NSFetchRequest  for the entity
                   let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Vehinfo")
    
                   do {
                      // result = try managedContext.fetch(fetchRequest)
    
           let res = try managedContext.fetch(fetchRequest)
           for i in res {
                objectUpdate = i as! NSManagedObject
                if(objectUpdate.value(forKey: "empid") as! String == empArr.empid)
                {
                   result.append(i)
               }
                   }
               }
            catch {
                print("Failed")
            }
}
}
