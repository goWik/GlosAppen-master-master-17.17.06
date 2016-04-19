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
    
    //Elemetns:
    @IBOutlet weak var ButtonEditListOutlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage12Outlet: UIButton!
    
    @IBOutlet weak var ButtonSelectQuizLanguage21Outlet: UIButton!
 
    @IBOutlet weak var ButtonSelecktQuizBothLanguage: UIButton!
   
    @IBOutlet var ViewOutlet: UIView!
    
    @IBOutlet weak var VCTitel: UINavigationItem!
    

    var AllaGlosListorArray:ListDescribe?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        title = AllaGlosListorArray!.name
  
        //----edit
        ButtonEditListOutlet.setTitle("redigera", forState: UIControlState.Normal)
        ButtonEditListOutlet.layer.cornerRadius = 10
        ButtonEditListOutlet.layer.borderWidth = 1
        ButtonEditListOutlet.layer.borderColor = UIColor.whiteColor().CGColor
        //--- 1-2
        ButtonSelectQuizLanguage12Outlet.setTitle("\(AllaGlosListorArray!.language1) \(AllaGlosListorArray!.language2)", forState: UIControlState.Normal)
        ButtonSelectQuizLanguage12Outlet.layer.cornerRadius = 10
        ButtonSelectQuizLanguage12Outlet.layer.borderWidth = 1
        ButtonSelectQuizLanguage12Outlet.layer.borderColor = UIColor.whiteColor().CGColor
        //-----2-1
        ButtonSelectQuizLanguage21Outlet.setTitle("\(AllaGlosListorArray!.language2) \(AllaGlosListorArray!.language1)", forState: UIControlState.Normal)
        ButtonSelectQuizLanguage21Outlet.layer.cornerRadius = 10
        ButtonSelectQuizLanguage21Outlet.layer.borderWidth = 1
        ButtonSelectQuizLanguage21Outlet.layer.borderColor = UIColor.whiteColor().CGColor
        //MIX--------
         ButtonSelecktQuizBothLanguage.setTitle("bandad", forState: .Normal)
        ButtonSelecktQuizBothLanguage.layer.cornerRadius = 10
        ButtonSelecktQuizBothLanguage.layer.borderWidth = 1
        ButtonSelecktQuizBothLanguage.layer.borderColor = UIColor.whiteColor().CGColor
        
        //print("Data som ligger nu i VDLoad i presentData: \(AllaGlosListorArray!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "EditList" {
            let VC = segue.destinationViewController as? EditListViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
        }
        
        if segue.identifier == "QuizTest12" {
            let VC = segue.destinationViewController as? QuizTestType12ViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
        }
        
        if segue.identifier == "QuizTest21" {
            let VC = segue.destinationViewController as?
            QuizTest21ViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
        }
        
        if segue.identifier == "QuizTestMixed" {
            let VC = segue.destinationViewController as?
            QuizTestMixedViewController
            VC?.AllaGlosListorArray = AllaGlosListorArray
        }
    }

    
    
   
    @IBAction func EditList(sender: UIButton) {
         print("data som ska uppdateras:: \(AllaGlosListorArray!)")
        /*ButtonEditListOutlet.transform = CGAffineTransformMakeScale(0.2, 0.2)
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.2,
                                   initialSpringVelocity: 6.0,
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.ButtonEditListOutlet.transform = CGAffineTransformIdentity
            }, completion: nil)*/
        
       

    }
    
  @IBAction func ButtonSelectQuizLanguage12Action(sender: UIButton) {
        print("data som ska vidare till förhör språk 1- språk2: \(AllaGlosListorArray!)")
    }
    
    
    @IBAction func ButtonSelectQuizLaungage21(sender: UIButton) {
        print("data som ska vidare till språk2-språk 1: \(AllaGlosListorArray!)")
    }

    
    
    @IBAction func ButtonSelectQuizLaungageMixed(sender: UIButton) {
        print("data som ska vidare till förhör blandat: \(AllaGlosListorArray!)")
    }
    
}








