//
//  ViewController.swift
//  ex02
//
//  Created by Ramirez Family on 10/1/19.
//  Copyright © 2019 XcodePiscine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func confettiStart(){
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "confettiArt"), n1: 1)
        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width/2, height: 2)
        view.layer.addSublayer(emitter)
    }
    func confettiStop(){
        let emitter = Emitter.get(with: #imageLiteral(resourceName: "confettiArt"), n1: 0)
        view.layer.addSublayer(emitter)
    }
    
    @IBAction func startTheParty(_ sender: UIButton) {
        self.confettiStart()
    }
    
    @IBAction func funsOver(_ sender: UIButton) {
        self.confettiStop()
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

