//
//  ViewController2.swift
//  Quizz_game_IOS
//
//  Created by Amir Malamud on 23/05/2022.
//

import UIKit

class startController: UIViewController {

    var secRemaining = 5
    var timer = Timer()
    var timeText = ""
    @IBOutlet weak var Start_btn: UIButton!
    var data = Quizz()
    let quizURL = "https://api.jsonbin.io/b/62921a3c402a5b380211c78a/6"
    var flag=true
    override func viewDidLoad() {
        super.viewDidLoad()
        performRequest()
        view.backgroundColor = .systemBlue
    }
    
    @IBAction func Start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secRemaining>0 {
            secRemaining-=1
            timeText = "time left: \(secRemaining)"
            Start_btn.setTitle(timeText, for: .normal)
            
        }
        else if(flag==true){
            self.timer.invalidate()
            flag=false
            self.performSegue(withIdentifier: "startQuiz", sender: self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startQuiz"{
            let quizVC = segue.destination as! quizController
            quizVC.quiz = data
        }
    }
    
    
    
    func performRequest() {
       if let url = URL(string: self.quizURL) {
           let session = URLSession.shared
           let task = session.dataTask(with: url) { (data, response, error) in
                   if error != nil {
                       return
                   }
               self.parseJSON(data!)
           }
           task.resume()
       }
   }
    
   
   func parseJSON(_ data: Data) {
       let decoder = JSONDecoder()
       do {
           let decodedData = try decoder.decode(Quizz.self, from: data)
           let questionNumber = decodedData.questionNumber!
           let score = decodedData.score!
           let question = decodedData.Question!
           self.data = Quizz(questionNumber: questionNumber, score: score, Question: question)
          
       } catch {
           return
       }
   }
    
}
