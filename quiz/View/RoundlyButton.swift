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
    

}
