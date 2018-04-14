//
//  FancyView.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.borderWidth = 2
        layer.cornerRadius = 5
        layer.borderColor = UIColor(red: 86/255, green: 146/255, blue: 183/255, alpha: 1).cgColor
    }

}
