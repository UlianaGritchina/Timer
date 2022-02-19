//
//  TimeCounter.swift
//  Timer
//
//  Created by Ульяна Гритчина on 16.02.2022.
//

import Foundation
import Combine


enum ButtonStates {
    case start
    case wait
    case rest
}

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "START"
    var buttonState: ButtonStates = .start
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
            buttonState = .rest
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
            buttonState = .start
        } else {
            buttonTitle = "Wait..."
            buttonState = .wait
        }
        objectWillChange.send(self)
    }
}
