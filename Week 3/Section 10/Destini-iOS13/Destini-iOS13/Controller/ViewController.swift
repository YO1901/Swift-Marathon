//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    private var storyManager = StoryManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let story = storyManager.initialStory
        updateUI(with: story)
    }

    @IBAction private func choiceMade(_ sender: UIButton) {
        guard let choice = sender.currentTitle else { return }
        let story = storyManager.nextStory(by: choice)
        updateUI(with: story)
    }
}

// MARK: - Private Methods
extension ViewController {
    private func updateUI(with story: Story) {
        storyLabel.text = story.title
        choice1Button.setTitle(story.choiceOne, for: .normal)
        choice2Button.setTitle(story.choiceTwo, for: .normal)
    }
}
