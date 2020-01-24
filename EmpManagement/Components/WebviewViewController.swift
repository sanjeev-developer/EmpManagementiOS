//
//  WebviewViewController.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-16.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webflow: WKWebView!
    var optionSelect : String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()

        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        items.append( UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(add)) ) // replace add with your function

        self.toolbarItems = items // this made the difference. setting the items to the controller, not the navigationcontroller
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.goBack))

        if(optionSelect == "about")
        {
            let url = URL(string: "https://www.hubspot.com/our-story")!
            webflow.load(URLRequest(url: url))
            webflow.allowsBackForwardNavigationGestures = true
        }
        else if(optionSelect == "contact")
        {
            let url = URL(string: "https://www.hubspot.com/company/contact")!
            webflow.load(URLRequest(url: url))
            webflow.allowsBackForwardNavigationGestures = true
        }
       
        
    }
    
    @objc func add() {
           print("Tap viewbill.....")
           let obj = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                  self.navigationController?.pushViewController(obj, animated: true)
       }
       
    
   override func loadView() {
        webflow = WKWebView()
        webflow.navigationDelegate = self
    webflow.frame.size.height = 1
            webflow.frame.size = webflow.sizeThatFits(CGSize.zero)
        view = webflow
    }
    
 

}
