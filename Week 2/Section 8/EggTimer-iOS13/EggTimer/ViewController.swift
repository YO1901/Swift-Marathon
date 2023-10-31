//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    private var player: AVAudioPlayer!
    private var timer: Timer?
    private var timePassed = 0
    private var totalTime = 0
    private let eggTimes = ["Soft": 300, "Medium": 480, "Hard": 720]
    private let mainTitle = "How do you like your eggs?"
    private let doneTitle = "DONE!"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
        }
        progressView.setProgress(0, animated: true)
        guard let title = sender.currentTitle else { return }
        selectionHandler(title)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(0, animated: false)
    }
 
    private func selectionHandler(_ title: String) {
        timer?.invalidate()
        
        guard let eggTime = eggTimes[title] else {
            return }
        totalTime = eggTime
        timePassed = 0
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer(sender:)), userInfo: nil, repeats: true)
    }
    
    @objc private func fireTimer(sender: Timer) {
        guard timePassed < totalTime else {
            progressView.setProgress(1, animated: true)
            timer?.invalidate()
            titleLabel.text = doneTitle
            playSound()
            return
        }
        let percentage: Float = Float(timePassed) / Float(totalTime)
        progressView.setProgress(percentage, animated: true)
        timePassed += 1
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        guard let player = try? AVAudioPlayer(contentsOf: url) else { return }
        self.player = player
        player.play()
    }
}
