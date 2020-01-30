//
//  VehiclelistViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit
import CoreData

class VehiclelistViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var vehicletabel: UITableView!
    @IBOutlet var but_back_vlist: UIButton!
    @IBOutlet var but_add_vehicle: UIButton!
    var position : Int!
    var empid : String!
    var objectUpdate : NSManagedObject!
    var result:[Any] = []
    var cell : VehicleListTableViewCell!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return( result.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        objectUpdate = result[indexPath.row] as! NSManagedObject
        
        if(objectUpdate.value(forKey: "empid") as! String == empid)
        {
            cell = vehicletabel.dequeueReusableCell(withIdentifier: "vehiclecell", for: indexPath) as! VehicleListTableViewCell
             cell.txt_vehicle_type.text =  objectUpdate.value(forKey: "vehicletype") as! String
             cell.txt_vehicle_model.text =  objectUpdate.value(forKey: "model") as! String
             cell.txt_vehicle_plate.text =  objectUpdate.value(forKey: "plate") as! String
             cell.txt_comapny.text =  objectUpdate.value(forKey: "company") as! String
             
             if(objectUpdate.value(forKey: "company") as! String == "Honda")
             {
                 cell.img_list.image = UIImage(named: "honda")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Chervolet")
             {
                 cell.img_list.image = UIImage(named: "cheve")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "BMW")
             {
                 cell.img_list.image = UIImage(named: "bmw")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Mercedes")
             {
                 cell.img_list.image = UIImage(named: "mercedes")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Landrover")
             {
                 cell.img_list.image = UIImage(named: "landrover")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Bajaj")
             {
                 cell.img_list.image = UIImage(named: "chetak")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Ford")
             {
                 cell.img_list.image = UIImage(named: "ford")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Suzuki")
             {
                 cell.img_list.image = UIImage(named: "suzuki")
             }
             else if (objectUpdate.value(forKey: "company") as! String == "Audi")
             {
                 cell.img_list.image = UIImage(named: "Audi")
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
        
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete this Vehicle", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
            //run your function here
            self.deletevehdata(data : indexPath.row)
        }))
//        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { action in
//            //run your function here
//            self.movetoedit(data : indexPath.row)
//        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func but_back_clist(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(obj, animated: true)
    }

    
    func movetoedit(data : Int)
    {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddvehViewController") as! AddvehViewController
        obj.vehicleposition = data
        obj.userposition = position
        obj.purpose = "edit"
        obj.empid = self.empid
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    @IBAction func butmovetoadd(_ sender: Any)
    {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "AddvehViewController") as! AddvehViewController
        obj.userposition = position
        obj.purpose = "add"
        obj.empid = self.empid
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveData()
    }
    
    
    func retrieveData() {
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Vehinfo")
        
        do {
            let res = try managedContext.fetch(fetchRequest)
            for i in res {
                 objectUpdate = i as! NSManagedObject
                 if(objectUpdate.value(forKey: "empid") as! String == empid)
                 {
                    result.append(i)
                }
            }
            
            self.vehicletabel.reloadData()
            
//            if(!result.isEmpty)
//            {
//                for i in 0...result.count{
//                    objectUpdate = result[position] as! NSManagedObject
//                    print(objectUpdate.value(forKey: "company") as! String)
//                }
//
//            }
            
            
            
        } catch {
            print("Failed")
        }
    }
    
func deletevehdata(data : Int)
  {
      //As we know that container is set up in the AppDelegates so we need to refer that container.
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                
                //We need to create a context from this container
                let managedContext = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Vehinfo")
               
                do
                {
                    let test = try managedContext.fetch(fetchRequest)
                    
                    let objectToDelete = test[data] as! NSManagedObject
                    managedContext.delete(objectToDelete)
                    
                    do{
                        try managedContext.save()
                    }
                    catch
                    {
                        print(error)
                    }
                  
                    let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                           self.navigationController?.pushViewController(obj, animated: true)
                    //vehicletabel.reloadData()
                }
                catch
                {
                    print(error)
                }
    
}
}
