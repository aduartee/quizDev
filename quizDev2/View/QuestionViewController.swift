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
    @IBOutlet weak var fadeView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    var numberQuestion: Int = 0
    var points: Int = 0
    var countActualQuestion: Int = 0
    var totalQuestions:Int = 0
    var loadedQuestions: [QuestionModel] = []
    var timer = Timer()
    var initialTimer:Int = 10
    var pauseTimer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showLoad(true)
        makeRequest { (questions) in
            DispatchQueue.main.async {
                self.loadedQuestions = questions
                self.loadLayout()
                self.showLoad(false)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadAllQuestions()
    }
    
    func reloadAllQuestions() {
        makeRequest { (questions) in
            DispatchQueue.main.async {
                self.loadedQuestions = questions
                self.numberQuestion = 0
                self.points = 0
                self.countActualQuestion = 0
                self.totalQuestions = 0
                self.loadLayout()
                self.showLoad(false)
            }
        }
    }
    
    func callingTimer() {
        timer.invalidate()
        initialTimer = 11
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(countTimer)), userInfo: nil, repeats: true)
        countTimer()
    }
    
    @objc func countTimer() {
        if(initialTimer > 1) {
            initialTimer -= 1
            animateInLabelTransition(newLabel: String(initialTimer), newColor: .white)
        } else {
            timer.invalidate()
            setButtonsEnabled(false)
            animateInLabelTransition(newLabel: "Acabou o tempo", newColor: .red)
            goToNextQuestion()
        }
    }
    
    
    func goToNextQuestion() {
        if numberQuestion < loadedQuestions.count - 1 {
            numberQuestion += 1
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadLayout), userInfo: nil, repeats: false)
        }
    }
    
    func animateInLabelTransition(newLabel: String, newColor: UIColor) -> Void {
        UIView.transition(with: timerLabel, duration: 0.2, options: .transitionFlipFromTop, animations: {
            self.timerLabel.text = newLabel
            self.timerLabel.textColor = newColor
        })
    }
    
    func showLoad(_ show: Bool) {
        if show {
            fadeIn()
        } else {
            fadeOut()
        }
    }
    
    @IBAction func getResponseOnTap(_ sender: UIButton) {
        let shuffledQuestions = loadedQuestions[numberQuestion].questions
        guard let correctQuestionText = loadedQuestions[numberQuestion].correctQuestionText else { return }
        let isCorrect:Bool = shuffledQuestions[sender.tag] == correctQuestionText
        
        if isCorrect {
            points += 1
            sender.backgroundColor = .green
            timer.invalidate()
            animateInLabelTransition(newLabel: String(initialTimer), newColor: .green)
        } else {
            sender.backgroundColor = .red
            timer.invalidate()
            animateInLabelTransition(newLabel: String(initialTimer), newColor: .red)
        }
        
        let isLatIndex: Bool = countActualQuestion == loadedQuestions.count ? true : false
        totalQuestions = loadedQuestions.count
        setButtonsEnabled(false)
        
        if !isLatIndex {
            numberQuestion += 1
            Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(loadLayout), userInfo: nil, repeats: false)
        } else {
            goToRankingView()
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.2, completion: ((Bool) -> Void)? = nil  ) {
        UIView.animate(withDuration: duration, animations: {
            self.fadeView.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.fadeView.alpha = 0.0
        }, completion: completion)
    }
    
    func setButtonsEnabled(_ enabled: Bool) {
        for button in buttonResponses {
            button.isEnabled = enabled
        }
    }
    
    func goToRankingView() {
        performSegue(withIdentifier: "goToRankingView", sender: nil)
    }
    
    @objc func loadLayout() {
        callingTimer()
        titleQuestion.numberOfLines = 0
        print(numberQuestion)
        print(countActualQuestion)
        titleQuestion.text = loadedQuestions[numberQuestion].title
        for button in self.buttonResponses {
            button.sizeToFit()
            button.backgroundColor = UIColor(red: 75/255.0, green: 140/255.0, blue: 225/255.0, alpha: 1.0)
            let newTitleQuestion = loadedQuestions[numberQuestion].questions[button.tag]
            button.setTitle(newTitleQuestion, for: .normal)
        }
        countActualQuestion += 1
        setButtonsEnabled(true)
        isTheLastQuestion()
    }
    
    func isTheLastQuestion(){
        let isLatIndex: Bool = countActualQuestion == loadedQuestions.count ? true : false
        totalQuestions = loadedQuestions.count

        if isLatIndex {
            goToRankingView()
        }
    }
    
    private func makeRequest(completion: @escaping ([QuestionModel]) -> ()) {
        let url = URL(string:"https://json-questions.vercel.app/questions")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let dataResult = data else { return }
            
            do{
                let postResponse = try JSONDecoder().decode([QuestionModel].self, from: dataResult)
                
                let shuffleQuestions = postResponse.map { shuffledQuestions($0) }
                completion(shuffleQuestions)
                
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let rankingView = segue.destination as? RankingViewController
        else {return}
        rankingView.totalPoints = points
        rankingView.totalQuestions = totalQuestions
    }
}
