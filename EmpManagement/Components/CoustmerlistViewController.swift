import UIKit
import CoreData
class CoustmerlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tabelview: UITableView!
    @IBOutlet var but_back_clist: UIButton!
    var optionSelect : String!
    var empArr = [Empdata]()
    //var imagez : UIImage
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoustmerTableViewCell
        //print(empArr[indexPath.row].empname)
//      cell.txtCellName.text =  UserDetails.shared.userarray[indexPath.row].empname
//      cell.txtCellEmail.text =  UserDetails.shared.userarray[indexPath.row].empid
//      cell.txtCellPhone.text =  UserDetails.shared.userarray[indexPath.row].dateofbirth
        
        cell.txtCellName.text =  empArr[indexPath.row].empname
        cell.txtCellEmail.text =  empArr[indexPath.row].empid
        cell.txtCellPhone.text =  empArr[indexPath.row].dateofbirth
        
        if let decodedData = Data(base64Encoded: empArr[indexPath.row].imagedata!, options: .ignoreUnknownCharacters) {
            var imagez = UIImage(data: decodedData)
                       cell.profileimage.image = imagez
                        }
        
//        if(empArr.count == 0)
//        {
//
//        }
//        else
//        {
//            cell.txtCellName.text =  empArr[indexPath.row].empname
//                   cell.txtCellEmail.text =  empArr[indexPath.row].empid
//                   cell.txtCellPhone.text =  empArr[indexPath.row].dateofbirth
//
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        if(optionSelect == "delete")
        {
            let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete this Employee", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                //run your function here
                self.deletecoustmer(data : indexPath.row)
            }))
            
            alert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
            
        else if(optionSelect == "addvehicle")
        {
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "VehiclelistViewController") as! VehiclelistViewController
            
            obj.position = indexPath.row
            obj.empid = empArr[indexPath.row].empid
            
            self.navigationController?.pushViewController(obj, animated: true)
            
        }
            
            
        else if(optionSelect == "empdesc")
        {
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeDescViewController") as! EmployeeDescViewController
            obj.position = indexPath.row
            obj.empArr = empArr[indexPath.row]
            self.navigationController?.pushViewController(obj, animated: true)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.tableFooterView = UIView()
        fetchrecords()
    }
    
    @IBAction func but_back_clist(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func deletecoustmer(data : Int)
    {
        //As we know that container is set up in the AppDelegates so we need to refer that container.
                  guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                  
                  //We need to create a context from this container
                  let managedContext = appDelegate.persistentContainer.viewContext
                  
                  let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Empdata")
                 
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
                    
                    fetchrecords()
                    tabelview.reloadData()
                      
                  }
                  catch
                  {
                      print(error)
                  }
        
    // UserDetails.shared.userarray.remove(at: data)
        DispatchQueue.main.async { self.tabelview.reloadData() }
    }
    
    func fetchrecords()
    {
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let requ: NSFetchRequest<Empdata> = Empdata.fetchRequest()
        
        do {
            let objs = try managedContext.fetch(requ)
            empArr = objs
//            for ob in objs {
//                print(ob.city)
//            }
        } catch {
        }
    }
    
 
       
    
//    func encodeimage(imagestring: String) -> UIImage {
//         if let decodedData = Data(base64Encoded: imagestring, options: .ignoreUnknownCharacters) {
//            imagez = UIImage(data: decodedData)!
//                    //cell.profileimage.image = imagee
//                      }
//        return imagez
//    }
}
