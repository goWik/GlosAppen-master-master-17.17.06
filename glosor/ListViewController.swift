//
//  ListViewController.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-10.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

/*i klassen ska:
visas namnet på gloslistan/gloslistor och datum då gloslistan/listor skapades
en gloslista i respektive cell (med datum)
man ska kunna ta bprt cellen
när man tryker på cellen navigeras man till nästa vy där presentationen av glosListaArray sker och användaren får flera val:
*/

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    //tabelView elements:
    @IBOutlet weak var TabelView: UITableView!
    
    var words:String = ""
    
    let helperFunc: HelperFunc = HelperFunc()

    var delegateEditList: EditListViewController?
    //inicerar arrayen som håller ihop mina "färdiga gloslsitor"
    var AllaGlosListorArray:[ListDescribe] = []
    

    override func viewDidLoad() {
        title = "dina listor"
        super.viewDidLoad()
        TabelView.backgroundColor = UIColor(patternImage: UIImage(named: "RosaOBackgraund.png")!)
        TabelView.dataSource = self
        TabelView.delegate =  self
        TabelView.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //func. som följer PROTOKOLL: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return AllaGlosListorArray.count
       
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    //definerar min custom CELL
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        

        let cell = TabelView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CellTableViewCell
        
        cell.TextLabelOutlet.text = AllaGlosListorArray[indexPath.row].name //sätter namnet på listan till namnet som användaren angav då listan skapdes
        cell.TextLabelDatum.text = ("Listan skapad: \(helperFunc.dateFormater())")
        
     
        return cell
    }
    
   //func körs från förra vyn vid action "save"
    func addObjPropertyToArray(listDescribeObj:ListDescribe){
        AllaGlosListorArray.append(listDescribeObj) //lägger till obj. med eneskaper: namn, språk1, språk2
        TabelView.reloadData()
    }
    
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "CreateList" {
           let VC = segue.destinationViewController as? CreateAListViewController
             VC?.delegateCreateList = self
        }
        
       if segue.identifier == "SelectQuiz" {
            let VC = segue.destinationViewController as? SelectQuizTypeViewController
                
            if let cell = sender as? UITableViewCell {
                if let indexPath = TabelView.indexPathForCell(cell) {
                    VC?.AllaGlosListorArray = AllaGlosListorArray[indexPath.row] //skickar data som ligger i respektive cell till  SelectQuiz vyn
                    }
            }
        }
    }
    
    //tar bort cellen DVS. listan och uppdaterar View
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
 
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
        return
    }
    
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    
  func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Destructive, title: "ta bort") { (action, indexPath) in
            // delete item at indexPath
            
            let alert = UIAlertController(title: "Vill ta bort listan?", message: "tryck på OK för att radera", preferredStyle: .Alert)
            let taBort =  UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive) {
                (UIAlertAction) -> Void in
                
                //datan tas bort....
                self.AllaGlosListorArray.removeAtIndex(indexPath.row)//från indexPath
                self.TabelView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)//animation
            }
            
            let cancel = UIAlertAction(title: "NO", style: .Cancel, handler: nil)
            //alertAction
            alert.addAction(cancel)
            alert.addAction(taBort)
            self.presentViewController(alert, animated: true,completion: nil)
        }
    
        //-------------share list-------
        let share = UITableViewRowAction(style: .Normal, title: "dela") { (action, indexPath) in
            
         self.displayShareSheet("Dina gloslista. Namn på gloslistan: \(self.AllaGlosListorArray[indexPath.row].name), språk1: \(self.AllaGlosListorArray[indexPath.row].language1), språk2: \(self.AllaGlosListorArray[indexPath.row].language2) glosor: \(self.AllaGlosListorArray[indexPath.row].glosListorArray)")
                //\(self.giveListWords())")
            }
    
        share.backgroundColor = UIColor.darkGrayColor()
        return [delete, share]
    }
    

    //--popOver vid Action
    @IBAction func ButtonHelpAction(sender: UIBarButtonItem) {
    
        let VC = storyboard?.instantiateViewControllerWithIdentifier("ShowHelp") as! HelpViewController
        
        VC.preferredContentSize = CGSize(width: 350 , height: 330) //formeterar popover
        
        let navController =  UINavigationController(rootViewController: VC)
        
        //hur persenteras?
        navController.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popover = navController.popoverPresentationController
        popover?.delegate = self
        popover?.barButtonItem = sender as? UIBarButtonItem
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .None
    }
    
    
    //GR vid swipe tillbaka to LoadningScreen
   @IBAction func SwipeGRToLoadningSreen(sender: UISwipeGestureRecognizer) {
        performSegueWithIdentifier("GoBackToLoadningScreen", sender: sender)
        print("fungerar!")
    }
    
    
}
