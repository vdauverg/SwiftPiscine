//
//  ViewController.swift
//  ex01
//
//  Created by Rene Ramirez on 9/30/19.
//  Copyright © 2019 XcodePiscine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var awesomeLabel: UILabel!
    
    func alertFunc(){
        let alert = UIAlertController(title: "Font Changed", message: "This message is to let you know that the font has changed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func autoHideLabel(){
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute: {
            self.awesomeLabel.isHidden = true
        })
    }
    
    @IBAction func awesomeBtn(_ sender: UIButton) {
        
        awesomeLabel.text = "You are awesome!"
        awesomeLabel.font = UIFont(name: "Futura", size: 40)
        self.awesomeLabel.isHidden = false
        alertFunc()
        autoHideLabel()
    }
    
    @IBAction func awesomenessBtn(_ sender: UIButton) {
        awesomeLabel.text = "*whispers* You are awesomeness!"
        awesomeLabel.font = UIFont(name: "Futura", size: 10)
        awesomeLabel.isHidden = false
        alertFunc()
        autoHideLabel()
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

