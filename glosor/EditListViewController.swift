//
//  EditListViewController.swift
//  glosor
//
//  Created by gm on 2016-03-26.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//


//ska/kan redigeras då användaren klickar på uppdatera listan
 //språken kan redigeras genom att skriva på nytt i fältet uppe, sedna klickars på lägg till, det ska uppdateras automiatskt i alla celler
 //nya ord ska läggas till i listan genom att skriva in de i resekive fälten och klickas på "lägg till"

import UIKit

class EditListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    //:MARK ELEMENTS
    @IBOutlet weak var TextFiledListName: UITextField!
    
    @IBOutlet weak var ButtonAddOutlet: UIButton!
    
    @IBOutlet weak var TextFieldLanguage1:UITextField!
    
    @IBOutlet weak var TextFieldLanguage2: UITextField!
    
    @IBOutlet weak var TextFieldWord1: UITextField!
    
    @IBOutlet weak var TextFieldWord2: UITextField!
   
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var updateList: UIBarButtonItem!
    
    
    var AllaGlosListorArray:ListDescribe?
    
    var delegate:ListViewController?
    
    var delegateToSelectQuizTypeViewController: SelectQuizTypeViewController?
    
    var glosArray:[Lista] = []
    
    
    var settingsAppLanguageUppdate:String?
    
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSettingsAppLanguage()
            
        //Formatterar button----
        ButtonAddOutlet.layer.cornerRadius = 8
        ButtonAddOutlet.layer.borderWidth = 1
        ButtonAddOutlet.layer.borderColor = myColor.CGColor
        
        //-- linjer--
        self.formated_TextFiled(TextFiledListName)
        self.formated_TextFiled(TextFieldLanguage1)
        self.formated_TextFiled(TextFieldLanguage2)
        self.formated_TextFiled(TextFieldWord1)
        self.formated_TextFiled(TextFieldWord2)

        self.TextFiledListName.delegate = self
        self.TextFieldLanguage1.delegate = self
        self.TextFieldLanguage2.delegate = self
        self.TextFieldWord1.delegate = self
        self.TextFieldWord2.delegate = self
        
        self.setStatiskaDelar()
        TableView.reloadData()
    }
    
    
    
    func formated_TextFiled(textField:UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.blackColor()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //:MARK PROTKOLS FUNCKTIONS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (AllaGlosListorArray?.glosListorArray.count)!
 
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK: SET UP SETTINGS APPLanguage
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" {
            title = "redigera listan"
            updateList.title = "uppdatera"
            ButtonAddOutlet.setTitle("lägg till", forState: .Normal)
            TextFiledListName.placeholder = "namn på din lista"
            TextFieldLanguage1.placeholder = "språk1"
            TextFieldLanguage2.placeholder = "språk2"
            TextFieldWord1.placeholder = "ord1"
            TextFieldWord2.placeholder = "ord2"

        }
        if settingsAppLanguageUppdate == "English"{
            title = "edit list"
            updateList.title = "update"
            ButtonAddOutlet.setTitle("add", forState: .Normal)
            TextFiledListName.placeholder = "list name"
            TextFieldLanguage1.placeholder = "Language1"
            TextFieldLanguage2.placeholder = "Language2"
            TextFieldWord1.placeholder = "word1"
            TextFieldWord2.placeholder = "word2"
        }
        if settingsAppLanguageUppdate == "Polska" {
            title = "redaguj slowka"
            updateList.title = "odnow"
            ButtonAddOutlet.setTitle("dodaj", forState: .Normal)
            TextFiledListName.placeholder = "nazwa listy"
            TextFieldLanguage1.placeholder = "jezyk1"
            TextFieldLanguage2.placeholder = "jezyk2"
            TextFieldWord1.placeholder = "slowo1"
            TextFieldWord2.placeholder = "slowo2"
        }
    }
    
    
    //sätter gammalt data till elemnts som ska visas när vyn laddas
    func setStatiskaDelar(){
        TextFiledListName.text = AllaGlosListorArray!.name
        TextFieldLanguage1.text = AllaGlosListorArray!.language1
        TextFieldLanguage2.text = AllaGlosListorArray!.language2
        TableView.reloadData()
    }
    
    
    //:MARK CUSTOM CELL
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellEditList", forIndexPath: indexPath) as! CustomCellEditListTableViewCell
       
        //sättter gammalt data i cellen
        cell.LabelLanguage1.text  = AllaGlosListorArray!.language1
        cell.LabelLanguage2.text = AllaGlosListorArray!.language2
            
        cell.LabelLanguage1.text = TextFieldLanguage1.text
        cell.LabelLanguage2.text = TextFieldLanguage2.text
        
        //sätt till språken oberånde om de ändras eler ej
        //dynamiska word1, word2
        cell.TextFiledWord1.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word1
        cell.TextFiledWord2.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word2
       
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        TextFiledListName.resignFirstResponder()
        TextFieldLanguage1.resignFirstResponder()
        TextFieldLanguage2.resignFirstResponder()
        TextFieldWord1.resignFirstResponder()
        TextFieldWord2.resignFirstResponder()
        
        return true
    }
    
    
    //tar bort cellen
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
                self.AllaGlosListorArray!.glosListorArray.removeAtIndex(indexPath.row)
                self.TableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        }
    
    
    //:MARK ACTIONS
    @IBAction func ButtonAddGlosObj(sender: UIButton) {
        
        TextFieldWord1.text! = TextFieldWord1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldWord2.text! = TextFieldWord2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        //SKAPAR ETT OBJEKT VID KNAPPTRYCK ---LÄGG TILL---------------
         if TextFieldWord1.text! != "" && TextFieldWord2.text! != "" && TextFieldLanguage1.text! != "" && TextFieldLanguage2.text! != "" {
            
            let glosaObj:Lista = Lista(word1: TextFieldWord1.text!, word2: TextFieldWord2.text!)
            AllaGlosListorArray!.glosListorArray.append(glosaObj)
            
         } else {
            let alert = UIAlertController(title: "alert", message: "Kontrollera om alla fälten är fyllda. Namnet på din gloslista, Ord1 och Ord2", preferredStyle: UIAlertControllerStyle.Alert)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
              self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if AllaGlosListorArray!.glosListorArray.count >= 10 {
            let alert = UIAlertController(title: "alert", message: "Du kan skapa en lista med 10 ord", preferredStyle: UIAlertControllerStyle.Alert )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) in
                
                self.ButtonUpdateListAction(self.updateList)//körs då 10 ord är ifylda
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        TextFieldWord1.text = ""
        TextFieldWord2.text = ""
        TableView.reloadData()
    }
    
    

    @IBAction func ButtonUpdateListAction(sender: UIBarButtonItem) {
    
        if AllaGlosListorArray!.glosListorArray.count > 0 && TextFiledListName.text! != "" {
            
            //SKAPAR OBJ VID KANPTYCKET OCH SKICKAR OBJ TILL NÄSTA VYN-------
            let listDescribeObj = ListDescribe(name: TextFiledListName.text!, language1:TextFieldLanguage1.text!, language2:TextFieldLanguage2.text!, glosListorArray: AllaGlosListorArray!.glosListorArray)
            
             // print("namn: \(listDescribeObj.name), språk1: \(listDescribeObj.language1), språk2: \(listDescribeObj.language2), glosListaArray: :\(listDescribeObj.glosListorArray)")
            
            delegate?.addObjPropertyToArray(listDescribeObj)//körs från listViewController
         }
        TableView.reloadData()
 
        navigationController?.popViewControllerAnimated(true) //skickas till föregånde vyn
    }
    
}
