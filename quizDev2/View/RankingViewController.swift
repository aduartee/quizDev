//
//  RankingViewController.swift
//  quizDev2
//
//  Created by Arthur Duarte on 22/05/24.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet weak var labelCorrectText: UILabel!
    @IBOutlet weak var labelPercent: UILabel!
    var totalPoints:Int = 0
    var totalQuestions:Int = 0
    
    @IBOutlet weak var iconEmoji: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    func styleView() {
        navigationItem.hidesBackButton = true
        labelCorrectText.numberOfLines = 0
        labelPercent.numberOfLines = 0
        labelCorrectText.text = "You got \(totalPoints) out of \(totalQuestions) questions right"
        let resultLabels = makesPorcentAvarage(totalPoints, totalQuestions)
        labelPercent.text = resultLabels.0
        iconEmoji.text = resultLabels.1
    }
    
    func makesPorcentAvarage(_ points: Int, _ totalQuestions:Int) -> (String, String) {
        let porcent = ((points * 100) / totalQuestions)
        let enumRankingMessage = QuizResult(percent: porcent)
        return (enumRankingMessage.message, enumRankingMessage.emoji)
    }
    
    enum QuizResult {
        case perfect,
             veryGood,
             good,
             average,
             poor,
             terrible,
             fail
        
        init(percent: Int) {
            switch percent {
            case 100:
                self = .perfect
            case 80..<100:
                self = .veryGood
            case 60..<80:
                self = .good
            case 25..<60:
                self = .average
            case 10..<25:
                self = .poor
            case 1..<10:
                self = .terrible
            default:
                self = .fail
            }
        }
        
        var message: String {
            switch self {
            case .perfect:
                return "Got all the questions right! Congratulations!"
            case .veryGood:
                return "Got many questions right. Very good!"
            case .good:
                return "Got some questions right. Good job!"
            case .average:
                return "Got a few questions right. Can improve!"
            case .poor:
                return "Got a few questions right. Keep practicing!"
            case .terrible:
                return "Got almost nothing right. Keep practicing and try again!"
            case .fail:
                return "Got all the questions wrong, try again..."
            }
        }
        
        var emoji: String {
            switch self {
            case .perfect:
                return "👑"
            case .veryGood:
                return "🤓"
            case .good:
                return "🙂"
            case .average:
                return "😐"
            case .poor:
                return "😞"
            case .terrible:
                return "😶"
            case .fail:
                return "😭"
            }
            
        }
    }
}
