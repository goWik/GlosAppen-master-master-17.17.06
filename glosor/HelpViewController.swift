//
//  HelpViewController.swift
//  glosor
//
//  Created by gm on 2016-03-30.
//  Copyright © 2016 gm. All rights reserved.
//

//klassens funktionalitet: innhehåller "hjälp" beskrivning
import UIKit

class HelpViewController: UIViewController {
    
    
    //:MARK ELEMENTS
    @IBOutlet weak var TextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.text = "\r\nI denna GlosaaP kan du skapa en gloslista i taget genom att välja alternativet SKAPA.\r\nEn gloslista består av två språk och ett obegränsatd antal ord. Du kan redigera dina gloslistor genom att ta bort, lägga till eller ändra dina glosor. Efter du har skapat en gloslista och tryckt på KLAR skickas du vidare till dina gloslistor. Därifrån kan du ta bort den befintliga gloslistan eller dela den: skicka som sms/mejl, lägga till i anteckningar eller använda andra tjänster som är tillgänliga på din enhet.\r\nFÖRHÖRSMETODER: För att välja mellan olika förhörssätt behöver du trycka på just den gloslistan du vill blir förhört ifrån. När du väl väljer ett av försärsätt ska du skriva in det översatta ordet i den tomma rutan. När du känner dig klar, finner du två knappar längst ner: GÖR OM och RÄTTA.\r\nRÄTTA knappen rättar dina svar. Om det översatta ordet stämmer overäns med det ordet som du har översatt kommer du att se en grön bock. Om ingen grön bock visas, betyder det att du kan försöka igen.\r\nGÖR OM knappen ger dig möjlighet att testa om och om igen dina kunskaper.\r\n \r\nOm du skulle vilja se se synonimer till det ordet som ska översättas kan du trycka på själva ordet eller på den lilla grå pilen som du finner på högra sidan av rutan. Därifrån kommer du att skickas vidare till en webbsida där du kan se synomnier till det ordet som skulle översättas."
        TextView.textColor = UIColor.blackColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
 

}
