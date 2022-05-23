//
//  Quiz.swift
//  HW2_QuizGame
//
//  Created by Amir Malamud on 15/05/2022.
//

import Foundation
import UIKit

struct Quizz{
    
    var questionNumber = 0
    var score = 0
    let dataURL = "https://api.jsonbin.io/b/628b7222402a5b3802099b9f/3"
    var quiz =
    [Question( url:"a" , a:["a","b","c","d"] , correctAnswer:"a"),
     Question( url:"a" , a:["a","b","c","d"] , correctAnswer:"a"),
    ]
    
    init(){
    }


    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
