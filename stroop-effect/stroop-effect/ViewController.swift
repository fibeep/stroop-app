//
//  ViewController.swift
//  stroop-effect
//
//  Created by salo cohen on 11/26/20.
//

import UIKit

enum ColorOption {
    case blue, red, yellow, orange, purple, green
    
    var text: String {
        switch self {
        case .red:
            return "red"
        case .blue:
            return "blue"
        case .yellow:
            return "yellow"
        case .orange:
            return "orange"
        case .purple:
            return "purple"
        case .green:
            return "green"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
    init(){
        self = ColorOption.allCases[Int(arc4random_uniform(UInt32(ColorOption.allCases.count)))]
    }
    
}

extension ColorOption: CaseIterable{
    mutating func getRandomColor() {
        self = ColorOption.allCases[Int.random(in: 0..<ColorOption.allCases.count)]
    }
}

class ViewController: UIViewController {
    
    var score = 0
    
    
    @IBOutlet weak var meaning: UILabel!
    
    @IBOutlet weak var realColor: UILabel!
    
    @IBOutlet weak var totalScore: UILabel!
    
    var topColor : ColorOption!
    var bottomcolor : ColorOption!
    
    func randomize(){
        
        topColor = ColorOption()
        bottomcolor = ColorOption()
        
        meaning.text = topColor.text
        realColor.textColor = bottomcolor.textColor
    }
    
    @IBAction func noButton(_ sender: Any) {
        if topColor == bottomcolor {
            score -= 5
        } else {
            score += 10
        }
        randomize()
        totalScore.text = "Score is: \(score)"
    }
    
    
    @IBAction func yesButton(_ sender: Any) {
        if topColor != bottomcolor {
            score -= 5
        } else {
            score += 10
        }
        randomize()
        totalScore.text = "Score is: \(score)"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}





