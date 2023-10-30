//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapAction(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        playSound(title)
        tapVisualisation(sender)
    }
    
    private func playSound(_ key: String) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
        guard let player = try? AVAudioPlayer(contentsOf: url) else { return }
        self.player = player
        player.play()
    }
    
    private func tapVisualisation(_ sender: UIButton) {
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
        }
    }

}

