//
//  ViewController.swift
//  ex01
//
//  Created by Rene Ramirez on 10/2/19.
//  Copyright © 2019 SwiftPiscine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1500
    var timer = Timer()
    var isPlaying = false
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!
    
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying){return}
        startLabel.isEnabled = false
        pauseLabel.isEnabled = true
        pauseLabel.setTitle("Pause", for: .normal)
        startLabel.backgroundColor = UIColor.green
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: AnyObject) {
        startLabel.isEnabled = true
        pauseLabel.isEnabled = true
        startLabel.backgroundColor = UIColor.white
        
        if(isPlaying){
            pauseLabel.setTitle("Resume", for: .normal)
            timer.invalidate()
            isPlaying = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            pauseLabel.setTitle("Pause", for: .normal)
            isPlaying = true
        }
    }
    @IBAction func resetTimer(_ sender: AnyObject) {
        startLabel.isEnabled = true
        pauseLabel.isEnabled = false
        pauseLabel.setTitle("Pause", for: .normal)
        
        timer.invalidate()
        isPlaying = false
        counter = 1500
        timeLabel.text = "25:00"
    }
    @objc func updateTimer(){
        if counter < 1{
            timer.invalidate()
        }else{
        counter = counter-1
        let minutes = Int(counter) / 60
        let seconds = Int(counter) % 60
        
        timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = "25:00"
        pauseLabel.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

