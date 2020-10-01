//
//  ViewController.swift
//  BullsEye
//
//  Created by Kolbjørn Kelly on 18.04.2018.
//  Copyright © 2018 kellykolly. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var randomNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNum = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNum)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkVal(_ sender: Any) {
        
        if (modeSwitch.isOn == false) {
            
            if (Int(numSlider.value) >= randomNum - 3 && Int(numSlider.value) <= randomNum + 3) {
                
                resultLabel.text = "Bullseye!"
                resultLabel.backgroundColor = UIColor.green
            }
                
            else {
                resultLabel.text = "Woops, looks like you missed. You hit \(round(numSlider.value))..."
                resultLabel.backgroundColor = UIColor.red
            }
        }
        
        else {
            if (randomNum == Int(numSlider.value)) {
                resultLabel.text = "Bullseye!"
                resultLabel.backgroundColor = UIColor.green
            }
                
            else {
                resultLabel.text = "Woops, looks like you missed. You hit \(round(numSlider.value))..."
                resultLabel.backgroundColor = UIColor.red
            }
        }
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNum = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNum)"
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
}

