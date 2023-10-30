//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var diceImageViewOne: UIImageView!
    @IBOutlet private weak var diceImageViewTwo: UIImageView!
    
    private let dices = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRandomDices()
    }

    @IBAction private func rollButtonPressed(_ sender: UIButton) {
        makeRandomDices()
    }
    
    private func makeRandomDices() {
        diceImageViewOne.image = dices.randomElement()
        diceImageViewTwo.image = dices.randomElement()
    }
}

