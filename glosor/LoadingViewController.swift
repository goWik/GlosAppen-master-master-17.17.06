//
//  LoadingViewController.swift
//  glosor
//
//  Created by gm on 2016-03-29.
//  Copyright © 2016 gm. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    //:MARK ELEMENTS
    @IBOutlet var tableView: UIView!
    
    @IBOutlet weak var ImageToAnimation: UIImageView!
    
    @IBOutlet weak var NavBarItemOutlet: UIBarButtonItem!
    
    
 
    var delegateSettingsViewController:SettingsViewController?
    
    var delegateAboutViewController:AboutViewController?
    
    var delegateListViewController:ListViewController?
    
    
    var AllaGlosListorArray:String?
    
    var settingsAppLanguageUppdate:String?
    
    var soundSettigsApp:Bool?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
    }
    
    
    func changeLanguage(settingsAppLanguage:String, soundSettigs:Bool){
        print(settingsAppLanguage) //er språk
        settingsAppLanguageUppdate = settingsAppLanguage
        soundSettigsApp = soundSettigs
    }
    
    
   //:MARK ANIMATE IMAGE
   override func viewWillAppear(animated: Bool) {
        ImageToAnimation.center.y -= view.bounds.width//neråt
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2.3, animations: {
            self.ImageToAnimation.center.y += self.view.bounds.width
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //MARK NAVIGATION
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Settings" {
            let VC = segue.destinationViewController as? SettingsViewController
            VC?.delgatedLoadingViewController = self
        }
        
        
        if segue.identifier == "GoTo" {
            let VC = segue.destinationViewController as? ListViewController
            VC?.settingsAppLanguageUppdate = settingsAppLanguageUppdate
            VC?.soundSettigsApp = soundSettigsApp
        }
        

    }
    
    
   
    //:MARK ACTIONS
    @IBAction func SwipeGR(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("GoTo", sender: settingsAppLanguageUppdate)
    }
    
    
    //:MARK ACTIONS
    @IBAction func ButtonShowInfo(sender: UIBarButtonItem) {
    
    let VC = storyboard?.instantiateViewControllerWithIdentifier("ShowInfo") as! AboutViewController
        VC.settingsAppLanguageUppdate = settingsAppLanguageUppdate
        
        //Formatterar custom popover
        VC.preferredContentSize = CGSize(width: 350 , height: 330)
        let navController =  UINavigationController(rootViewController: VC)
        
        navController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popover = navController.popoverPresentationController
        popover?.delegate = self
        popover?.barButtonItem = sender as UIBarButtonItem
        self.presentViewController(navController, animated: true, completion: nil)
 
    }

    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .None
        
    }
    
    
}
