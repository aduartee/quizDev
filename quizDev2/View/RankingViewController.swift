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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    func styleView() {
        navigationItem.hidesBackButton = true
        labelCorrectText.text = "\(totalPoints)"
        labelCorrectText.text = "\(totalQuestions)"
    }

}
