//
//  SynonimViewController.swift
//  glosor
//
//  Created by gm on 2016-03-29.
//  Copyright © 2016 gm. All rights reserved.
//

//klassen fungerar som en webbläsare viken presenterar en synonim till det sökta ordet



import UIKit

class SynonimViewController: UIViewController {
    
    //:MARK ELEMENTS
    @IBOutlet weak var WebView: UIWebView!
  
    @IBOutlet weak var VCTitle: UINavigationItem!
    
    
   
    var synonimWord:String?//ordet som ska sökas efter
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "synonim \(synonimWord!)"
  
        let urlString = "http://www.synonymer.se/?query=\(synonimWord!)"
    
            if let escapedUrlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet()) {
                
                if let url = NSURL(string: escapedUrlString) {
                    let request = NSURLRequest(URL: url)
                    //laddas via webben:
                    WebView.loadRequest(request)
                }
            }
        }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
