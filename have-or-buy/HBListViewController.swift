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

    var listItems = [String]()
    let textCellIdentifier = "TextCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        dispatch_after(2) { () -> () in
//            self.tableView.beginUpdates()
//            self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: .Automatic)
//            self.listItems.removeLast()
//            
//            self.tableView.endUpdates()
//        }
    }

}

extension HBListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as UITableViewCell

    }
    
}

extension HBListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.green
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = (indexPath as NSIndexPath).row
        print(listItems[row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = (indexPath as NSIndexPath).row
        cell.textLabel?.text = listItems[row]
    }
    
}
