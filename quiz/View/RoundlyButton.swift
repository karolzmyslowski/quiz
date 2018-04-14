//
//  RoundlyButton.swift
//  quiz
//
//  Created by Karol Zmyslowski on 13.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class RoundlyButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 2
    }
    

    func reset() {
            self.setTitle("", for: .normal)
            self.isEnabled = false
            self.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
            self.layer.shadowOpacity = 0
            self.layer.borderWidth = 0
        
    }
    
    func present(){
        self.isEnabled = true
        self.backgroundColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 1)
        self.layer.shadowOpacity = 0.8
        self.layer.borderWidth = 0
        self.layer.shadowColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 0.6).cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.cornerRadius = 5
    }
}
