//
//  ViewController.swift
//  universitariosFamintos
//
//  Created by Student on 6/24/16.
//  Copyright © 2016 Chamer. All rights reserved.
//

import UIKit

class ViewController:

UIViewController {
    
    @IBOutlet weak var labelTeste: UILabel!
    
    @IBAction func melhorBotao(sender: AnyObject) {
        
        labelTeste.alpha = 1
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        labelTeste.alpha = 0.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

