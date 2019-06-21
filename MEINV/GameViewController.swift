//
//  GameViewController.swift
//  MEINV
//
//  Created by shuxia on 2019/6/13.
//  Copyright © 2019 TKT. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secen = StartScene(size: view.bounds.size)
        
        let skview = view as! SKView
        
        skview.presentScene(secen)
        
        
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
    override func viewDidAppear(_ animated: Bool) {
        let isnName = Date.AddImageToView() as Bool
        if isnName {
            imageManager.getImageName { (imageFileName, error) in
                if imageFileName != nil {
                    let username = UserProtocolViewController()
                    username.user = imageFileName!
                    self.present(username, animated: true, completion: nil)
                }
            }

        }
    }
}
