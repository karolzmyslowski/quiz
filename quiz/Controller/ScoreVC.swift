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
    @IBOutlet weak var contentLbn: UILabel!
    
    var score: Int?
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLbn.text = "\(score!)%"
        setContentText()
    }

  
    @IBAction func buttonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "again", sender: id!)
    
    }
    
    func setContentText() {
        if score! < 20 {
            contentLbn.text = "Słabiutko"
            return
        } else if score! < 40 {
            contentLbn.text = "Chyba się nie przyłożyłeś"
            return
        } else if score! < 60 {
            contentLbn.text = "Stać Cię na wiecej"
        } else if score! < 80 {
            contentLbn.text = "Brawo!"
        } else if score! < 101 {
            contentLbn.text = "Super!"
        }
        
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
