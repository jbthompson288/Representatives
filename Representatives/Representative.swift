//
//  Representative.swift
//  Representatives
//
//  Created by JB Thompson on 9/17/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation

class Representative {
    
    fileprivate let nameKey = "name"
    fileprivate let partyKey = "party"
    fileprivate let stateKey = "state"
    fileprivate let districtKey = "district"
    fileprivate let phoneKey = "phone"
    fileprivate let officeKey = "office"
    fileprivate let linkKey = "link"
    
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    
    init?(jsonDictionary: [String: AnyObject]) {
        guard let name = jsonDictionary[nameKey] as? String,
            let party = jsonDictionary[partyKey] as? String,
            let state = jsonDictionary[stateKey] as? String,
            let district = jsonDictionary[districtKey] as? String,
            let phone = jsonDictionary[phoneKey] as? String,
            let office = jsonDictionary[officeKey] as? String,
            let link = jsonDictionary[linkKey] as? String else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
}
