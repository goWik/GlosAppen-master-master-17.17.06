//
//  MyFormatedClassElements.swift
//  glosor
//
//  Created by gm on 2016-04-25.
//  Copyright © 2016 gm. All rights reserved.
//

import UIKit


class MyFormatedClassElements: UITableView {
    
    //My colors:
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
    
    
    
    //MARK: MY BIG 40p BUTTONS FORMETED
    func Button_formatedButton(button:UIButton){
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    func Button_formatedSmallButton(button:UIButton){
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = myColor.CGColor
    }
    
    
    func formated_ButtonSelectQuizButton(button:UIButton){
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = myColor.CGColor
    }
    
    
    //MARK: MY TEXTFIELD FORMAED
    func formated_TextFiled(textField:UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        textField.layer.masksToBounds = true
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.blackColor()
    }
    
    func formated_Label(label:UILabel) {
        label.layer.borderColor = UIColor.whiteColor().CGColor
        label.layer.cornerRadius = 6
        label.layer.borderWidth = 1
    }

    func formated_view(view:UIView){
        view.layer.borderColor = UIColor.whiteColor().CGColor
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
    }
}
