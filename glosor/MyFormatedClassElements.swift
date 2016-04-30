//
//  MyformattedClassElements.swift
//  glosor
//
//  Created by gm on 2016-04-25.
//  Copyright © 2016 gm. All rights reserved.
//

import UIKit


class MyformattedClassElements: UITableView {
    
    //My pink color:
    let myColor = UIColor(red: 160.0/255.0, green: 41.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    
    //MARK: MY BUTTON 40p FORMATTED
    func Button_formattedButton(button:UIButton){
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    func Button_formattedSmallButton(button:UIButton){
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = myColor.CGColor
    }
    
    
    func formatted_ButtonSelectQuizButton(button:UIButton){
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = myColor.CGColor
    }
    
    
    //MARK: MY TEXTFIELD FORMATTED
    func formatted_TextField(textField:UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        textField.layer.masksToBounds = true
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.blackColor()
    }
    //MARK: MY LABEL FORMATTED
    func formatted_Label(label:UILabel) {
        label.layer.borderColor = UIColor.whiteColor().CGColor
        label.layer.cornerRadius = 6
        label.layer.borderWidth = 1
    }
    
    //MARK: MY VIEW FORMATTED
    func formatted_view(view:UIView){
        view.layer.borderColor = UIColor.whiteColor().CGColor
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
    }
}
