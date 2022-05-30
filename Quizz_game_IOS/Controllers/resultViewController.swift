//
//  resultViewController.swift
//  Quizz_game_IOS
//
//  Created by Amir Malamud on 30/05/2022.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var scoreView: UIButton!
    var score=0
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreView.setTitle("Your Score:\(String(score))", for: .normal)
        


    }
    
    @IBAction func startOverBtn(_ sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startOver), userInfo: nil, repeats: false)
    }
    
    @objc func startOver(){
        self.performSegue(withIdentifier: "StartOver", sender: self)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
