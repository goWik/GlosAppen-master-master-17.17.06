//
//  QuizTestMixedViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-25.
//  Copyright © 2016 malgorzata wikström. All rights reserved.

// KÄLLOR:
// http://www.appcoda.com/view-animation-in-swift/ animationer
// https://www.hackingwithswift.com/example-code/uikit/how-to-adjust-a-uiscrollview-to-fit-the-keyboard keyboard och notifiaktions

import UIKit

class QuizTestMixedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    //:MARK ELEMENTS
    @IBOutlet weak var ButtonShowAnswerOutlet: UIButton!
    
    @IBOutlet weak var ButtonRedoOutlet: UIButton!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var VCName: UINavigationItem!
 
    
    var delegerare:SelectQuizTypeViewController?
    
    var AllaGlosListorArray:ListDescribe?
    
    var cells:[CustomCellQuizTestMixedTableViewCell] = []
    
    var helperStruct:HelperStruct = HelperStruct()
    
    var myFormatedClassElements:MyFormatedClassElements = MyFormatedClassElements()
    
    var settingsAppLanguageUppdate:String?
    
    var soundSettigsApp:Bool?
    
 
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSettingsAppLanguage()
        //lyssnare
        let notificationCenter = NSNotificationCenter.defaultCenter()
        
        //kör func här, notificationCenter lägger till Observer och samtidigt körs adjustForKeyboard med namn: HIDE
        notificationCenter.addObserver(self, selector: #selector(QuizTest21ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        //kör func här, notificationCenter lägger till Observer och samtidigt körs adjustForKeyboard med namn: WILLCHANGE
        notificationCenter.addObserver(self, selector: #selector(QuizTest21ViewController.adjustForKeyboard(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        self.myFormatedClassElements.formated_ButtonSelectQuizButton(ButtonShowAnswerOutlet)
        self.myFormatedClassElements.formated_ButtonSelectQuizButton(ButtonRedoOutlet)
    
        TableView.delegate = self
        
    }

    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }
    
    
    
    //:MARK PROTOKOLLS FUNCKTIONS:
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (AllaGlosListorArray?.glosListorArray.count)!
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //:MARK CUSTOM CELL
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCellWithIdentifier("CellQuizTypeMixed", forIndexPath: indexPath) as! CustomCellQuizTestMixedTableViewCell
        
        
        if cells.count < AllaGlosListorArray?.glosListorArray.count {
            cells.append(cell)
        }
        if cells.count >= 0 {
            print("lägg ej flera celler")
        }
        
        
       //vilkor för blandat:
       for var i = 0; i <= AllaGlosListorArray?.glosListorArray.count; i += 1 {
    
        switch  Int(arc4random_uniform(UInt32(AllaGlosListorArray!.glosListorArray.count))) {
                case 0 :
                    cell.WordToTranslate.text =  String(AllaGlosListorArray!.glosListorArray[indexPath.row].word1)
                case 1 :
                    cell.WordToTranslate.text =  String(AllaGlosListorArray!.glosListorArray[indexPath.row].word2)
                default:
                    print("defoult")
            }
        }
        
        if settingsAppLanguageUppdate == "Svenska" || settingsAppLanguageUppdate == nil {
            cell.TheTranslatedWord.placeholder = "ditt svar"
        }
        if settingsAppLanguageUppdate == "English" {
            cell.TheTranslatedWord.placeholder = "your answer"
        }

        ButtonShowAnswerOutlet.addTarget(self, action: #selector(QuizTestMixedViewController.ButtonShowAnswer(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        

        return cell
    }
    
    
    
    //MARK: SET UP SETTINGS APPLanguage
    func setUpSettingsAppLanguage(){
            if settingsAppLanguageUppdate == "Svenska" || settingsAppLanguageUppdate == nil { 
                title = "blandat"
                ButtonShowAnswerOutlet.setTitle("rätta", forState: .Normal)
                ButtonRedoOutlet.setTitle("gör om", forState: .Normal)
            }
            if settingsAppLanguageUppdate == "English"{
                title = "mixed"
                ButtonShowAnswerOutlet.setTitle("correct", forState: .Normal)
                ButtonRedoOutlet.setTitle("redo", forState: .Normal)
            }
    }

    
    
    
    //:MARK ANIMATIONS:
    override func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    func animateTable() { //animerar celler:
        TableView.reloadData()
        
        _ = TableView.visibleCells //deklarerar en myCell typen UITableViewCell på existerande rowen
        let screenHeight:CGFloat = TableView.bounds.size.height //anger mått för hight tabel
        
        for myCell in cells { //loppar igenom cells Arraygen
            let myCell:UITableViewCell = myCell as UITableViewCell
            myCell.transform = CGAffineTransformMakeTranslation(0, screenHeight)//så hög är skärmen
        }
        for myCell in cells {
            let mycell: UITableViewCell = myCell as UITableViewCell
            
           if soundSettigsApp == true || soundSettigsApp == nil {
                self.helperStruct.playAudio() //ljudet spelas upp samtigit som animationene körs
            }

            UIView.animateWithDuration(0.8, delay:0.03, usingSpringWithDamping: 1, initialSpringVelocity: 0,
                                       options: .LayoutSubviews, animations: {
                                        mycell.transform = CGAffineTransformMakeTranslation(0, 0);
            }, completion: nil)
        }
    }
    
    
    //:MARK NAVIGATIONS:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowSynonym" {
            let VC = segue.destinationViewController as? SynonymViewController
            if let cell = sender as? UITableViewCell {
                if let indexPath = TableView.indexPathForCell(cell) {
                    VC?.synonymWord = String(AllaGlosListorArray!.glosListorArray[indexPath.row].word1)
                }
            }
        }
    }
    

    //MARK: ACTIONS:
    func ButtonShowAnswer(sender:UIButton) {
        var i = 0
        for cell in cells {
            
            cell.TheTranslatedWord.text! = cell.TheTranslatedWord.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            
            //vilkor till rätta:
            if AllaGlosListorArray!.glosListorArray[i].word1.caseInsensitiveCompare(cell.TheTranslatedWord.text!) == .OrderedSame ||  AllaGlosListorArray!.glosListorArray[i].word2.caseInsensitiveCompare(cell.TheTranslatedWord.text!) == .OrderedSame {
                cell.ImageToShowResults.hidden = false
            } else {
                cell.ImageToShowResults.hidden = true
            }
            i+=1
        }
    }
    

    @IBAction func ButtonRedoAction(sender: UIButton) {
        for cell in cells {
            cell.TheTranslatedWord.text! = ""
            cell.ImageToShowResults.hidden = true
        }
    }
    
    
    // MARK: Keyboard up and down
    func adjustForKeyboard(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        
        let keyboardScreenFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue() //format för screnFrame
        let keyboardViewFrame = view.convertRect(keyboardScreenFrame, fromView: view.window)//och viewFrame
        
        if notification.name == UIKeyboardWillHideNotification { //om notifaktions.NAME  är Hide
            TableView.contentInset = UIEdgeInsetsZero
        } else { //keybord height
            TableView .contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewFrame.height, right: 0) //from bottom dess hight
        }
        TableView.scrollIndicatorInsets = TableView.contentInset
    }
    
   

}
