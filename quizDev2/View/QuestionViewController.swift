//
//  QuestionViewController.swift
//  quizDev2
//
//  Created by Arthur Duarte on 10/05/24.
//

import UIKit
import Foundation

class QuestionViewController: UIViewController {

    @IBOutlet weak var titleQuestion: UILabel!
    @IBOutlet var buttonResponses: [UIButton]!
    let numberQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        makeRequest()
    }
    
    @IBAction func getResponseOnTap(_ sender: UIButton) {
        print("Tag of button is: \(sender.tag)")
    }
    func styleView() {
        navigationItem.hidesBackButton = true
        titleQuestion.numberOfLines = 0
        titleQuestion.text =  questionsArr[numberQuestion].label
    }
    
    private func makeRequest() {
        let url = URL(string:"https://json-questions.vercel.app/questions")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            print(String(describing: response))
        }
        
        task.resume()
        
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
