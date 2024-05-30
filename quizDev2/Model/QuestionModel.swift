//
//  QuestionModel.swift
//  quizDev2
//
//  Created by Arthur Duarte on 10/05/24.
//

import Foundation

struct QuestionModel: Codable {
    let title: String
    let questions: [String]
    let response: Int
}

//struct ShuffledQuestion {
//    let title: String
//    let questions: [String]
//    let response: Int
//}
//
//func shuffledQuestions(_ question: QuestionModel) -> ShuffledQuestion {
//    var indexedQuestion = question.questions.enumerated().map { (index, element) in (index: index, question: element)
//    }
//    
//    indexedQuestion.shuffle()
//    let shuffledQuestions = indexedQuestion.map { $0.question}
//    let newCorrectIndex = indexedQuestion.first { $0.index == question.response}
//    
//    
//}
