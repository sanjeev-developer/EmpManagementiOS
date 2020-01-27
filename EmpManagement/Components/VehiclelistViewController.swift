//
//  VehiclelistViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class VehiclelistViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var vehicletabel: UITableView!
    @IBOutlet var but_back_vlist: UIButton!
    @IBOutlet var but_add_vehicle: UIButton!
    var position : Int!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return( UserDetails.shared.userarray[position].Vehicle.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = vehicletabel.dequeueReusableCell(withIdentifier: "vehiclecell", for: indexPath) as! VehicleListTableViewCell
        cell.txt_vehicle_type.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].vehicletype
        cell.txt_vehicle_model.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].model
        cell.txt_vehicle_plate.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].plate
        cell.txt_comapny.text =  UserDetails.shared.userarray[position].Vehicle[indexPath.row].company
        
        if(UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Honda")
                   {
                    cell.img_list.image = UIImage(named: "honda")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Chervolet")
                   {
                       cell.img_list.image = UIImage(named: "cheve")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "BMW")
                   {
                       cell.img_list.image = UIImage(named: "bmw")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Mercedes")
                   {
                       cell.img_list.image = UIImage(named: "mercedes")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Landrover")
                   {
                       cell.img_list.image = UIImage(named: "landrover")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Bajaj")
                   {
                       cell.img_list.image = UIImage(named: "chetak")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Ford")
                   {
                       cell.img_list.image = UIImage(named: "ford")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Suzuki")
                   {
                       cell.img_list.image = UIImage(named: "suzuki")
                   }
                   else if (UserDetails.shared.userarray[position].Vehicle[indexPath.row].company == "Audi")
                                      {
                                          cell.img_list.image = UIImage(named: "Audi")
                                      }
                   return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete this Vehicle", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
            //run your function here
            self.deletevehicle(data : indexPath.row)
        }))
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
                   //run your function here
                   self.movetoedit(data : indexPath.row)
               }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

    @IBAction func but_back_clist(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func deletevehicle(data : Int)
    {
        UserDetails.shared.userarray[position].Vehicle.remove(at: data)
        DispatchQueue.main.async { self.vehicletabel.reloadData() }
    }
    
    func movetoedit(data : Int)
      {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddvehViewController") as! AddvehViewController
        obj.vehicleposition = data
        obj.userposition = position
        obj.purpose = "edit"
        self.navigationController?.pushViewController(obj, animated: true)
      }
    
    @IBAction func butmovetoadd(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddvehViewController") as! AddvehViewController
        obj.userposition = position
        obj.purpose = "add"
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
}
