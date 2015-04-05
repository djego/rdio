//
//  RdioDetailViewController.swift
//  Rdio
//
//  Created by Diego Machaca on 31/03/15.
//  Copyright (c) 2015 Devio. All rights reserved.
//

import UIKit

class RdioDetailViewController: UIViewController {
    
    var titlenav = "Default"
    var numberToDisplay = 0
    @IBOutlet weak var titleRdio: UINavigationItem!
    var name = "Radio X"
    var icon = ""
    /*override func viewDidLoad() {
        super.viewDidLoad()
        println(self.programVar)
        titleNav.topItem?.title = self.programVar
        
        
        
    }*/

    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleRdio.title = self.name
        
        // Do any additional setup after loading the view, typically from a nib.
    }   
 
}

