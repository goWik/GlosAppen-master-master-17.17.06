//
//  synonymViewController.swift
//  glosor
//
//  Created by gm on 2016-03-29.
//  Copyright © 2016 gm. All rights reserved.
//

//klassen fungerar som en webbläsare viken presenterar en synonym till det sökta ordet



import UIKit

class SynonymViewController: UIViewController {
    
    //MARK: ELEMENTS
    @IBOutlet weak var WebView: UIWebView!

    var synonymWord:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "synonym \(synonymWord!)"
  
        let urlString = "http://www.synonymer.se/?query=\(synonymWord!)"
    
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
