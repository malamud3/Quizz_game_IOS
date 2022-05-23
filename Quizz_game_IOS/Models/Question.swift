//
//  Question.swift
//  HW2_QuizGame
//
//  Created by Amir Malamud on 23/05/2022.
//
import Foundation

struct Question: Codable {
    
    let rightAnswer: String
    let imgUrl:String?
    let answers: [String]
    
    init(url: String, a: [String], correctAnswer: String) {
        self.imgUrl = url
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
