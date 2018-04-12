//
//  Answers.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation


class Answer {
    
    private var _text: String!
    private var _isCorrect: Bool!
    
    var text:String {
        if _text == nil {
            _text = ""
        }
        return _text
    }
    
    var isCorrect:Bool {
        if _isCorrect == nil {
            _isCorrect = false
        }
        return _isCorrect
    }
    
    init(text:String, isCorrect: Bool){
        self._text = text
        self._isCorrect = isCorrect
    }
}
