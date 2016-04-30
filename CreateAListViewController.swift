//
//  CreateAListViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-17.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CreateAListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    //MARK: ELEMENTS
    @IBOutlet weak var TextFieldListName: UITextField!
    
    @IBOutlet weak var TextFieldLanguage1: UITextField!
    
    @IBOutlet weak var TextFieldLabelLanguage2: UITextField!
    
    @IBOutlet weak var TextFieldWord1: UITextField!
    
    @IBOutlet weak var TextFieldWord2: UITextField!
    
    @IBOutlet weak var ButtonAddToListOutlet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var SaveOutlet: UIBarButtonItem!
    
    
    var delegateListViewController:ListViewController?
    
    let helperStruct:HelperStruct = HelperStruct()
    
    var myformattedClassElements:MyformattedClassElements = MyformattedClassElements()
    
    var glosArray:[Lista] = []
    
    var cells:[CreateCustomCellListTableViewCell] = []
    
    var settingsAppLanguageUppdate:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSettingsAppLanguage()
        self.myformattedClassElements.Button_formattedSmallButton(ButtonAddToListOutlet)
        self.TextFieldLanguage1.delegate = self
        self.TextFieldListName.delegate = self
        self.TextFieldLabelLanguage2.delegate = self
        self.TextFieldWord1.delegate = self
        self.TextFieldWord2.delegate = self
        self.myformattedClassElements.formatted_TextField(TextFieldListName)
        self.myformattedClassElements.formatted_TextField(TextFieldLanguage1)
        self.myformattedClassElements.formatted_TextField(TextFieldLabelLanguage2)
        self.myformattedClassElements.formatted_TextField(TextFieldWord1)
        self.myformattedClassElements.formatted_TextField(TextFieldWord2)
        tableView.reloadData()
    }
    
    //MARK: SET UP SETTINGS APPLanguage
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" {
            title = "skapa listan"
            SaveOutlet.title = "klar"
            ButtonAddToListOutlet.setTitle("lägg till", forState: .Normal)
            TextFieldListName.placeholder = "namn på din lista"
            TextFieldLanguage1.placeholder = "språk1"
            TextFieldLabelLanguage2.placeholder = "språk2"
            TextFieldWord1.placeholder = "ord1"
            TextFieldWord2.placeholder = "ord2"
        }
        if settingsAppLanguageUppdate == "English"{
            title = "create list"
            SaveOutlet.title = "done"
            ButtonAddToListOutlet.setTitle("add", forState: .Normal)
            TextFieldListName.placeholder = "list name"
            TextFieldLanguage1.placeholder = "language1"
            TextFieldLabelLanguage2.placeholder = "language2"
            TextFieldWord1.placeholder = "word1"
            TextFieldWord2.placeholder = "word2"
        }
    }
    
    
    //MARK: TextField
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        TextFieldLanguage1.resignFirstResponder()
        TextFieldListName.resignFirstResponder()
        TextFieldLabelLanguage2.resignFirstResponder()
        TextFieldWord1.resignFirstResponder()
        TextFieldWord2.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: PROTOCOLS FUNCKTIONS
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return glosArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //MARK: CUSTOM CELL
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellList", forIndexPath: indexPath) as! CreateCustomCellListTableViewCell
        
        //till statiska elements: språk
        cell.LabelLanguage1.text = "\(TextFieldLanguage1.text!)"
        cell.LabelLanguage2.text = "\(TextFieldLabelLanguage2.text!)"
        
        //dynamiska: word1, word2
        cell.LabelWord1.text = "\(glosArray[indexPath.row].word1)"
        cell.LabelWord2.text = "\(glosArray[indexPath.row].word2)"
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            self.glosArray.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    
    //MARK: ACTIONS
    @IBAction func ButtonAddObject(sender: UIButton) {
        
        TextFieldWord1.text! = TextFieldWord1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldWord2.text! = TextFieldWord2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if TextFieldWord1.text! != "" && TextFieldWord2.text! != "" && TextFieldLanguage1.text! != "" && TextFieldLabelLanguage2.text! != "" {
            
            //ett obj. skapas vid action ButtonAddObject
            let glosaObj:Lista = Lista(word1: TextFieldWord1.text!, word2: TextFieldWord2.text!)
            glosArray.append(glosaObj)
            print("glosArray: \(glosArray)")
            
        } else {
            let alert = UIAlertController(title: "alert", message: "Kontrollera om alla fälten är fyllda. Namnet på din gloslista, Ord1 och Ord2", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        // begränsning av 10 ord
        if glosArray.count >= 10 {
            let alert = UIAlertController(title: "alert", message: "Du kan skapa en lista med 10 ord", preferredStyle: UIAlertControllerStyle.Alert )
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(action) in
                
                self.ButtonSaveAction(self.SaveOutlet)
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        TextFieldWord1.text = ""
        TextFieldWord2.text = ""
        tableView.reloadData()
        
    }
    
    //MARK: hela glosListan sparas
    @IBAction func ButtonSaveAction(sender: UIBarButtonItem) {
        
        //blanka tecken i inputen tas bort
        TextFieldListName.text! = TextFieldListName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldLabelLanguage2.text! = TextFieldLabelLanguage2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldLanguage1.text! = TextFieldLanguage1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        
        if glosArray.count > 0 && TextFieldListName.text != "" {
            
            //SKAPAR OBJ VID KNAPPTYCKET OCH SKICKAR OBJ TILL FÖREGÅNDE VYN-------
            let listDescribeObj = ListDescribe(name: TextFieldListName.text!, language1:TextFieldLanguage1.text!, language2:TextFieldLabelLanguage2.text!, glosListorArray: glosArray)
            
            print("namn: \(listDescribeObj.name), språk1: \(listDescribeObj.language1), språk2: \(listDescribeObj.language2), glosListaArray: :\(listDescribeObj.glosListorArray)")
            
            delegateListViewController?.addObjPropertyToArray(listDescribeObj)//kör func från klassen ListViewController då listDescribeObj läggs till i AllaGloslitorArrayen
            
            
        } else {
            let alert = UIAlertController(title: "alert", message: "Kontrollera om alla fälten är fyllda. Namnet på din gloslista, Ord1 och Ord2", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)//går till föregånde vyn
    }
    
}








