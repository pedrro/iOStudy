//
//  ViewController.swift
//  magic 8 ball
//
//  Created by Pedro Henrique Nazário da Silva on 12/03/18.
//  Copyright © 2018 Pedro Henrique Nazário da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ballArray = ["ball1","ball2","ball3","ball4","ball5"]
    var randomBallNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    
    func newBallImage()  {
        randomBallNumber = Int(arc4random_uniform(4))
        ImageView.image = UIImage(named:ballArray[randomBallNumber])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        newBallImage()
    }
}

