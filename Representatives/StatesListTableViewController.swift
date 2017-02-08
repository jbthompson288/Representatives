//
//  StatesListTableViewController.swift
//  Representatives
//
//  Created by JB Thompson on 9/17/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import UIKit

class StatesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statesCell", for: indexPath)

        let state = StateController.states[indexPath.row]
        
        cell.textLabel?.text = state

        return cell
    }

   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? StatesDetailTableViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row {
            
            let state = StateController.states[selectedIndex]
            destinationViewController.state = state
        }
    }
}
