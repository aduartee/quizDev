//
//  DifficultViewController.swift
//  quizDev2
//
//  Created by Arthur Duarte on 14/06/24.
//

import UIKit

class DifficultViewController: UIViewController {
    
    @IBOutlet var difficultButtons: [UIButton]!
    var chosenDifficulty: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getTagOnTap(_ sender: UIButton) {
        chosenDifficulty = difficultValue(sender: sender.tag).value
        goToQuestionView()
    }
    
    func goToQuestionView(){
        performSegue(withIdentifier: "goToQuestionView", sender: nil)
    }
    
    func styleButtons() {
        for buttons in difficultButtons {
            buttons.layer.cornerRadius = 20
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionView = segue.destination as? QuestionViewController else { return }
        questionView.chosenDifficulty = self.chosenDifficulty
    }
    
    enum difficultValue {
        case easy,
             medium,
             hard
        
        var value: Double {
            switch self {
            case .easy:
                return 1.0
            case .medium:
                return 0.7
            case .hard:
                return 0.4
            }
        }
        
        init(sender: Int) {
            switch sender {
            case 1:
                self = .easy
            case 2:
                self = .medium
            default:
                self = .hard
            }
        }        
    }
    
}
