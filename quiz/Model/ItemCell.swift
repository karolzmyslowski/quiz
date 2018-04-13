//
//  ItemCell.swift
//  quiz
//
//  Created by Karol Zmyslowski on 10.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLbn: UILabel!
    @IBOutlet weak var subtextLbn: UILabel!
    
    func configureCell(item: Item){
        titleLbn.text = item.title
        subtextLbn.text = item.content
        getImageFromWeb(item.photoURL) { (image) in
            if let image = image {
                self.mainImage.image = image
            }
        }
    }
    
    func getImageFromWeb(_ urlString: String, closure: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: urlString) else {
            return closure(nil)
        }
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return closure(nil)
            }
            guard response != nil else {
                print("no response")
                return closure(nil)
            }
            guard data != nil else {
                print("no data")
                return closure(nil)
            }
            DispatchQueue.main.async {
                closure(UIImage(data: data!))
            }
        }; task.resume()
    }
    
}


