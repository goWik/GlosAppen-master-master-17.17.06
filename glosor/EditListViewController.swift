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
    
    //elements:
    @IBOutlet weak var TextFiledListName: UITextField!
    
    @IBOutlet weak var ButtonAddOutlet: UIButton!
    
    @IBOutlet weak var TextFieldLanguage1:UITextField!
    
    @IBOutlet weak var TextFieldLaungage2: UITextField!
    
    @IBOutlet weak var TextFieldWord1: UITextField!
    
    @IBOutlet weak var TextFieldWord2: UITextField!
   
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var updateList: UIBarButtonItem!
    
    
    var AllaGlosListorArray:ListDescribe?
    
    var delegate:ListViewController?
    
    var delegateToSelectQuizTypeViewController: SelectQuizTypeViewController?
    
    var glosArray:[Lista] = []
    
    var createObjglosa:Lista = Lista(word1: "ord1", word2: "ord2")
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        title = "redigera"
            
        //formaterar button----
        ButtonAddOutlet.layer.cornerRadius = 8
        ButtonAddOutlet.layer.borderWidth = 1
        ButtonAddOutlet.layer.borderColor = myColor.CGColor
        
        //-- linjer--
        formated_TextFiled()
        formeted_TextFieldLaungage1()
        formeted_TextFieldLaungage2()
        formated_TextFieldWord1()
        formated_TextFieldWord2()
        TextFieldLanguage1.layer.masksToBounds = true
        TextFieldLaungage2.layer.masksToBounds = true
        TextFieldWord1.layer.masksToBounds = true
        TextFieldWord2.layer.masksToBounds = true
        
        self.TextFiledListName.delegate = self
        self.TextFieldLanguage1.delegate = self
        self.TextFieldLaungage2.delegate = self
        self.TextFieldWord1.delegate = self
        self.TextFieldWord2.delegate = self
            
        self.setStatiskaDelar()
        TableView.reloadData()
    }
    
    
    
    func formated_TextFiled(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: TextFiledListName.frame.size.height - width, width:TextFiledListName.frame.size.width, height: TextFiledListName.frame.size.height)
        border.borderWidth = width
        TextFiledListName.layer.addSublayer(border)
    }
    
    func formeted_TextFieldLaungage1(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: TextFieldLanguage1.frame.size.height - width, width: TextFieldLanguage1.frame.size.width, height: TextFieldLanguage1.frame.size.height)
        border.borderWidth = width
       TextFieldLanguage1.layer.addSublayer(border)
    }
    
    func formeted_TextFieldLaungage2(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: TextFieldLaungage2.frame.size.height - width, width: TextFieldLaungage2.frame.size.width, height: TextFieldLaungage2.frame.size.height)
        border.borderWidth = width
        TextFieldLaungage2.layer.addSublayer(border)
    }
    
    func formated_TextFieldWord1(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: TextFieldWord1.frame.size.height - width, width:  TextFieldWord1.frame.size.width, height: TextFieldWord1.frame.size.height)
        border.borderWidth = width
        TextFieldWord1.layer.addSublayer(border)
    }
    
    func formated_TextFieldWord2(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: TextFieldWord2.frame.size.height - width, width:  TextFieldWord2.frame.size.width, height: TextFieldWord2.frame.size.height)
        border.borderWidth = width
        TextFieldWord2.layer.addSublayer(border)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //FUNc. som fäljer PROTOKOLL: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (AllaGlosListorArray?.glosListorArray.count)!
 
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //sätter gammalt data till elemnts som ska visas när vyn laddas
    func setStatiskaDelar(){
        TextFiledListName.text = AllaGlosListorArray!.name
        TextFieldLanguage1.text = AllaGlosListorArray!.language1
        TextFieldLaungage2.text = AllaGlosListorArray!.language2
        TableView.reloadData()
    }
    
    
    //formeterar custom cellen
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellEditList", forIndexPath: indexPath) as! CustomCellEditListTableViewCell
       
        //sättter gammalt data i cellen
        cell.LabelLanguage1.text  = AllaGlosListorArray!.language1
        cell.LabelLanguage2.text = AllaGlosListorArray!.language2
            
        //ska utföras...
        cell.LabelLanguage1.text = TextFieldLanguage1.text
        cell.LabelLanguage2.text = TextFieldLaungage2.text
        
        //sätt till språken oberånde om de ändras eler ej
       //dynamiska word1, word2
        cell.TextFiledWord1.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word1
        cell.TextFiledWord2.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word2
       
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        TextFiledListName.resignFirstResponder()
        TextFieldLanguage1.resignFirstResponder()
        TextFieldLaungage2.resignFirstResponder()
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
    
    
    //action add obj---------
    @IBAction func ButtonAddGlosObj(sender: UIButton) {
        
        TextFieldWord1.text! = TextFieldWord1.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        TextFieldWord2.text! = TextFieldWord2.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        //SKAPAR ETT OBJEKT VID KNAPPTRYCK ---LÄGG TILL---------------
         if TextFieldWord1.text! != "" && TextFieldWord2.text! != "" && TextFieldLanguage1.text! != "" && TextFieldLaungage2.text! != "" {
            let glosaObj:Lista = createObjglosa.createGlosObj(TextFieldWord1.text!, word2: TextFieldWord2.text!)
            AllaGlosListorArray!.glosListorArray.append(glosaObj)
           print(" från add obj: \(AllaGlosListorArray!.glosListorArray)")

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
            let listDescribeObj = ListDescribe(name: TextFiledListName.text!, language1:TextFieldLanguage1.text!, language2:TextFieldLaungage2.text!, glosListorArray: AllaGlosListorArray!.glosListorArray)
            
              print("namn: \(listDescribeObj.name), språk1: \(listDescribeObj.language1), språk2: \(listDescribeObj.language2), glosListaArray: :\(listDescribeObj.glosListorArray)")
            
            delegate?.addObjPropertyToArray(listDescribeObj)//körs från listViewController
                       
        }
        TableView.reloadData()
 
        navigationController?.popViewControllerAnimated(true)
    }
    
}
