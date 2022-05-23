//
//  ViewController.swift
//  HW2_QuizGame
//
//  Created by Amir Malamud on 09/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btn_A: UIButton!
    @IBOutlet weak var btn_B: UIButton!
    @IBOutlet weak var btn_C: UIButton!
    @IBOutlet weak var btn_D: UIButton!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    
    var quiz = Quizz()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
 

    }

    @IBAction func btnPressed(_ sender: UIButton) {

              let userAnswer = sender.currentTitle!
              let userGotItRight = quiz.checkAnswer(userAnswer: userAnswer)
              
              if userGotItRight {
                  sender.backgroundColor = UIColor.green
              } else {
                  sender.backgroundColor = UIColor.red
              }
      
              quiz.nextQuestion()
              
              Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    

    
    @objc func updateUI() {
        updateBtnUI()
        updateProgressUI()
        updateImgUI()
    }
    func updateBtnUI(){
        let answerChoices = quiz.getAnswers()
        btn_A.setTitle(answerChoices[0], for: .normal)
        btn_B.setTitle(answerChoices[1], for: .normal)
        btn_C.setTitle(answerChoices[2], for: .normal)
        btn_D.setTitle(answerChoices[3], for: .normal)
        btn_A.backgroundColor = UIColor.clear
        btn_B.backgroundColor = UIColor.clear
        btn_C.backgroundColor = UIColor.clear
        btn_D.backgroundColor = UIColor.clear
    }
    func updateImgUI(){
       mainImg.layer.borderWidth = 1
       mainImg.layer.masksToBounds = false
       mainImg.layer.borderColor = UIColor.black.cgColor
       mainImg.layer.cornerRadius = mainImg.frame.height/2
       mainImg.clipsToBounds = true
       mainImg.loadFrom(URLAddress: "https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM=")
   }
    func updateProgressUI(){
        progressBar.progress = quiz.getProgress()

    }
  
}



extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
