//
//  ScoreVC.swift
//  quiz
//
//  Created by Karol Zmyslowski on 13.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    @IBOutlet weak var scoreLbn: UILabel!
    
    var score: Int?
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLbn.text = "\(score!)%"
    }

  
    @IBAction func buttonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "again", sender: id!)
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "again" {
            if let destination = segue.destination as? QuestionVC {
                if let item = sender as? Int {
                    destination.id = item
                }
            }
        }
    }

}
