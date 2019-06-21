//
//  Sounds.swift
//  MEINV
//
//  Created by shuxia on 2019/6/16.
//  Copyright © 2019 TKT. All rights reserved.
//

import Foundation
import AFNetworking

class SoundsFile: AFHTTPSessionManager {
    
    
    static let tools: SoundsFile = {
        
        let baseUrl = NSURL.init(string: "http://appid.aigoodies.com/getAppConfig.php")
        let t = SoundsFile.init(baseURL: baseUrl! as URL  ,sessionConfiguration:URLSessionConfiguration.default)
        t.responseSerializer.acceptableContentTypes = NSSet.init(objects: "application/json", "text/json", "text/javascript","text/plain","text/html") as? Set<String>
        return t
    }()
    
    
    class func shareNetWorkTools() ->SoundsFile {
        return tools
    }
    
    
}
