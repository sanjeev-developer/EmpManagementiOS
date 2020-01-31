
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var main_view: UIView!
    @IBOutlet var imgLog: UIImageView!
    @IBOutlet var butlog: UIButton!
    @IBOutlet var edt_admin_password: UITextField!
    @IBOutlet var edt_admin_username: UITextField!
    let username : String = "admin"
    let password : String = "12345678"
    var decison : Int = 0
    var Astatus : Bool = false
    var Cstatus : Bool = false
    var checkstatus : Bool = false
    @IBOutlet var switchout: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        //Looks for single or multiple taps.
          let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

          //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
          //tap.cancelsTouchesInView = false

          view.addGestureRecognizer(tap)
   
              if(UserDetails.shared.userarray.isEmpty)
                     {
                      var temp : Int = 2346
                      var userarray = ["naobie","wilson","tyler","desmond","santa monica"]
                      var emailarray = ["naobie@gmail.com","wilson@gmail.com","tyler@gmail.com","desmond@gmail.com","santamonica@gmail.com"]
                      for i in 1...userarray.count{
                          var userdata = Userdata()
                                                       // UserDetails.shared.name = "Sanjeev"
                          userdata.empname = userarray[i-1]
                          userdata.empid = "Intern-345"
                          userdata.dateofbirth = "23rd nov 1992"
                          userdata.type = "Intern"
                          userdata.salary = "100000"
                          userdata.fixedamount = "5000"
                          userdata.commissionpercent = "20"
                          userdata.schoolname = "new school"
                          userdata.bonus = "50"
                        userdata.country = "Canada"
                        userdata.city = "Toronto"
                        
                        
                        
                        var vehobj = Vehicledata()
                        vehobj.vehicletype = "Car"
                        vehobj.company = "Honda"
                        vehobj.model = "HXT678"
                        vehobj.plate = "ghj345"
                        vehobj.year = "2010"
                        
                        userdata.Vehicle.append(vehobj)
                          UserDetails.shared.userarray.append(userdata)
                       }
                     }
        
        
            var checkAstatus = UserDefaults.standard.bool(forKey: "Key")
             if(checkAstatus)
                              {
                               edt_admin_username.text = UserDefaults.standard.string(forKey: "username")
                                                                edt_admin_password.text = UserDefaults.standard.string(forKey: "password")
                               switchout.setOn(true, animated: false)
                              }
                              else
                              {
                              edt_admin_username.text = ""
                              edt_admin_password.text = ""
                              switchout.setOn(false, animated: false)
                              }
            
     
    }

    @IBAction func but_login(_ sender: Any) {
        
                if(edt_admin_username.text == username && edt_admin_password.text == password)
                       {
                                  if(Astatus)
                                  {
                                     UserDefaults.standard.set(true, forKey: "Key") //Bool
                                     UserDefaults.standard.set(edt_admin_username.text, forKey: "username") //Bool
                                     UserDefaults.standard.set(edt_admin_password.text, forKey: "password") //Bool
                                  }
                                  else
                                  {
                                     UserDefaults.standard.set(false, forKey: "Key") //Bool
                                     UserDefaults.standard.set("", forKey: "username") //Bool
                                     UserDefaults.standard.set("", forKey: "password") //Bool
                                  }
                           
                           let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")as! HomeViewController
                           self.navigationController?.pushViewController(obj, animated: true)
                       }
                       else
                       {
                          showdialog(data: "please check your username and password")
                       }
 
    }
    

    
    @IBAction func switchRem(_ sender: Any) {
        
        if(switchout.isOn)
        {
            Astatus = true
        }
        else
        {
            Astatus = false
        }
    }
    
   
    
    func showdialog(data : String )  {
        
                let alert = UIAlertController(title: "Alert", message: data, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))

                self.present(alert, animated: true)
    }
    
    //Calls this function when the tap is recognized.
      @objc func dismissKeyboard() {
          //Causes the view (or one of its embedded text fields) to resign the first responder status.
          view.endEditing(true)
      }
    
}
