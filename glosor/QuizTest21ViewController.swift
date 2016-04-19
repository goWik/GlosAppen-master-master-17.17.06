//
//  QuizTest21ViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-25.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class QuizTest21ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {
    
    //elemnts:
    @IBOutlet weak var ButtonShowAnswerOutlet: UIButton!
    
    @IBOutlet weak var ButtonRedoOutlet: UIButton!
  
    @IBOutlet weak var TabelView: UITableView!
    
    @IBOutlet weak var VCName: UINavigationItem!
    
    
    var delegerare:SelectQuizTypeViewController?

    var AllaGlosListorArray:ListDescribe?
    
    var cells:[CustomCellQuizTest21TableViewCell] = []
    
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        VCName.title = "\(AllaGlosListorArray!.language2)-\(AllaGlosListorArray!.language1)"
        ButtonShowAnswerOutlet.layer.cornerRadius = 8
        ButtonShowAnswerOutlet.layer.borderWidth = 1
        ButtonShowAnswerOutlet.layer.borderColor = myColor.CGColor
        
        ButtonRedoOutlet.layer.cornerRadius = 8
        ButtonRedoOutlet.layer.borderWidth = 1
        ButtonRedoOutlet.layer.borderColor = myColor.CGColor
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(QuizTest21ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(QuizTest21ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)

        TabelView.delegate = self
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
        
        let cell = TabelView.dequeueReusableCellWithIdentifier("CellQuizType21", forIndexPath: indexPath) as! CustomCellQuizTest21TableViewCell
        
        
        if cells.count < AllaGlosListorArray?.glosListorArray.count {
            cells.append(cell)
        }
        if cells.count >= 0 {
            print("lägg ej flera celler")
        }
        
        //från språk 2  till språk 1,användaren anger ordet språk2
        cell.WordToTranslate.text = AllaGlosListorArray!.glosListorArray[indexPath.row].word2
        
        //fun ska köras när jag trycker på knappen "ButtonRätta"------------
        ButtonShowAnswerOutlet.addTarget(self, action: #selector(QuizTest21ViewController.ButtonShowAnswer(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowSynonim" {
            let VC = segue.destinationViewController as? SynonimViewController
            if let cell = sender as? UITableViewCell {
                if let indexPath = TabelView.indexPathForCell(cell) {
                    //skickar ordet som ska sökas synonim till->
                    
                    VC?.synonimWord = String(AllaGlosListorArray!.glosListorArray[indexPath.row].word2)
                }
            }
        }

    }
    

    func ButtonShowAnswer(sender:UIButton) {
        
        var i = 0
        for cell in cells {
  
            cell.TheTranslatedWord.text! = cell.TheTranslatedWord.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            
            if AllaGlosListorArray!.glosListorArray[i].word1.caseInsensitiveCompare(cell.TheTranslatedWord.text!) == .OrderedSame {

              cell.ImageToShow.hidden = false
            } else {
                cell.ImageToShow.hidden = true
                print("fel")
            }
            print("\(AllaGlosListorArray!.glosListorArray[i].word1) , \(cell.TheTranslatedWord.text)")
            i+=1
        }
    }
    
    
    @IBAction func ButtonRedoACTION(sender: UIButton) {
        for cell in cells {
            cell.TheTranslatedWord.text! = ""
            cell.ImageToShow.hidden = true
        }
        
    }

   
}
    
    
    

    

