//
//  AboutViewController.swift
//  glosor
//
//  Created by gm on 2016-03-30.
//  Copyright © 2016 gm. All rights reserved.
//
//klassen inehåller info om appen


import UIKit

class AboutViewController: UIViewController {
    
    //:MARK ELEMENTS
    @IBOutlet weak var TextView: UITextView!
    
    
    var settingsAppLanguageUppdate:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(settingsAppLanguageUppdate)
        self.setUpSettingsAppLanguage()
        TextView.textColor = UIColor.blackColor()
    }
    
    
    
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" || settingsAppLanguageUppdate == nil {
            TextView.text = "Att lära sig ett nytt språk kräver mycket tid, oftast flera år, en bra studieteknik och rätt hjälpmedel. Även att komma igång med skriftspråket i modersmålet kan ibland vara ganska svårt oavsett förutsättningar.\r\n Med rätt ”verktyg” kan inlärningsprocessen förenklas. Gloslistor- appen riktar sig mot nybörjare i ett eller flera språk lika så till dig som behöver hjälp att komma igång med skriftspråket och/eller öva på stavningen. Med hjälp av olika förhörsmetoder kan du på ett enkelt sätt träna på nya ord, begrepp och stavning."
        }
        if settingsAppLanguageUppdate == "English" {
            TextView.text =  "text på engelska...."
        }
       
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
