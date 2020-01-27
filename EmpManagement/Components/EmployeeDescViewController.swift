//
//  EmployeeDescViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txt_empid.text =  UserDetails.shared.userarray[position].empid
        txt_empname.text =  UserDetails.shared.userarray[position].empname
        txt_empage.text =  UserDetails.shared.userarray[position].dateofbirth
        txt_emptype.text =  UserDetails.shared.userarray[position].type
        txt_country.text =  UserDetails.shared.userarray[position].country
        txt_city.text =  UserDetails.shared.userarray[position].city
       // txt_empage.text = String(getAgeFromDOF(date: UserDetails.shared.userarray[position].dateofbirth))
        
        self.img_user.layer.cornerRadius = img_user.bounds.width/2

        
      if(UserDetails.shared.userarray[position].imagedata != nil)
      {
        
        let decodedData = Data(base64Encoded: UserDetails.shared.userarray[position].imagedata, options: .ignoreUnknownCharacters)!
           
               
               let imagee = UIImage(data: decodedData)
               img_user.image = imagee
           
        }
       
                 
            
        
        if(UserDetails.shared.userarray[position].type == "Intern")
        {
            view_intern.isHidden = false
            view_fulltime.isHidden = true
            view_ptc.isHidden = true
            view_ptf.isHidden = true
            txt_schoolname.text = UserDetails.shared.userarray[position].schoolname
            var salary : String = UserDetails.shared.userarray[position].salary
            txt_salary_intern.text = "$ \(salary)"
            txt_total.text = "$ \(salary)"
        }
        else if(UserDetails.shared.userarray[position].type == "FullTime")
        {
            view_intern.isHidden = true
                      view_fulltime.isHidden = false
                      view_ptc.isHidden = true
                      view_ptf.isHidden = true
            
            var bonus : String = UserDetails.shared.userarray[position].bonus
            var salary : String = UserDetails.shared.userarray[position].salary
            
            txt_bonus_ft.text = "$ \(bonus)"
            txt_salary_ft.text = "$ \(salary)"
            
            var totalbill : Int = (Int(salary)!) + (Int(bonus)!)
            txt_total.text = "$ \(totalbill)"
        }
            
        else if(UserDetails.shared.userarray[position].type == "PartTimeFixed")
        {
           view_intern.isHidden = true
                     view_fulltime.isHidden = true
                     view_ptc.isHidden = true
                     view_ptf.isHidden = false
            
            var wage : String = UserDetails.shared.userarray[position].rate
            var hour : String = UserDetails.shared.userarray[position].HourWorked
            var fixedamount : String = UserDetails.shared.userarray[position].fixedamount
            
                            txt_hwage_ptf.text = "$ \(wage)"
                            txt_hworked_ptf.text = "\(hour) hr"
                            txt_fixedamount_ptf.text = "$ \(fixedamount)"
            
            var totalbill : Int = (Int(wage)! * Int(hour)!) + (Int(fixedamount)!)
            txt_total.text = "$ \(totalbill)"
        }
        
        if(UserDetails.shared.userarray[position].type == "PartTimeCommissioned")
        {
            view_intern.isHidden = true
                      view_fulltime.isHidden = true
                      view_ptc.isHidden = false
                      view_ptf.isHidden = true
            
                      var wage : String = UserDetails.shared.userarray[position].rate
                      var hour : String = UserDetails.shared.userarray[position].HourWorked
                      var commission : String = UserDetails.shared.userarray[position].commissionpercent
            
                       txt_hwage_ptc.text = "$ \(wage)"
                       txt_hworked_ptc.text = "\(hour) hr"
                       txt_commission_ptc.text = "$ \(commission)"
            
            var totalbill : Int = (Int(wage)! * Int(hour)!) + (Int(commission)!)
            txt_total.text = "$ \(totalbill)"
        }

        
        if(UserDetails.shared.userarray[position].Vehicle.isEmpty)
        {
            txt_vehiclestatus.text =  "No"
        }
        else
        {
            txt_vehiclestatus.text =  "Yes"
        }
    }
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return( UserDetails.shared.userarray[position].Vehicle.count)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = EmpDescTabel.dequeueReusableCell(withIdentifier: "desccell", for: indexPath) as! EmpDescTabelTableViewCell
            cell.txt_title_type.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].vehicletype
            cell.txt_company.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].company
            cell.txt_Model.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].model
            cell.txt_plate.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].plate
            cell.txt_year.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].year
            
            if(UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Honda")
            {
             cell.img_vehicle.image = UIImage(named: "honda")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Chervolet")
            {
                cell.img_vehicle.image  = UIImage(named: "cheve")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "BMW")
            {
                cell.img_vehicle.image  = UIImage(named: "bmw")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Mercedes")
            {
                cell.img_vehicle.image  = UIImage(named: "mercedes")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Landrover")
            {
                cell.img_vehicle.image  = UIImage(named: "landrover")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Bajaj")
            {
                cell.img_vehicle.image  = UIImage(named: "chetak")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Ford")
            {
                cell.img_vehicle.image  = UIImage(named: "ford")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Suzuki")
            {
                cell.img_vehicle.image  = UIImage(named: "suzuki")
            }
            else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Audi")
                               {
                                   cell.img_vehicle.image = UIImage(named: "Audi")
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
       //      edtDate.text = dateFormatter1.string(from: date)
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
}
