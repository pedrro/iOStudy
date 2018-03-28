//
//  ViewController.swift
//  BullsEye
//
//  Created by Pedro Henrique Nazário da Silva on 26/03/18.
//  Copyright © 2018 Pedro Henrique Nazário da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 50
    var targetValue: Int = 0
    var roundCount: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var roundNumberLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference     // change let to var
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100                   // add this line
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {            // add these lines
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        let message = "You scored \(points) points"
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.default,
                                   handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        print("slider value: \(sender.value)")
        currentValue = lroundf(sender.value)
        print("current value: \(currentValue)")
    }
    
    @IBAction func restartRound(_ sender: Any) {
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundNumberLabel.text = String(roundCount)
        scorelabel.text = String(score)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
        roundCount+=1
        slider.value = 50
    }
    
}

