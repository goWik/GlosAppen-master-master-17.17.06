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
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet var TableView: UIView!

    var settingsAppLanguageUppdate:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSettingsAppLanguage()
        ImageView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        TextView.textColor = UIColor.whiteColor()
        
        
    }
    
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" || settingsAppLanguageUppdate == nil {
            TextView.text = "Att lära sig ett nytt språk kräver mycket tid, oftast flera år, en bra studieteknik och rätt hjälpmedel. Även att komma igång med skriftspråket i modersmålet kan ibland vara ganska svårt oavsett förutsättningar.\r\n Med rätt ”verktyg” kan inlärningsprocessen förenklas. Gloslistor- appen riktar sig mot nybörjare i ett eller flera språk lika så till dig som behöver hjälp att komma igång med skriftspråket och/eller öva på stavningen. Med hjälp av olika förhörsmetoder kan du på ett enkelt sätt träna på nya ord, synonymer och stavning."
        }
        if settingsAppLanguageUppdate == "English" {
            TextView.text =  "To learn a new language demands a lot of time, often several years, an effective way to study and the right tools. It is sometimes even hard to get started with the written language in your native language. The learning process can be made simpler with the right tools. The Gloslistor-app is for those that has just began to learn a new language as to those who just needs to practice spelling. With the help of different methods you are able to, in an easy way, practice on new words, synonyms and spelling."
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
