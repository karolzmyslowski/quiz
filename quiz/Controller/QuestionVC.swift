//
//  QuestionVC.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import Alamofire
class QuestionVC: UIViewController {

    @IBOutlet weak var counterLbn: UILabel!
    @IBOutlet weak var scoreLbn: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var questionLbn: UILabel!
    
    
    
    
    
    @IBOutlet var buttons: [UIButton]!
    
    var questions: [Question] = []
    var questionNumber:Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadQuestions {
            // Update UI
            self.updateQuestion()
        }
        
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            
        } else if sender.tag == 2 {
            
        }else if sender.tag == 3 {
            
        }else if sender.tag == 4 {
            
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
        
            do {
                if let url = URL(string: questions[questionNumber].imageURL){
                     let data = try Data(contentsOf: url)
                    self.image.image = UIImage(data: data)
                }
            }catch{
        }
        
        questionLbn.text = questions[questionNumber].text
        
        for i in 0..<questions[questionNumber].answers.count {
            buttons[i].setTitle(questions[questionNumber].answers[i].text, for: .normal)
            if questions[questionNumber].answers[i].isCorrect {
                selectedAnswer = 1 + i
                print(selectedAnswer)
            }
        }
        
      
    }
    
    func updateUI() {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}