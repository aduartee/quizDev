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
        let percentText = makesPorcentAvarage(totalPoints, totalQuestions)
        labelPercent.text = percentText
    }
    
    func makesPorcentAvarage(_ points: Int, _ totalQuestions:Int) -> String {
        let porcent = ((points * 100) / totalQuestions)
        if porcent <= 50 {
            iconEmoji.text = "🫤"
        }
        return "Acertou \(porcent)% das questões"
    }

}
