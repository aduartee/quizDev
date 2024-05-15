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
