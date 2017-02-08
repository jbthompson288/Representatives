//
//  StatesDetailTableViewController.swift
//  Representatives
//
//  Created by JB Thompson on 9/17/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import UIKit

class StatesDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
           
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            RepresentativeController.searchRepsByState(state) { (representatives) in
                
                self.representatives = representatives
                
                DispatchQueue.main.async(execute: { 
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                })
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell ?? RepresentativeTableViewCell()

        let representative = representatives[indexPath.row]
        
        cell.updateWithRepresentative(representative)
        
        return cell
    }
}
