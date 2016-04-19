//
//  QuizTestMixedViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-25.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class QuizTestMixedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

 
    @IBOutlet weak var ButtonShowAnswerOutlet: UIButton!
    
    @IBOutlet weak var ButtonRedoOutlet: UIButton!
    
    @IBOutlet weak var TabelView: UITableView!
    
    @IBOutlet weak var VCName: UINavigationItem!
 
    
    var delegerare:SelectQuizTypeViewController?
    
    var AllaGlosListorArray:ListDescribe?
    
     var cells:[CustomCellQuizTestMixedTableViewCell] = []
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        VCName.title = "blandat:\(AllaGlosListorArray!.language1), \(AllaGlosListorArray!.language2)"
        
        ButtonRedoOutlet.layer.cornerRadius = 6
        ButtonRedoOutlet.layer.borderWidth = 1
        ButtonRedoOutlet.layer.borderColor = myColor.CGColor
        
        ButtonShowAnswerOutlet.layer.cornerRadius = 6
        ButtonShowAnswerOutlet.layer.borderWidth = 1
        ButtonShowAnswerOutlet.layer.borderColor = myColor.CGColor
        

        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector( QuizTestMixedViewController.adjustForKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector( QuizTestMixedViewController.adjustForKeyboard(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    
    
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
        
        let cell = TabelView.dequeueReusableCellWithIdentifier("CellQuizTypeMixed", forIndexPath: indexPath) as! CustomCellQuizTestMixedTableViewCell
        
        
        if cells.count < AllaGlosListorArray?.glosListorArray.count {
            cells.append(cell)//lägg till celler i arragen bara första gången func. körs
        }
        if cells.count >= 0 {
            print("lägg ej flera celler")
        }
        

        //sätter till ord1
        cell.WordToTranslate.text = (AllaGlosListorArray!.glosListorArray[indexPath.row].word2)
       // cell.TextFiledWord1.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word1
        
        
        ButtonShowAnswerOutlet.addTarget(self, action: #selector(QuizTestMixedViewController.ButtonShowAnswer(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        

        return cell
    }
 
    func ButtonShowAnswer(sender:UIButton) {
        
        var i = 0
        for cell in cells {
            
            cell.TheTranslatedWord.text! = cell.TheTranslatedWord.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            
            if AllaGlosListorArray!.glosListorArray[i].word1.caseInsensitiveCompare(cell.TheTranslatedWord.text!) == .OrderedSame {
                cell.ImageToShowResults.hidden = false
            } else {
                cell.ImageToShowResults.hidden = true
            }
            print("\(AllaGlosListorArray?.glosListorArray[i].word2) , \(cell.TheTranslatedWord.text)")
            i+=1
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowSynonim" {
            let VC = segue.destinationViewController as? SynonimViewController
            if let cell = sender as? UITableViewCell {
                if let indexPath = TabelView.indexPathForCell(cell) {
                 VC?.synonimWord = String(AllaGlosListorArray!.glosListorArray[indexPath.row].word1)
                    }
            }
        }
    }
    
    @IBAction func ButtonRedoAction(sender: UIButton) {
        for cell in cells {
            cell.TheTranslatedWord.text! = ""
            cell.ImageToShowResults.hidden = true
        }
    }
   

}
