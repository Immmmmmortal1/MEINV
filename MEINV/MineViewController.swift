//
//  MineViewController.swift
//  MEINV
//
//  Created by shuxia on 2019/6/21.
//  Copyright © 2019 TKT. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    
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
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
    
}
