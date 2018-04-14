//
//  QuestionVC.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import Alamofire

class QuestionVC: UIViewController, ScoreVCDelegate{

    @IBOutlet weak var counterLbn: UILabel!
    @IBOutlet weak var scoreLbn: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var questionLbn: UILabel!
    
    @IBOutlet var buttons: [RoundlyButton]!
    @IBOutlet var labels: [UILabel]!
    
    var questions: [Question] = []
    var questionNumber:Int = 0
    var score: Int = 0
    var correctAnswer: Int = 0
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton()
        score = 0
        correctAnswer = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        questions = []
        resetButton()
        score = 0
        correctAnswer = 0
        questionNumber = 0
        downloadQuestions {
            self.updateQuestion()
            self.updateUI()
        }
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
        
        }
        resetButton()
        questionNumber += 1
        updateQuestion()
        if questionNumber == questions.count{
            let senderScore = (score * 1000) / (questions.count * 10)
            let sender = [senderScore, id!]
            performSegue(withIdentifier: "toScore", sender: sender)
        }
    }
    
    // MARK: - JSON Parsing
    
    func downloadQuestions(completed: @escaping DownloadComplete) {
        let dataURL = URL(string: questionsURL(id: id!))!
        Alamofire.request(dataURL).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                
                if let items = dict["questions"] as? [Dictionary<String,AnyObject>] {
                    for obj in items {
                        let question = Question(dict: obj)
                        self.questions.append(question)
                        
                    }
                }
            }
            completed()
        }
        
    }
    
    func updateQuestion(){
        
        if questionNumber < questions.count {
            
            do {
                if let url = URL(string: questions[questionNumber].imageURL){
                    let data = try Data(contentsOf: url)
                    self.image.image = UIImage(data: data)
                } else {
                     image.image = UIImage(named: "5a3698262003f3.5250149315135273341311")
                }
            }
            catch   {}
            
            questionLbn.text = questions[questionNumber].text
            
            for i in 0..<questions[questionNumber].answers.count {
                presentButton(i: i)
                if questions[questionNumber].answers[i].isCorrect {
                    correctAnswer = 1 + i
                    print(correctAnswer)
                }
            }
            updateUI()
        }
    }
    
    func updateUI() {
            scoreLbn.text = "Wynik: \(score)"
            counterLbn.text = "\(questionNumber + 1)/\(questions.count)"
            progressView.frame.size.width = ((view.frame.size.width - 16) / CGFloat(questions.count))  * CGFloat(questionNumber + 1)
        
    }
    
    func restartUI(){
        score = 0
        questionNumber = 0
         image.image = UIImage(named: "5a3698262003f3.5250149315135273341311")
        updateQuestion()
        
    }
    
    func presentButton(i: Int){
        buttons[i].present()
        labels[i].text = questions[questionNumber].answers[i].text
    }
    
    func resetButton(){
        for i in 0...3 {
            buttons[i].reset()
            labels[i].text = ""
        }
    }
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScore" {
            if let destination = segue.destination as? ScoreVC {
                if let item = sender as? [Int] {
                    destination.score = item[0]
                    destination.id = item[1]
                }
            }
        }
    }
    
    func id(controller: ScoreVC, id: Int) {
        self.id = id
    }

}
