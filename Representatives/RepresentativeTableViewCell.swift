//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by JB Thompson on 9/17/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateWithRepresentative(_ representative: Representative) {
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = "District \(representative.district)"
        websiteLabel.text = representative.link
        phoneLabel.text = representative.phone
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
