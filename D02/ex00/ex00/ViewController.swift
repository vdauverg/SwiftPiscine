//
//  ViewController.swift
//  ex00
//
//  Created by Rene Ramirez on 10/2/19.
//  Copyright © 2019 SwiftPiscine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying){return}
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: AnyObject) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = true
        pauseBtn.setTitle("Pause", for: .normal)
        
        if (isPlaying){
            pauseBtn.setTitle("Resume", for: .normal)
            timer.invalidate()
            isPlaying = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            isPlaying = true
        }
    }
    
    @IBAction func resetTimer(_ sender: AnyObject) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = "00:00:00:00"
        //timeLabel.text = String(counter)
    }
    
    @objc func UpdateTimer(){
        counter = counter+0.1
        let hours = Int(counter / 100) / 120
        let minutes = Int(counter / 10) / 60 % 60
        let seconds = Int(counter / 10) % 60
        let milSecs = Int(counter) % 60
        print(hours)
        timeLabel.text = String(format: "%02d:%02d:%02d:%02d", hours, minutes, seconds, milSecs)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.text = "00:00:00:00"
        pauseBtn.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

