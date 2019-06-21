//
//  UserProtocolViewController.swift
//  MEINV
//
//  Created by shuxia on 2019/6/16.
//  Copyright © 2019 TKT. All rights reserved.
//

import UIKit

class UserProtocolViewController: UIViewController {

    var user = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let imageView = UIWebView.init(frame: view.bounds)
        imageView.backgroundColor = UIColor.white
        
        view.addSubview(imageView)
        
        let imageUrl  = URL.init(string: user)
        
        let imageResource = URLRequest.init(url: imageUrl!)
        
        imageView.loadRequest(imageResource)
        
    }
}
