//
//  LoadingViewController.swift
//  glosor
//
//  Created by gm on 2016-03-29.
//  Copyright © 2016 gm. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    //elements:
    @IBOutlet var tabelView: UIView!
    
    @IBOutlet weak var ImageToAniation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
    }

    
   //animerar Image
   override func viewWillAppear(animated: Bool) {
        ImageToAniation.center.y -= view.bounds.width
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2.3, animations: {
            self.ImageToAniation.center.y += self.view.bounds.width
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
 
    @IBAction func SwipeGR(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("GoTo", sender: sender)
    }
    
    @IBAction func ButtonShowInfo(sender: UIBarButtonItem) {
    
    let VC = storyboard?.instantiateViewControllerWithIdentifier("ShowInfo") as! AboutViewController
        
        //formaterar custom popover
        VC.preferredContentSize = CGSize(width: 350 , height: 330)
        let navController =  UINavigationController(rootViewController: VC)
        
        navController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popover = navController.popoverPresentationController
        popover?.delegate = self
        popover?.barButtonItem = sender as? UIBarButtonItem
        self.presentViewController(navController, animated: true, completion: nil)
 
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .None
        
    }
    
}
