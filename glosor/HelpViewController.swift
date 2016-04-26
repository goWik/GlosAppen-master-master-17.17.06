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
    
    
    var settingsAppLanguageUppdate:String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpHelpInfo()
        print(settingsAppLanguageUppdate)
        TextView.textColor = UIColor.whiteColor()
    }
    
    func setUpHelpInfo(){
        if settingsAppLanguageUppdate == "Svenska" || settingsAppLanguageUppdate == nil {
            TextView.text = "\r\nI denna Glosapp kan du skapa flera gloslistor genom att välja alternativet SKAPA.\r\nEn gloslista består av två språk och ett obegränsat antal ord. Du kan redigera dina gloslistor genom att ta bort, lägga till eller ändra dina glosor. Efter du har skapat en gloslista och tryckt på KLAR skickas du vidare till dina gloslistor. Därifrån kan du ta bort den befintliga gloslistan eller dela den: skicka som sms/mejl, lägga till i anteckningar eller använda andra tjänster som är tillgänliga på din enhet.\r\nFÖRHÖRSMETODER: För att välja mellan olika förhörssätt behöver du trycka på just den gloslistan du vill bli förhörd i. När du väl väljer ett av förhörsätten ska du skriva in det översatta ordet i den tomma rutan. När du känner dig klar finner du två knappar längst ner: GÖR OM och RÄTTA.\r\nRÄTTA knappen rättar dina svar. Om det översatta ordet stämmer overens med det ordet som du har översatt kommer du att se en grön bock. Om ingen grön bock visas betyder det att du kan försöka igen.\r\nGÖR OM knappen ger dig möjlighet att dina kunskaper testa om och om igen.\r\n \r\nOm du skulle vilja se synonymer till det ordet som ska översättas kan du trycka på själva ordet eller på den lilla grå pilen som du finner på högra sidan av rutan. Därifrån kommer du att skickas vidare till en webbsida där du kan se synonymer till det ordet som skulle översättas."
        }
        if settingsAppLanguageUppdate == "English" {
            print(settingsAppLanguageUppdate)
            TextView.text = "In this Glosapp you can create a vocabulary lists by choosing the alternative Create. A vocabulary list is composed of two languages ​​and an unlimited number of words. You can edit your vocabulary lists by deleting, adding or changing your words. After you have created a vocabulary list and pressing DONE you will be forwarded to your vocabulary lists. From there, you can remove the existing lists or share them: send as SMS / email, add to notes or use other apps that are available on your device. PRACTICE METHODS: To choose between different practice methods, you press on the list you want to practice on. Once you select one of the practice methods, enter the translated word in the empty box. When you feel ready, you will find two buttons at the bottom: REDO and CORRECT. the CORRECT button corrects your answers. If the translated word matches the word you have translated, you will see a green check mark. No green checkmark means that you can try again. The REDO button allows you to test your skills again and again. If you would like to see synonyms of the word to be translated, you can tap the word itself or the small gray arrow located on the right side of the box. From there you will be redirected to a Web page where you can see the synonyms for the word to be translated."
        }
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
 

}
