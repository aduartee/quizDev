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
    }
    
    @IBAction func getResponseOnTap(_ sender: UIButton) {
        print("Tag of button is: \(sender.tag)")
    }
    
    func styleView() {
        navigationItem.hidesBackButton = true
        titleQuestion.numberOfLines = 0
        makeRequest { (questions) in
            DispatchQueue.main.async {
                self.titleQuestion.text = questions[self.numberQuestion].title
                for button in self.buttonResponses {
                    let newTitleQuestion = questions[self.numberQuestion].questions[button.tag]
                    button.setTitle(newTitleQuestion, for: .normal)
                }
            }
        }
    }
    
    private func makeRequest(completion: @escaping ([QuestionModel]) -> ()) {
        let url = URL(string:"https://json-questions.vercel.app/questions")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let dataResult = data else { return }
            
            do{
                let postResponse = try JSONDecoder().decode([QuestionModel].self, from: dataResult)
                completion(postResponse)
            } catch let error {
                print(error)
            }
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
