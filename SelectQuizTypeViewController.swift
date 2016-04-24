//
//  SelectQuizTypeViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-19.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

/*i kalssen ska:
1. redigera repektive Gloslistan som ligger i cellen
2. förhöra från språk 1 till språk 2
2. förhöra från språk 2 till språk 1
3. förhöra blandat
 här presenteras data, går ej att redigera, änvändaren får gå vidare för att redigera data
 */



import UIKit

class SelectQuizTypeViewController: UIViewController {
    
    //:MARK ELEMENTS
    @IBOutlet weak var ButtonEditListOutlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage12Outlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage21Outlet: UIButton!
 
    @IBOutlet weak var ButtonSelecktQuizBothLanguage: UIButton!
   
    @IBOutlet var ViewOutlet: UIView!
    
    @IBOutlet weak var VCTitel: UINavigationItem!
    

    var AllaGlosListorArray:ListDescribe?
    
    var settingsAppLanguageUppdate:String?


    override func viewDidLoad() {
        super.viewDidLoad()
        ViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        title = AllaGlosListorArray!.name
        
        self.setUpSettingsAppLanguage()
  
        ButtonSelectQuizLanguage12Outlet.setTitle("\(AllaGlosListorArray!.language1) \(AllaGlosListorArray!.language2)", forState: UIControlState.Normal)
     
        ButtonSelectQuizLanguage21Outlet.setTitle("\(AllaGlosListorArray!.language2) \(AllaGlosListorArray!.language1)", forState: UIControlState.Normal)
  
        formated_myButton(ButtonEditListOutlet)
        formated_myButton(ButtonSelectQuizLanguage12Outlet)
        formated_myButton(ButtonSelectQuizLanguage21Outlet)
        formated_myButton(ButtonSelecktQuizBothLanguage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: MY BUTTONS FORMETED
    func formated_myButton(button:UIButton){
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    
    func setUpSettingsAppLanguage(){
        if settingsAppLanguageUppdate == "Svenska" {
            ButtonEditListOutlet.setTitle("redigera", forState: UIControlState.Normal)
            ButtonSelecktQuizBothLanguage.setTitle("bandad", forState: .Normal)
            
        }
        if settingsAppLanguageUppdate == "English"{
            ButtonEditListOutlet.setTitle("edit", forState: UIControlState.Normal)
            ButtonSelecktQuizBothLanguage.setTitle("mixed", forState: .Normal)
        }
        if settingsAppLanguageUppdate == "Polska" {
            ButtonEditListOutlet.setTitle("redaguj", forState: UIControlState.Normal)
            ButtonSelecktQuizBothLanguage.setTitle("mieszana", forState: .Normal)
        }
    }

    
    //:MARK NAVIGATIONS
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditList" {
            let VC = segue.destinationViewController as? EditListViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
        }
        
        if segue.identifier == "QuizTest12" {
            let VC = segue.destinationViewController as? QuizTestType12ViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
        }
        
        if segue.identifier == "QuizTest21" {
            let VC = segue.destinationViewController as?
            QuizTest21ViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
        }
        
        if segue.identifier == "QuizTestMixed" {
            let VC = segue.destinationViewController as?
            QuizTestMixedViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
        }
    }


    
    
}








