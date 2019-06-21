//
//  MEINVModelManager.swift
//  MEINV
//
//  Created by shuxia on 2019/6/13.
//  Copyright © 2019 TKT. All rights reserved.
//

import UIKit
import HandyJSON
class MEINVModelManager: NSObject {
    
    
    class func GETQuestionArr(imageName:String) ->Array<QuestionModel>{
        let dic = MEINVManager.getJSON(resource: "catgoryInfo") as! [String:Any]
        
        let QArr = dic[imageName] as! Array<AnyObject>
        
        var questionArr:[QuestionModel] = []

        //:遍历数组
        for  modeD in QArr {
            let model = JSONDeserializer<QuestionModel>.deserializeFrom(dict: (modeD as! NSDictionary))
            
            questionArr.append(model!)
            
        }
        return questionArr
    }

}
