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
    var streak_count = 0
    
    
    
    @IBOutlet weak var meaning: UILabel!
    
    @IBOutlet weak var realColor: UILabel!
    
    @IBOutlet weak var streak: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    var topColor : ColorOption!
    var bottomcolor : ColorOption!
    let time = 60
    func createTimer(){
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            runCount += 1
            self.timerLabel.text = "Time left: \(self.time-runCount)"
            if runCount == self.time {
                timer.invalidate()
                self.score = 0
                self.totalScore.text = "Score is: \(self.score)"
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    func randomize(){
        
        topColor = ColorOption()
        bottomcolor = ColorOption()
        
        meaning.text = topColor.text
        realColor.textColor = bottomcolor.textColor
        realColor.text = topColor.text
    }
    
    @IBAction func noButton(_ sender: Any) {
        if topColor == bottomcolor {
            score -= 5
            streak_count = 0
        } else {
            score += 10
            streak_count += 1
        }
        randomize()
        totalScore.text = "Score is: \(score)"
        streak.text = "Streak: \(streak_count)"
    }
    
    
    @IBAction func yesButton(_ sender: Any) {
        if topColor != bottomcolor {
            score -= 5
            streak_count = 0
        } else {
            score += 10
            streak_count += 1
        }
        randomize()
        totalScore.text = "Score is: \(score)"
        streak.text = "Streak: \(streak_count)"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
        
    }
    
    
}





