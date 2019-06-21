//
//  MEINVManager.swift
//  MEINV
//
//  Created by shuxia on 2019/6/13.
//  Copyright © 2019 TKT. All rights reserved.
//

import Foundation

class MEINVManager: NSObject {
    
    class func getJSON(resource: String) -> Any{
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                return jsonResult
            } catch {
                // maybe lets throw error here
                return []
            }
        }
        return []
    }
}
