//
//  Question.swift
//  quiz
//
//  Created by Karol Zmyslowski on 12.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation


class Question {
    
    
    private var _imageURL: String!
    private var _isCorrect: Bool!
    private var _text:String!
    private var _order: Int!
    
    var imageURL:String {
        if _imageURL == nil {
            _imageURL = ""
        }
            return _imageURL
    }
    
    var isCorrect:Bool {
        if _isCorrect == nil {
            _isCorrect = false
        }
        return _isCorrect
        
    }
    
    var text:String {
        if _text == nil {
            _text = ""
        }
        return _text
    }

    var order:Int {
        if _order == nil {
            _order = 0
        }
        return _order
    }
    
    var answers:[Answer] = []
    
     init(dict: Dictionary<String, AnyObject>) {
        
        if let image = dict["image"] as? Dictionary<String, AnyObject> {
            if let tempImageURL = image["url"] as? String {
                self._imageURL = tempImageURL
            }
        }
        
        if let tempAnswers = dict["answers"] as? [Dictionary<String, AnyObject>] {
            
            for obj in tempAnswers {
                
                var answerTest: String!
                var answerIsCorrect: Bool!
                
                if let tempText = obj["text"] as? String {
                    answerTest = tempText
                } else if let tempText = obj["text"] as? Int{
                    answerTest = String(tempText)
                } else {
                    answerTest = ""
                }
                
                if let tempIC = obj["isCorrect"] as? Int {
                    if tempIC == 1 {
                         answerIsCorrect = true
                    }
                } else {
                    answerIsCorrect = false
                }
                let answer = Answer(text: answerTest, isCorrect: answerIsCorrect)
                answers.append(answer)
            }
        }
        if let tempText = dict["text"] as? String {
            _text = tempText
        }
    }
}
