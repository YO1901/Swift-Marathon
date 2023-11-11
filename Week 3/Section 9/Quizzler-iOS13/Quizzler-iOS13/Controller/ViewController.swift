//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var trueButton: UIButton!
    @IBOutlet private weak var falseButton: UIButton!
    @IBOutlet private weak var progressBar: UIProgressView!
    
    private var quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 20
        falseButton.layer.cornerRadius = 20
        updateUI()
    }

    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isRightAnswer = quizManager.checkAnswer(userAnswer)
        
        if isRightAnswer {
            sender.backgroundColor = .green
            quizManager.incrementScore()
        } else {
            sender.backgroundColor = .red
        }
        
        quizManager.incrementQuestionNumber()
        updateUI()
    }
    
    private func updateUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.questionLabel.text = self.quizManager.questionText
            self.progressBar.setProgress(self.quizManager.progress, animated: true)
            self.scoreLabel.text = "Score \(self.quizManager.score)"
            
            self.trueButton.backgroundColor = .clear
            self.falseButton.backgroundColor = .clear
        }
    }
}

