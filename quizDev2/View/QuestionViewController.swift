//
//  QuestionViewController.swift
//  quizDev2
//
//  Created by Arthur Duarte on 10/05/24.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var titleQuestion: UILabel!
    let numberQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }
    
    func styleView() {
        navigationItem.hidesBackButton = true
        titleQuestion.numberOfLines = 0
        titleQuestion.text =  questionsArr[numberQuestion].label
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
