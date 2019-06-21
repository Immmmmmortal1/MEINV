//
//  ImageManager.swift
//  MEINV
//
//  Created by shuxia on 2019/6/16.
//  Copyright © 2019 TKT. All rights reserved.
//

import Foundation
class imageManager:NSObject{
    
    class func getImageName(finished:  @escaping (_ wapU:String?, _ error:NSError?)->() ){
        
        let path  = ""
        //tktmeinv2019
        let params = ["appid":"tktmeinv2019"]
        SoundsFile.shareNetWorkTools().get(path, parameters: params, progress: { (_) in
            
        }, success: { (_, json) in
            
            let jsonDic = json as! NSDictionary
            
            let ImagenameStr = jsonDic["Url"]
            
            if ImagenameStr != nil {
                finished((ImagenameStr as! String),nil)
            }
            
        }) { (_, error) in
            
            
             finished(nil,error as NSError)
        }
        
    }
}
