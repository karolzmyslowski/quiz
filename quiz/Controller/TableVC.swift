//
//  TableVC.swift
//  quiz
//
//  Created by Karol Zmyslowski on 10.04.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import UIKit
import Alamofire

class TableVC: UITableViewController {

    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadData {
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemCell {
            let item = items[indexPath.row]
            cell.configureCell(item: item)
            
            
            return cell
        }
        else {
            return ItemCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
 
    
    func downloadData(completed: @escaping DownloadComplete) {
        let dataURL = URL(string: ITEMS_URL)!
        Alamofire.request(dataURL).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                
                if let items = dict["items"] as? [Dictionary<String,AnyObject>] {
                    for obj in items {
                        let item = Item(dict: obj)
                        self.items.append(item)
                    }
                }
            }
            completed()
        }
        
    }
    
}




