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
        let url = URL(string: item.photoURL)!
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.mainImage.image = UIImage(data: data)
                }
            }catch{
                
            }
        }
    }
}


