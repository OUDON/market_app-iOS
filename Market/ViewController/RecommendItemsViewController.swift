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
    let items: [Item] = [
        Item(id: 1, name: "おたま", desc: "おたまです", price: 100, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 2, name: "しゃもじ", desc: "しゃもじです", price: 200, imageURL: NSURL(string: "http://example.com")!),
        Item(id: 3, name: "菜箸", desc: "菜箸です", price: 300, imageURL: NSURL(string: "http://example.com")!),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = RecommendItemsRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                print(response)
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
