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
    let correctQuestionText: String?
}

func shuffledQuestions(_ question: QuestionModel) -> QuestionModel {
    // Get the original index of Question, example:
    // ["A playlist of songs", "A data structure where each element has a reference to the next element in the list", "A shopping list"]
    // This function return this : [0: A playlist of songs", 1: A data structure, 2: A shopping list ]
    var indexedQuestion = question.questions.enumerated().map { (index, element) in (index: index, question: element)
    }
    
    // Shuffled the order of elements in array
    // The new array is like this: [1: A data structure, 0: A playlist of songs", 2: A shopping list ]
    indexedQuestion.shuffle()
    
    // Get the element is equal a respose of the original obj
    // Example: Index Original Response -> [response: 1], questions shuffled: [1: A data structure, 0: A playlist of songs", 2: A shopping list], Result of let -> 1: A data structure
    let newCorrectIndex = indexedQuestion.first { $0.index == question.response}!.index
    let testQuestion = indexedQuestion.first { $0.index == question.response}!.question
    // Get the string Questions shuffled
    let shuffledQuestions = indexedQuestion.map { $0.question}

    return QuestionModel(title: question.title, questions: shuffledQuestions, response: newCorrectIndex, correctQuestionText: testQuestion)
}
