//
//  ViewController.swift
//  HW2_QuizGame
//
//  Created by Amir Malamud on 09/05/2022.
//

import UIKit

class quizController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btn_A: UIButton!
    @IBOutlet weak var btn_B: UIButton!
    @IBOutlet weak var btn_C: UIButton!
    @IBOutlet weak var btn_D: UIButton!
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var life: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    var quiz = Quizz()
    var lifeData = 3
    

    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        updateUI()
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        
              let userAnswer = sender.currentTitle!
              let userGotItRight = quiz.checkAnswer(userAnswer: userAnswer)

              if userGotItRight {
                  sender.backgroundColor = UIColor.green
              } else {
                  sender.backgroundColor = UIColor.red
                  updateLife()
              }

              quiz.nextQuestion()
              Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    func updateLife() {
        lifeData-=1
        if(lifeData==0){
             goToResult()
        }
        life.text = "x\(String(lifeData))"
    }

    @objc func updateUI() {
        updateBtnUI()
        updateProgressUI()
        updateImgUI()
        updateScoreUI()
    }
    
    func updateBtnUI(){
        let answerChoices = quiz.getAnswers()!

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
       mainImg.loadFrom(URLAddress: quiz.getUrl()!)
   }
    func updateProgressUI(){
        progressBar.progress = quiz.getProgress()
        if(quiz.questionNumber == 14){
            goToResult()
        }

    }
    func goToResult(){
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    func updateScoreUI(){
        score.text = " \(quiz.getScore())/15"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultVC = segue.destination as! resultViewController
            resultVC.score = quiz.score!
        }
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



