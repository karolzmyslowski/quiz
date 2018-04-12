//
//  Item.swift
//  quiz
//
//  Created by Karol Zmyslowski on 11.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation



class Item {
    
    private var _id: Int!
    
    private var _title: String!
    
    private var _content: String!
    
    private var _questions: Int!
    
    private var _photo: String!
    
    var id: Int{
        if _id == nil{
            _id = 0
        }
        return _id
    }
    
    var questions: Int{
        if _questions == nil{
            _questions = 0
        }
        return _questions
    }
    var title: String{
        if _title == nil{
            _title = ""
        }
        return _title
    }
    
    var content: String{
        if _content == nil{
            _content = ""
        }
        return _content
    }
    
    var photoURL: String{
        if _photo == nil{
            _photo = ""
        }
        return _photo
    }
    
    init(dict: Dictionary<String, AnyObject>) {
       
        if let tempIP = dict["id"] as? Int {
            self._id = tempIP
        }
        
        if let tempQ = dict["questions"] as? Int {
            self._questions = tempQ
        }
        
        if let tempTitle = dict["title"] as? String {
            self._title = tempTitle
        }
        
        if let tempContent = dict["content"] as? String {
            self._content = tempContent
        }
        if let mainPhoto = dict["mainPhoto"] as? Dictionary<String, AnyObject> {
            if let tempPhoto = mainPhoto["url"] as? String {
                self._photo = tempPhoto
            }
            
        }
    }
    
    
}
