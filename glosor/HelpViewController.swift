//
//  HelpViewController.swift
//  glosor
//
//  Created by gm on 2016-03-30.
//  Copyright © 2016 gm. All rights reserved.
//

//i klassen ska inhehålla hjlkp beskrivning
import UIKit

class HelpViewController: UIViewController {
    
    

    @IBOutlet weak var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.text = "Text om hjälp...."
        TextView.textColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
 

}
