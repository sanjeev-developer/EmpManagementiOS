////
////  BillListViewController.swift
////  AgeCalculator
////
////  Created by sanjeev gupta on 2019-11-05.
////  Copyright © 2019 sanjeev gupta. All rights reserved.
////
//
//import UIKit
//
//class BillListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    @IBOutlet var txtBillTitle: UILabel!
//    @IBOutlet var butBacklist: UIButton!
//    var postionpeople : Int = 0
//    var swapview : String = ""
//     var choose : Int = 0
//    var accessback : String = ""
//    
//    @IBOutlet var Billtableview: UITableView!
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//       
//    if(swapview == "Hydro")
//    {
//         choose = UserDetails.shared.userarray[postionpeople].hydrounit.count
//        }
//        else if(swapview == "Internet")
//    {
//         choose = UserDetails.shared.userarray[postionpeople].internetgb.count
//        }
//        else if(swapview == "Phone")
//    {
//        choose = UserDetails.shared.userarray[postionpeople].phonebillmin.count
//        
//        }
//        
//        return choose
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let billcell = Billtableview.dequeueReusableCell(withIdentifier: "Billcell", for: indexPath) as! BillListTableViewCell
//                     billcell.txtbillname.text =  UserDetails.shared.userarray[postionpeople].name
//                     billcell.txtcidbill.text =  UserDetails.shared.userarray[postionpeople].coustmerid
//                     billcell.txtphonenobill.text =  UserDetails.shared.userarray[postionpeople].phoneno
//                     billcell.txtbillemail.text =  UserDetails.shared.userarray[postionpeople].email
//                     billcell.txtphonenobill.text =  UserDetails.shared.userarray[postionpeople].phoneno
//        
//        if(swapview == "Hydro")
//        {
//             txtBillTitle.text = "Hydro Bill"
//             billcell.viewHydro.isHidden = false
//             billcell.viewGb.isHidden = true
//             billcell.viewMin.isHidden = true
//             billcell.txtanameHydro.text =  "Toronto Power"
//             billcell.txtpucHydro.text =  "$2"
//             billcell.txtbilltype.text =  "Hydro"
//            
//            billcell.txtbillidlist.text =  UserDetails.shared.userarray[postionpeople].hydrounit[indexPath.row].Billid
//             billcell.txtdate.text =  UserDetails.shared.userarray[postionpeople].hydrounit[indexPath.row].billdate
//             billcell.txtuconsumedHydro.text = String(UserDetails.shared.userarray[postionpeople].hydrounit[indexPath.row].hydrounit)
//            
//            billcell.txttotalbill.text = String("$\(UserDetails.shared.userarray[postionpeople].hydrounit[indexPath.row].hydrounit*2)")
//
//            }
//            else if(swapview == "Internet")
//        {
//            txtBillTitle.text = "Internet Bill"
//                      billcell.viewHydro.isHidden = true
//                      billcell.viewGb.isHidden = false
//                      billcell.viewMin.isHidden = true
//            
//             billcell.txtbillidlist.text =  UserDetails.shared.userarray[postionpeople].internetgb[indexPath.row].Billid
//            
//                      billcell.txtpnameGb.text = UserDetails.shared.userarray[postionpeople].internetgb[indexPath.row].gbprovider
//            
//               billcell.txtbilltype.text =  "Internet"
//            
//            var display : String = String(UserDetails.shared.userarray[postionpeople].internetgb[indexPath.row].gbused)
//            
//               billcell.txtgconsumedGb.text = ("\(display)GB")
//            
//               billcell.txtcpgGb.text = "$3"
//            
//                      billcell.txtdate.text =  UserDetails.shared.userarray[postionpeople].internetgb[indexPath.row].billdate
//              
//            
//                      billcell.txttotalbill.text = String("$\(UserDetails.shared.userarray[postionpeople].internetgb[indexPath.row].gbused*3)")
//            }
//            else if(swapview == "Phone")
//        {
//            txtBillTitle.text = "Phone Bill"
//                    billcell.viewHydro.isHidden = true
//                    billcell.viewGb.isHidden = true
//                    billcell.viewMin.isHidden = false
//            
//            billcell.txtbilltype.text =  "Phone"
//            
//             billcell.txtbillidlist.text =  UserDetails.shared.userarray[postionpeople].phonebillmin[indexPath.row].Billid
//            
//             var display : String = String(UserDetails.shared.userarray[postionpeople].phonebillmin[indexPath.row].minused)
//            
//                         billcell.txtpminconsumedMin.text = ("\(display)min")
//                      
//                         billcell.txtcpmMin.text = "$1"
//                      
//                                billcell.txtdate.text =  UserDetails.shared.userarray[postionpeople].phonebillmin[indexPath.row].billdate
//                        
//            
//                                billcell.txttotalbill.text = String("$\(UserDetails.shared.userarray[postionpeople].phonebillmin[indexPath.row].minused*1)")
//            }
//               return billcell
//    }
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//  
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//           return 400
//       }
//       
//
//    @IBAction func butBackbill(_ sender: Any) {
//        
//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "ViewBillViewController") as! ViewBillViewController
//        obj.position = postionpeople
//        obj.acesstype = accessback
//               self.navigationController?.pushViewController(obj, animated: true)
//    }
//}
