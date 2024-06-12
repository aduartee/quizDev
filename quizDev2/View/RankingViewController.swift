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
        labelCorrectText.text = "Você acertou \(totalPoints) de \(totalQuestions) Questões"
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
                return "Acertou todas as questões! Parabéns!"
            case .veryGood:
                return "Acertou muitas questões. Muito bom!"
            case .good:
                return "Acertou algumas questões. Bom trabalho!"
            case .average:
                return "Acertou poucas questões. Pode melhorar!"
            case .poor:
                return "Acertou poucas questões. Continue praticando!"
            case .terrible:
                return "Acertou quase nada. Continue praticando e tente novamente!"
            case .fail:
                return "Errou todas as questões, tente novamente..."
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
