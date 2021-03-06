//
//  SelectQuizTypeViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-19.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//


import UIKit

class SelectQuizTypeViewController: UIViewController {
    
    //MARK: ELEMENTS
    @IBOutlet weak var ButtonEditListOutlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage12Outlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage21Outlet: UIButton!
    
    @IBOutlet weak var ButtonSelecktQuizBothLanguage: UIButton!
    
    @IBOutlet var ViewOutlet: UIView!
    
    @IBOutlet weak var VCTitel: UINavigationItem!
    
    
    var myformattedClassElements:MyformattedClassElements = MyformattedClassElements()
    
    var AllaGlosListorArray:ListDescribe?
    
    var settingsAppLanguageUppdate:String?
    
    var soundSettigsApp:Bool?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        title = AllaGlosListorArray!.name
        
        self.setUpSettingsAppLanguage()
        
        ButtonSelectQuizLanguage12Outlet.setTitle("\(AllaGlosListorArray!.language1) \(AllaGlosListorArray!.language2)", forState: UIControlState.Normal)
        
        ButtonSelectQuizLanguage21Outlet.setTitle("\(AllaGlosListorArray!.language2) \(AllaGlosListorArray!.language1)", forState: UIControlState.Normal)
        self.myformattedClassElements.Button_formattedButton(ButtonEditListOutlet)
        self.myformattedClassElements.Button_formattedButton(ButtonSelectQuizLanguage12Outlet)
        self.myformattedClassElements.Button_formattedButton(ButtonSelectQuizLanguage21Outlet)
        self.myformattedClassElements.Button_formattedButton(ButtonSelecktQuizBothLanguage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    }
    
    
    //MARK: NAVIGATIONS
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
            VC?.soundSettigsApp = soundSettigsApp
        }
        
        if segue.identifier == "QuizTest21" {
            let VC = segue.destinationViewController as?
            QuizTest21ViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
            VC?.soundSettigsApp = soundSettigsApp
        }
        
        if segue.identifier == "QuizTestMixed" {
            let VC = segue.destinationViewController as?
            QuizTestMixedViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
            VC?.soundSettigsApp = soundSettigsApp
        }
    }
    
    
    
    
}








