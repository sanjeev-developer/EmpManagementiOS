//
//  AddvehViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit
import CoreData

class AddvehViewController: UIViewController {
    
    @IBOutlet weak var companyName_txtFld: UITextField!
    @IBOutlet weak var modelName_txtFld: UITextField!
    @IBOutlet weak var plate_txtFld: UITextField!
    @IBOutlet weak var year_txtFld: UITextField!
    var companyNameArr = [String]()
    var selection : Int = 0
    var vehicleposition : Int = 0
    var userposition : Int = 0
    var purpose : String = ""
    var vehtype : String = ""
    var empid : String!
    var pickerView = ToolbarPickerView()
    
    @IBOutlet var testimage: UIImageView!
    @IBOutlet var vehsegment: UISegmentedControl!
    @IBOutlet var but_addveh: UIButton!
    
    
    @IBAction func actionvehsegment(_ sender: Any) {
        
        if (vehsegment.selectedSegmentIndex == 0){
            vehtype = "Motorcycle"
            
        }
        else if(vehsegment.selectedSegmentIndex == 1)
        {
            vehtype = "Car"
            
        }
        
    }
    
    
    @IBAction func but_back_vehicle(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "VehiclelistViewController") as! VehiclelistViewController
        obj.position = userposition
        self.navigationController?.pushViewController(obj, animated: true)
        
    }
    
    @IBAction func butaddveh(_ sender: Any) {
        
        if(companyName_txtFld.text == "")
        {
            showdialog(data: "please select company")
        }
        else if(modelName_txtFld.text == "")
        {
            showdialog(data: "please select model")
        }
        else if(plate_txtFld.text == "")
        {
            showdialog(data: "please enter plate no")
        }
        else if(year_txtFld.text == "")
        {
            showdialog(data: "please select year")
        }
        else
        {
//            var vehobj = Vehicledata()
//            vehobj.vehicletype = vehtype
//            vehobj.company = companyName_txtFld.text
//            vehobj.model = modelName_txtFld.text
//            vehobj.plate = plate_txtFld.text
//            vehobj.year = year_txtFld.text
            
            
            
            if(purpose == "edit")
            {
//                UserDetails.shared.userarray[userposition].Vehicle.remove(at: vehicleposition)
//                UserDetails.shared.userarray[userposition].Vehicle.append(vehobj)
            }
            else
            {
               // UserDetails.shared.userarray[userposition].Vehicle.append(vehobj)
                createData()
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.but_addveh.layer.cornerRadius = 10
        self.but_addveh.clipsToBounds = true
        
        companyName_txtFld.inputView = pickerView
        modelName_txtFld.inputView = pickerView
        // plate_txtFld.inputView = pickerView
        year_txtFld.inputView = pickerView
        
        companyName_txtFld.inputAccessoryView = pickerView.toolbar
        modelName_txtFld.inputAccessoryView = pickerView.toolbar
        // plate_txtFld.inputAccessoryView = pickerView.toolbar
        year_txtFld.inputAccessoryView = pickerView.toolbar
        
        pickerView.dataSource = self as! UIPickerViewDataSource
        pickerView.delegate = self as! UIPickerViewDelegate
        pickerView.toolbarDelegate = self as! ToolbarPickerViewDelegate
        
        //Looks for single or multiple taps.
                  let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

                  //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
                  //tap.cancelsTouchesInView = false

                 self.view.addGestureRecognizer(tap)

        
        if(purpose == "edit")
        {
            if(UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Honda")
            {
                self.testimage.image = UIImage(named: "honda")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Chervolet")
            {
                self.testimage.image = UIImage(named: "cheve")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "BMW")
            {
                self.testimage.image = UIImage(named: "bmw")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Mercedes")
            {
                self.testimage.image = UIImage(named: "mercedes")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Landrover")
            {
                self.testimage.image = UIImage(named: "landrover")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Bajaj")
            {
                self.testimage.image = UIImage(named: "chetak")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Ford")
            {
                self.testimage.image = UIImage(named: "ford")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Suzuki")
            {
                self.testimage.image = UIImage(named: "suzuki")
            }
            else if (UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company == "Audi")
            {
                self.testimage.image = UIImage(named: "Audi")
            }
            
            
            if(UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].vehicletype == "Car")
            {
                vehsegment.selectedSegmentIndex = 1
            }
            else
            {
                vehsegment.selectedSegmentIndex = 0
            }
            
            companyName_txtFld.text = UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].company
            modelName_txtFld.text = UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].model
            plate_txtFld.text = UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].plate
            year_txtFld.text = UserDetails.shared.userarray[userposition].Vehicle[vehicleposition].year
        }
        
        
    }
}

extension AddvehViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == companyName_txtFld{
            pickerView.tag = 111
            companyNameArr = ["Honda","Chervolet","BMW","Mercedes","Landrover","Bajaj","Ford","Suzuki","Audi"]
            pickerView.reloadAllComponents()
            
            selection = 1
        }else if textField == modelName_txtFld{
            pickerView.tag = 222
            
            companyNameArr =      ["Base","Mid-range","Classic","Magnum","Supra","xdvt","Magnum-turbo","elegant"]
            pickerView.reloadAllComponents()
            
            selection = 2
        }else{
            pickerView.tag = 444
            companyNameArr  = ["2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016"]
            pickerView.reloadAllComponents()
            
            selection = 4
        }
    }
}

extension AddvehViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companyNameArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companyNameArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 111{
            companyName_txtFld.text = companyNameArr[row]
        }else if pickerView.tag == 222{
            modelName_txtFld.text = companyNameArr[row]
        }else if pickerView.tag == 333{
            plate_txtFld.text = companyNameArr[row]
        }else{
            year_txtFld.text = companyNameArr[row]
        }
    }
}

extension AddvehViewController: ToolbarPickerViewDelegate {
    
    func didTapDone() {
        let row = pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        
        if (selection == 1){
            
            if(companyNameArr[row] == "Honda")
            {
                self.testimage.image = UIImage(named: "honda")
            }
            else if (companyNameArr[row] == "Chervolet")
            {
                self.testimage.image = UIImage(named: "cheve")
            }
            else if (companyNameArr[row] == "BMW")
            {
                self.testimage.image = UIImage(named: "bmw")
            }
            else if (companyNameArr[row] == "Mercedes")
            {
                self.testimage.image = UIImage(named: "mercedes")
            }
            else if (companyNameArr[row] == "Landrover")
            {
                self.testimage.image = UIImage(named: "landrover")
            }
            else if (companyNameArr[row] == "Bajaj")
            {
                self.testimage.image = UIImage(named: "chetak")
            }
            else if (companyNameArr[row] == "Ford")
            {
                self.testimage.image = UIImage(named: "ford")
            }
            else if (companyNameArr[row] == "Suzuki")
            {
                self.testimage.image = UIImage(named: "suzuki")
            }
            else if (companyNameArr[row] == "Audi")
            {
                self.testimage.image = UIImage(named: "Audi")
            }
            
            companyName_txtFld.text = companyNameArr[row]
            companyName_txtFld.resignFirstResponder()
        }else if (selection == 2){
            modelName_txtFld.text = companyNameArr[row]
            modelName_txtFld.resignFirstResponder()
        }else if (selection == 4){
            year_txtFld.text = companyNameArr[row]
            year_txtFld.resignFirstResponder()
        }
        
    }
    
    func didTapCancel()
    {
        if (selection == 1){
            companyName_txtFld.text = nil
            companyName_txtFld.resignFirstResponder()
        }else if (selection == 2){
            modelName_txtFld.text = nil
            modelName_txtFld.resignFirstResponder()
        }else if (selection == 4){
            year_txtFld.text = nil
            year_txtFld.resignFirstResponder()
        }
    }
    
    func showdialog(data : String )
    {
        let alert = UIAlertController(title: "Alert", message: data, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    func createData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "Vehinfo", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(vehtype, forKeyPath: "vehicletype")
        user.setValue(companyName_txtFld.text, forKey: "company")
        user.setValue(modelName_txtFld.text, forKey: "model")
        user.setValue(plate_txtFld.text, forKey: "plate")
        user.setValue(year_txtFld.text, forKey: "year")
        user.setValue(empid, forKey: "empid")
        
        
        
        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "VehiclelistViewController") as! VehiclelistViewController
            obj.position = userposition
            self.navigationController?.pushViewController(obj, animated: true)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //Calls this function when the tap is recognized.
      @objc func dismissKeyboard() {
          //Causes the view (or one of its embedded text fields) to resign the first responder status.
          view.endEditing(true)
      }
    
}
