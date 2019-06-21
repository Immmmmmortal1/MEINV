//
//  StartScene.swift
//  MEINV
//
//  Created by shuxia on 2019/6/15.
//  Copyright © 2019 TKT. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartScene: SKScene {
    
    var startBtn:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        createBackNode()
        createClothesNode()
        createStartBtn()
//        initBgMusic()
    }
    //:播放背景音乐
    func initBgMusic(){
        let AOBgMusic = SKAudioNode(fileNamed: "startMusic")
        AOBgMusic.autoplayLooped = true
        addChild(AOBgMusic)
    }
    //:创建背景 Node
    func createBackNode()  {
        
        let scale = view!.frame.height/1448
        
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "startBack"),size: CGSize(width:1024*scale , height: view!.frame.height))
        backNode.zPosition = -1
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(backNode)
    }
    //:创建衣服
    func createClothesNode()  {
        
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "sai"),size: CGSize(width:200 , height: 200))
        backNode.zPosition = 0
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(backNode)
    }
    //:创建 开始按钮startBtn
    func createStartBtn()  {
        startBtn = SKSpriteNode(texture: SKTexture(imageNamed: "startBtn"),size: CGSize(width:100 , height: 100))
        startBtn.zPosition = 0
        startBtn.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2 - 200)
        addChild(startBtn)
        createAction(node: startBtn)
    }
    func createAction(node:SKSpriteNode)  {
        let shapAc1 = SKAction.resize(toWidth: 200, height: 200, duration: 1)
        let shapAc2 = SKAction.resize(toWidth: 100, height: 100, duration: 1)
        node.run(SKAction.repeatForever(SKAction.sequence([shapAc1,shapAc2])))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        if startBtn.contains(touchLocation){
            let reveal = SKTransition.crossFade(withDuration: TimeInterval(0.5))
            let loseScene = GameScene(size: self.size)
            loseScene.size = self.size
            loseScene.scaleMode = .aspectFill
            self.view?.presentScene(loseScene, transition: reveal)
        }
    }
}
