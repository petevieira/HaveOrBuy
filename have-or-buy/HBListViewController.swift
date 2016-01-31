//
//  HBListViewController.swift
//  have-or-buy
//
//  Created by Peter Vieira on 1/18/16.
//  Copyright © 2016 rapierevite. All rights reserved.
//

import UIKit

class HBListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var names = [String]()
    let textCellIdentifier = "TextCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        dispatch_after(2) { () -> () in
//            self.tableView.beginUpdates()
//            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: .Automatic)
//            self.names.removeLast()
//            
//            self.tableView.endUpdates()
//        }
    }

}

extension HBListViewController: UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell

    }
    
}

extension HBListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        print(names[row])
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        cell.textLabel?.text = names[row]
        cell.backgroundColor = UIColor.darkGrayColor()
    }
    
}
