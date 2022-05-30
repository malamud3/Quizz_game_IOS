//
//  Quiz.swift
//  HW2_QuizGame
//
//  Created by Amir Malamud on 15/05/2022.
//

import UIKit

struct Quizz: Codable{
    
    var questionNumber:Int? = 0
    var score:Int? = 0
    var Question:[Question]? = []
   

    func getAnswers() -> [String]!  {
        
        return Question?[questionNumber!].answers!
    }

    func getUrl() -> String! {
        return Question?[questionNumber!].imgUrl!
    }



    func getProgress() -> Float {
        return Float(questionNumber!) / Float(Question!.count)
    }

    mutating func getScore() -> Int {
        return score!
    }

     mutating func nextQuestion() {

        if questionNumber! + 1 < Question!.count {
            questionNumber! += 1
        } else {
            questionNumber! = 0
        }
    }

    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == Question?[questionNumber!].rightAnswer {
            score! += 1
            return true
        } else {
            return false
        }
    }

}
