//
//  TimerModel.swift
//  quizDev2
//
//  Created by Arthur Duarte on 09/06/24.
//

import Foundation
import UIKit

struct TimerModel {
    var totalTime: Int = 10
    var timeRemaning: Int = 10
    var timer: Timer?
    var viewController: QuestionViewController?

    
    init() {
        self.timeRemaning = self.totalTime
    }
    
    mutating func startTimer() {
        timer?.invalidate()
        timeRemaning = totalTime
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            var mutableSelf = self
            mutableSelf.updateTimer()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    mutating private func updateTimer() -> Void {
        if(timeRemaning > 0) {
            timeRemaning -= 1
        } else {
            stopTimer()
            print("Time's up!")
        }
    }
}

