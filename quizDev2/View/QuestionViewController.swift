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
    var numberQuestion: Int = 0
    var points: Int = 0
    var countActualQuestion: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        titleQuestion.numberOfLines = 0
        loadLayout()
    }
    
    @IBAction func getResponseOnTap(_ sender: UIButton) {
        makeRequest { (questions) in
            DispatchQueue.main.async {
                let correctResponse = questions[self.numberQuestion].response
                if sender.tag == correctResponse {
                    self.points += 1
                    sender.backgroundColor = .green
                    
                } else {
                    sender.backgroundColor = .red
                }
                
                let isLatIndex: Bool = self.countActualQuestion == questions.count ? true : false
                
                if !isLatIndex {
                    self.numberQuestion += 1
                    Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(self.loadLayout), userInfo: nil, repeats: false)
                } else {
                    print("Hello World")
                }
            }
            
        }
    }
    
    @objc func loadLayout() {
        makeRequest { (questions) in
            DispatchQueue.main.async {
                self.titleQuestion.text = questions[self.numberQuestion].title
                for button in self.buttonResponses {
                    button.sizeToFit()
                    button.backgroundColor = UIColor(red: 75/255.0, green: 140/255.0, blue: 225/255.0, alpha: 1.0)
                    let newTitleQuestion = questions[self.numberQuestion].questions[button.tag]
                    button.setTitle(newTitleQuestion, for: .normal)
                    button.layer.cornerRadius = 20
                }
                self.countActualQuestion += 1
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
