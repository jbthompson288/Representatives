//
//  RepresentativeController.swift
//  Representatives
//
//  Created by JB Thompson on 9/17/16.
//  Copyright © 2016 JB Thompson. All rights reserved.
//

import Foundation

class RepresentativeController {

 static let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    static func searchRepsByState (_ state: String, completion: @escaping (_ representatives: [Representative]) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion([])
            return
        }
        
        let urlParameters = ["state": "\(state)", "output": "json"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            guard let data = data,
                let json = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: AnyObject],
                let representativeDictionaries = json["results"] as? [[String: AnyObject]] else {
                    
                    print("unable to serialize json")
                    completion([])
                    return
            }
            let representatives = representativeDictionaries.flatMap { Representative(jsonDictionary: $0) }
            
            completion(representatives)
        }
        
        
    }
    
    
    
    
    
}
