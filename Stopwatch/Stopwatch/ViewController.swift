//
//  ViewController.swift
//  Stopwatch
//
//  Created by Mutlu Çalkan on 6.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var timer : Timer?
    var counter = 0
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    
    
    // MARK: - IBActions
    // When user press on Start button.
    @IBAction func startButton(_ sender: Any) {
        guard timer == nil else {return}
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // When user press on Stop button.
    @IBAction func stopButton(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    // Adds 10 seconds to current time
    @IBAction func addTenSecsButton(_ sender: Any) {
        counter += 10
        timeLabel.text = String(counter)
    }
    
    // Subtracts 10 seconds from current time
    @IBAction func subTenSecsButton(_ sender: Any) {
        if counter >= 10{
            counter -= 10
            timeLabel.text = String(counter)
        }
    }
    
    // Reset the time
    @IBAction func resetTimeButton(_ sender: Any) {
        counter = 0
        timeLabel.text = "0"
    }
    
    
    // MARK: - Methods
    @objc func updateCounter() {
        counter += 1
        timeLabel.text = String(counter)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "0"

    }
}

