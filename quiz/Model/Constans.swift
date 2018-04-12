//
//  Constans.swift
//  quiz
//
//  Created by Karol Zmyslowski on 11.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import Foundation


let ITEMS_URL = "http://quiz.o2.pl/api/v1/quizzes/0/100"

typealias DownloadComplete = () -> ()

func questionsURL(id: Int) -> String {
    return "http://quiz.o2.pl/api/v1/quiz/\(id)/0"
}
