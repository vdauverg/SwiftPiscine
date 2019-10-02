//
//  ViewController.swift
//  ex00
//
//  Created by Rene Ramirez on 9/30/19.
//  Copyright © 2019 XcodePiscine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SexyButtonLabel: UILabel!
    
    @IBAction func labelTrue(_ sender: AnyObject){
        SexyButtonLabel.isHidden = true
    }
    
    @IBAction func SexyButton(_ sender: UIButton) {
        print("Yes, Yes you are!")
        
        SexyButtonLabel.text = "Yes, Yes you are!"
        SexyButtonLabel.isHidden = false
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

