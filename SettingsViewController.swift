//
//  SettingsViewController.swift
//  glosor
//
//  Created by gm on 2016-04-23.
//  Copyright © 2016 gm. All rights reserved.
//i klassen ställs in inställningar som ljud och språk: svenska och engelska

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate  {
    
    
    // MARK: ELEMENTS
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet var TableView: UIView!
  
    @IBOutlet weak var ButtonSoundOffOutlet: UIButton!
    
    @IBOutlet weak var ButtonSoundOnOutlet: UIButton!
    
    @IBOutlet weak var LabelSoundInfo: UILabel!
    
    @IBOutlet weak var ViewPicker: UIView!
    
    
    
    var delgatedLoadingViewController:LoadingViewController?
    
    let myFormatedClassElements:MyFormatedClassElements =  MyFormatedClassElements()
    
    let LanguageSeetings:[String] = ["Svenska", "English"]
    
    var settingsAppLanguage:String = "Svenska"
    
    var sound:Bool = true
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSettingsAppLanguage()
        TableView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        self.myFormatedClassElements.formated_view(ViewPicker)
        self.myFormatedClassElements.formated_view(ButtonSoundOnOutlet)
        self.myFormatedClassElements.formated_view(ButtonSoundOffOutlet)
        self.myFormatedClassElements.formated_Label(LabelSoundInfo)
        PickerView.reloadAllComponents()
        
    }
    
    func setUpSettingsAppLanguage(){
        if settingsAppLanguage == "Svenska" {
            title = "inställningar"
            if sound == true {
                LabelSoundInfo.text = "ljud på"
            } else {
                LabelSoundInfo.text = "ljud av"
            }
        }
        
        if settingsAppLanguage == "English" {
            title = "settings"
            if sound == true {
                LabelSoundInfo.text = "sound on"
            } else {
                LabelSoundInfo.text = "sound off"
            }
        }
    }
   

    //MARK: PROTKOLOS FUNKTIONS
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  LanguageSeetings.count
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = LanguageSeetings[row]
        let myFormat = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Helvetica Neue", size: 17.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myFormat
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        settingsAppLanguage = LanguageSeetings[row]
        self.delgatedLoadingViewController?.changeLanguage(settingsAppLanguage,soundSettigs:sound)
        PickerView.reloadAllComponents()
        self.setUpSettingsAppLanguage()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    //MARK: ACTION
    @IBAction func ButtonSoundOfAction(sender: UIButton) {
        if settingsAppLanguage == "Svenska" {
            LabelSoundInfo.text = "ljud av"
        }
        if settingsAppLanguage == "English" {
            LabelSoundInfo.text = "sound off"
            print("sound off")
        }
        sound = false
        self.delgatedLoadingViewController?.changeLanguage(settingsAppLanguage,soundSettigs:sound)
    }

    
    
    @IBAction func ButtonSoundOnAction(sender: UIButton) {
     if sound == false {
        if settingsAppLanguage == "English" {
            LabelSoundInfo.text = "sound on"
            print("sound on")
        }
        if settingsAppLanguage == "Svenska" {
           LabelSoundInfo.text = "ljud på"
        }
     }
     sound = true
     self.delgatedLoadingViewController?.changeLanguage(settingsAppLanguage,soundSettigs:sound)
    }
    

}





