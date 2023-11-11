//
//  QuizManager.swift
//  Quizzler-iOS13
//
//  Created by Yerlan Omarov on 11.11.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizManager {
    private let questions = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    private var questionNumber = 0 {
        didSet {
            guard questionNumber == 0 else { return }
            totalScore = 0
        }
    }
    private var totalScore = 0
}

// MARK: - Public Computed Properties
extension QuizManager {
    public var questionText: String {
        questions[questionNumber].text
    }
    
    public var progress: Float {
        Float(questionNumber + 1) / Float(questions.count)
    }
    
    public var score: Int {
        totalScore
    }
}

// MARK: - Public Methods
extension QuizManager {
    public func checkAnswer(_ userAnswer: String) -> Bool {
        userAnswer == questions[questionNumber].answer
    }
    
    mutating public func incrementQuestionNumber() {
        questionNumber = (questionNumber + 1) % questions.count
    }
    
    mutating public func incrementScore() {
        totalScore += 1
    }
}
