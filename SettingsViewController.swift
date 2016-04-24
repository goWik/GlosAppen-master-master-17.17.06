//
//  SettingsViewController.swift
//  glosor
//
//  Created by gm on 2016-04-23.
//  Copyright © 2016 gm. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UITextFieldDelegate  {
    
    
    // MARK: ELEMENTS
    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var ButtonOKOutlet: UIButton!
    
    @IBOutlet weak var Switch: UISwitch!
    
    @IBOutlet weak var LabelAudio: UILabel!
    
    @IBOutlet var TableView: UIView!
    
    
    var  LanguageSeetings:[String] = ["Svenska", "English", "Polska"]
    
    var settingsAppLanguage:String = ""
    
    var delgatedLoadingViewController:LoadingViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.reloadAllComponents()
        TableView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        ButtonOKOutlet.layer.cornerRadius = 8
        ButtonOKOutlet.layer.borderWidth = 1
        ButtonOKOutlet.layer.borderColor = UIColor.whiteColor().CGColor

    }
    
    
    
    func setUpSettingsAppLanguage(){
        if settingsAppLanguage == "Svenska" {
            title = "inställningar"
            LabelAudio.text = "ljud"
        }
        if settingsAppLanguage == "English"{
            title = "settings"
            LabelAudio.text = "sound"
        }
        if settingsAppLanguage == "Polska" {
            title = "ustawienia"
            LabelAudio.text = "dzwiek"
        }
    }
    
    
    
    
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let languageAtRow = LanguageSeetings[row]
        let myFormat = NSAttributedString(string: languageAtRow, attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        return myFormat
    }
    
    
    
    //MARK: PROTKOLOS FUNKTIONS
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  LanguageSeetings.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(LanguageSeetings[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        settingsAppLanguage =  LanguageSeetings[row]
        PickerView.reloadAllComponents()
        self.setUpSettingsAppLanguage()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ButtonOKAction(sender: UIButton) {
        delgatedLoadingViewController?.changeLanguage(settingsAppLanguage)
    }
    



}
