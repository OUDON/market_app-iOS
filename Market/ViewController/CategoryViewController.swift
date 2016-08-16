//
//  CategoryViewController.swift
//  Market
//
//  Created by takahiro-tomita on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CategoryViewController: UITableViewController {
    var categories: [Category] = [] {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = CategoryCell.height
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoriesRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.categories = response
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as? CategoryCell else {
            fatalError("Invalid cell")
        }
        
        let category = categories[indexPath.row]
        cell.update(withCategory: category);
        
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ItemDetailsViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let item = categories[selectedIndexPath.row]
            destination.itemID = item.id
        }
    }
}
