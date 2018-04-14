//
//  FancyImage.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class FancyImage: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 7
    }
}
