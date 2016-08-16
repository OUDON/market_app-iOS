//
//  RecommendItemsViewControllerTableViewController.swift
//  Market
//
//  Created by takahiro-tomita on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class RecommendItemsViewController: UITableViewController {
    var items: [Item] = [] {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = RecommendItemsRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.items = response
            case .Failure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else {
            fatalError("Invalid cell")
        }
        
        let item = items[indexPath.row]
        cell.update(withItem: item);
        
        return cell;
    }
}
