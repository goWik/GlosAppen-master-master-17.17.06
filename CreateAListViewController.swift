//
//  CreateAListViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-17.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

/* i klassen ska:
- skapas en Objglosa med sina egenskaper (word1,word2)
- objGlosa ska läggas till i en array med samma datatyp som objGlosa
- Objglosa ska skapas och läggas till i arraygen vid knapptrycket (action) "lägg till" ADD
- skapar ett till obj med egenskaper (name, language1, language2, array (som innehåller objglosor)
 -skapar detta yttre obj vid knapprycket på KLAR-save, då ska också detta obj skickas till föregånde vy med allt sitt innehåll
 - på förra vyn: ListView ska data uppdateras och func. som körs vis knaprycket save ska lägga till det skickade obj i en array som ska innehålla alla glosListor (därifån kan sedan datan manipuleras)
 - ta bort vita tecken
 */

import UIKit

class CreateAListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    //protokollen: UITableViewDataSource, UITableViewDelegate
    
    
    //:MARK ELEMENTS
    @IBOutlet weak var TextFiledListName: UITextField!
    
    @IBOutlet weak var TextFieldLanguage1: UITextField!
    
    @IBOutlet weak var TextFiledLabelLanguage2: UITextField!
    
    @IBOutlet weak var TextFieldWord1: UITextField!
    
    @IBOutlet weak var TextFieldWord2: UITextField!
    
    @IBOutlet weak var ButtonAddToListOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var SaveOutlet: UIBarButtonItem!
    
    
  
    let helperStruct:HelperStruct = HelperStruct()
    
    var glosArray:[Lista] = [] //här läggs det till objGlosa-objekt

    
    var delegateListViewController:ListViewController?
    
    
    var cells:[CreateCustomCellListTableViewCell] = []
    
    
    var settingsAppLanguageUppdate:String?
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSettingsAppLanguage()
        
        ButtonAddToListOutlet.layer.cornerRadius = 8
        ButtonAddToListOutlet.layer.borderWidth = 1
        ButtonAddToListOutlet.layer.borderColor = myColor.CGColor
        
        self.TextFieldLanguage1.delegate = self
        self.TextFiledListName.delegate = self
        self.TextFiledLabelLanguage2.delegate = self
        self.TextFieldWord1.delegate = self
        self.TextFieldWord2.delegate = self
        
        formated_TextFiled(TextFiledListName)
        formated_TextFiled(TextFieldLanguage1)
        formated_TextFiled(TextFiledLabelLanguage2)
        formated_TextFiled(TextFieldWord1)
        formated_TextFiled(TextFieldWord2)
  
        tableView.reloadData()
    }
    
    //MARK: SET UP SETTINGS APPLanguage
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" {
            title = "skapa listan"
            SaveOutlet.title = "klar"
            ButtonAddToListOutlet.setTitle("lägg till", forState: .Normal)
            TextFiledListName.placeholder = "namn på din lista"
            TextFieldLanguage1.placeholder = "språk1"
            TextFiledLabelLanguage2.placeholder = "språk2"
            TextFieldWord1.placeholder = "ord1"
            TextFieldWord2.placeholder = "ord2"
            
        }
        if settingsAppLanguageUppdate == "English"{
            title = "create list"
            SaveOutlet.title = "done"
            ButtonAddToListOutlet.setTitle("add", forState: .Normal)
            TextFiledListName.placeholder = "list name"
            TextFieldLanguage1.placeholder = "Language1"
            TextFiledLabelLanguage2.placeholder = "Language2"
            TextFieldWord1.placeholder = "word1"
            TextFieldWord2.placeholder = "word2"
        }
        if settingsAppLanguageUppdate == "Polska" {
            title = "utwoz liste"
            SaveOutlet.title = "gotowe"
            ButtonAddToListOutlet.setTitle("dodaj", forState: .Normal)
            TextFiledListName.placeholder = "nazwa listy"
            TextFieldLanguage1.placeholder = "jezyk1"
            TextFiledLabelLanguage2.placeholder = "jezyk2"
            TextFieldWord1.placeholder = "slowo1"
            TextFieldWord2.placeholder = "slowo2"
        }
    }
   
    
    
   
    //MARK: MY FORMAED TEXTFIELD
    func formated_TextFiled(textField:UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        textField.layer.masksToBounds = true
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.blackColor()
    }
    
    
    //:MARK TEXTFILED
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        TextFieldLanguage1.resignFirstResponder()
        TextFiledListName.resignFirstResponder()
        TextFiledLabelLanguage2.resignFirstResponder()
        TextFieldWord1.resignFirstResponder()
        TextFieldWord2.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
    
    //:MARK PROTOKOLS FUNCKTIONS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return glosArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //:MARK CUSTOM CELL
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellList", forIndexPath: indexPath) as! CreateCustomCellListTableViewCell
 
        //till statiska elemnets: språk
        cell.LabelLanguage1.text = "\(TextFieldLanguage1.text!)"
        cell.LabelLanguage2.text = "\(TextFiledLabelLanguage2.text!)"
        
        //dynamiska: word1, word2
        cell.LabelWord1.text = "\(glosArray[indexPath.row].word1)"
        cell.LabelWord2.text = "\(glosArray[indexPath.row].word2)"
       
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //cellen tas bort
        if editingStyle == .Delete { //enum:  .Delate
         self.glosArray.removeAtIndex(indexPath.row)
         self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    //:MARK ACTIONS
    @IBAction func ButtonAddObject(sender: UIButton) {
        
        TextFieldWord1.text! = TextFieldWord1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldWord2.text! = TextFieldWord2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
       if TextFieldWord1.text! != "" && TextFieldWord2.text! != "" && TextFieldLanguage1.text! != "" && TextFiledLabelLanguage2.text! != "" {
           
            //SKAPAR ETT OBJEKT VID KNAPPTRYCK ---LÄGG TILL---------------
            let glosaObj:Lista = Lista(word1: TextFieldWord1.text!, word2: TextFieldWord2.text!)
            glosArray.append(glosaObj)
        print(glosArray)
        
       } else {
        let alert = UIAlertController(title: "alert", message: "Kontrollera om alla fälten är fyllda. Namnet på din gloslista, Ord1 och Ord2", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        }
        

        //ALERT FÖR BEGRESNING AV 10 ORD-----
          if glosArray.count >= 10 {
                let alert = UIAlertController(title: "alert", message: "Du kan skapa en lista med 10 ord", preferredStyle: UIAlertControllerStyle.Alert )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) in
                    
                self.ButtonSaveAction(self.SaveOutlet)//körs då 10 ord är ifylda
            }))
           
            self.presentViewController(alert, animated: true, completion: nil)
        }
        TextFieldWord1.text = ""
        TextFieldWord2.text = ""
        tableView.reloadData()
        
        }

    // aktion för spara hela listan och skicka till föregånde vy där listan läggs till i "AllaGloListorArragen"
    @IBAction func ButtonSaveAction(sender: UIBarButtonItem) {
        
        //blanka tecken i inputen tas bort
        TextFiledListName.text! = TextFiledListName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFiledLabelLanguage2.text! = TextFiledLabelLanguage2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldLanguage1.text! = TextFieldLanguage1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
       
        
        if glosArray.count > 0 && TextFiledListName.text != "" {
                                  
        //SKAPAR OBJ VID KANPTYCKET OCH SKICKAR OBJ TILL FÖREGÅNDE VYN-------
            let listDescribeObj = ListDescribe(name: TextFiledListName.text!, language1:TextFieldLanguage1.text!, language2:TextFiledLabelLanguage2.text!, glosListorArray: glosArray)
            
            print("namn: \(listDescribeObj.name), språk1: \(listDescribeObj.language1), språk2: \(listDescribeObj.language2), glosListaArray: :\(listDescribeObj.glosListorArray)")
            
         delegateListViewController?.addObjPropertyToArray(listDescribeObj)//kör func från klassen ListViewController då listDescribeObj läggs till i AllaGloslitorArrayen
            print("skdekjdfjbfgfsh")
            
        } else {
        let alert = UIAlertController(title: "alert", message: "Kontrollera om alla fälten är fyllda. Namnet på din gloslista, Ord1 och Ord2", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)//går till föregånde vyn
    }
 
}








