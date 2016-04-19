//
//  AboutViewController.swift
//  glosor
//
//  Created by gm on 2016-03-30.
//  Copyright © 2016 gm. All rights reserved.
//


//I klassen ska info om appen visas
import UIKit

class AboutViewController: UIViewController {
    
    
    @IBOutlet weak var TextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.text = "Att lära sig ett nytt språk kräver mycket tid, oftast flera år, en bra studieteknik och rätt hjälpmedel. Även att komma igång med skriftspråket i modersmålet kan ibland vara ganska svårt oavsett förutsättningar. Med rätt ”verktyg” kan inlärningsprocessen förenklas. Gloslistor- appen riktar sig mot nybörjare i ett eller flera språk lika så till dig som behöver hjälp att komma igång med skriftspråket och/eller öva på stavningen. Med hjälp av olika förhörsmetoder kan du på ett enkelt sätt träna på nya ord, begrepp och stavning."
        
        TextView.textColor = UIColor.blackColor()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
