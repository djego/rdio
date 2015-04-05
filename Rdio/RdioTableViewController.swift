//
//  ViewController.swift
//  Rdio
//
//  Created by Diego Machaca on 27/03/15.
//  Copyright (c) 2015 Devio. All rights reserved.
//

import UIKit

class RdioTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    var counter = 0
    
    var cellContent = ["Radio A","Radio B","Radio C","Radio D","Radio E"]
    var arr = []
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.revealViewController().rearViewRevealWidth = 200
        let path = NSBundle.mainBundle().pathForResource("ecuador", ofType: "plist") as String?
        arr = NSArray(contentsOfFile: path!)!
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                var dict = arr[indexPath.row] as NSDictionary
                
                (segue.destinationViewController as RdioDetailViewController).name = dict["name"] as NSString
                (segue.destinationViewController as RdioDetailViewController).icon = dict["icon"] as NSString
            }
        }
    }
    
    // MARK: - Tables
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // add title
        var dict = arr[indexPath.row] as NSDictionary
        cell.textLabel!.text = dict["name"] as NSString
        // add image
        let url = NSURL(string: dict["icon"] as NSString)
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        cell.imageView?.image = image
        return cell
        
    }



   
    
}
