//
//  QuizTestType12ViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-23.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class QuizTestType12ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
//elemnets language
    @IBOutlet weak var ButtonShowAnswerOutlet: UIButton!
    
    @IBOutlet weak var ButtonRedoOutlet: UIButton!

    @IBOutlet weak var TabelView: UITableView!
    
    @IBOutlet weak var VCname: UIBarButtonItem!
  
    
    var delegerare:SelectQuizTypeViewController?
    
    var AllaGlosListorArray:ListDescribe?
    
    var cells:[CustomCellQuizType12TableViewCell] = []
    
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ButtonShowAnswerOutlet.layer.cornerRadius = 8
        ButtonShowAnswerOutlet.layer.borderWidth = 1
        ButtonShowAnswerOutlet.layer.borderColor = myColor.CGColor
        
        ButtonRedoOutlet.layer.cornerRadius = 8
        ButtonRedoOutlet.layer.borderWidth = 1
        ButtonRedoOutlet.layer.borderColor = myColor.CGColor
        
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(QuizTestType12ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(QuizTestType12ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (AllaGlosListorArray?.glosListorArray.count)!
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = TabelView.dequeueReusableCellWithIdentifier("CustomCellQuizTest12", forIndexPath: indexPath) as! CustomCellQuizType12TableViewCell
        
        //sätter till ord1 och användaren översätter order1 till språk2
        cell.WordToTranslate.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word1
        
        if cells.count < AllaGlosListorArray?.glosListorArray.count {
            cells.append(cell)//lägg till celler i arragen bara förta gången func. körs
        }
        if cells.count >= 0 {
            print("lägg ej flera celler")
        }
        
        ButtonShowAnswerOutlet.addTarget(self, action: #selector(QuizTestType12ViewController.ButtonShowAnswerAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return  cell
        
    }
    
    //keyboard ------
    func adjustForKeyboard(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        
        if notification.name == UIKeyboardWillHideNotification {
            TabelView.contentInset = UIEdgeInsetsZero
        } else {
            TabelView .contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
      TabelView .scrollIndicatorInsets = TabelView.contentInset
    }
    
    
    func ButtonShowAnswerAction(sender:UIButton) {

        var i = 0
        for cell in cells {

            cell.TheTranslatedWord.text! = cell.TheTranslatedWord.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            
            if AllaGlosListorArray!.glosListorArray[i].word2.caseInsensitiveCompare(cell.TheTranslatedWord.text!) == .OrderedSame {
               cell.ImageToShowResults.hidden = false //om orden stämmer visar upp checkmark
                
            } else {
                cell.ImageToShowResults.hidden = true //om orden stämmer visar upp checkmark
                print("fel")
            }
            print("\(AllaGlosListorArray!.glosListorArray[i].word2), \(cell.TheTranslatedWord.text)")
            i+=1
           }
    
    
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowSynonim" {
            let VC = segue.destinationViewController as? SynonimViewController
            if let cell = sender as? UITableViewCell {
                if let indexPath = TabelView.indexPathForCell(cell) {
                    //skickar ordet som ska sökas synonim till->
                    
                    VC?.synonimWord = String(AllaGlosListorArray!.glosListorArray[indexPath.row].word1)
                    
                }
            }
        }
    }

    @IBAction func ButtonRodoAction(sender: UIButton) {
        for cell in cells {
            cell.TheTranslatedWord.text = ""
            cell.ImageToShowResults.hidden = true
        }
    }
    
 
}
