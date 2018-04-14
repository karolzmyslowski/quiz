//
//  ScoreVC.swift
//  quiz
//
//  Created by Karol Zmyslowski on 13.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

protocol ScoreVCDelegate {
    func id(controller: ScoreVC, id: Int)
}

class ScoreVC: UIViewController {

    @IBOutlet weak var scoreLbn: UILabel!
    @IBOutlet weak var contentLbn: UILabel!
    
    var score: Int?
    var id: Int?
    var delegate: ScoreVCDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLbn.text = "\(score!)%"
        setContentText()
    }

    
    @IBAction func gotoRootView(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        delegate?.id(controller: self, id: id!)
        navigationController?.popViewController(animated: true)
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
    

}


