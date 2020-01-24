import UIKit

class CoustmerlistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tabelview: UITableView!
    @IBOutlet var but_back_clist: UIButton!
    
    var optionSelect : String!

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return( UserDetails.shared.userarray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoustmerTableViewCell
        cell.txtCellName.text =  UserDetails.shared.userarray[indexPath.row].empname
        cell.txtCellEmail.text =  UserDetails.shared.userarray[indexPath.row].empid
        cell.txtCellPhone.text =  UserDetails.shared.userarray[indexPath.row].dateofbirth
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
                          
                                 self.navigationController?.pushViewController(obj, animated: true)
                
        }
        
        
        else if(optionSelect == "empdesc")
            {
                
              let obj = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeDescViewController") as! EmployeeDescViewController
                obj.position = indexPath.row
                self.navigationController?.pushViewController(obj, animated: true)
                
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelview.tableFooterView = UIView()
        //self.tabelview.register(CoustmerTableViewCell.self, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    @IBAction func but_back_clist(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    func deletecoustmer(data : Int)
    {
        UserDetails.shared.userarray.remove(at: data)
        DispatchQueue.main.async { self.tabelview.reloadData() }
    }
}
