//
//  GameScene.swift
//  MEINV
//
//  Created by shuxia on 2019/6/13.
//  Copyright © 2019 TKT. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    /*
     1.当前页面 需要倒计时 进行页面跳转
     2.在当前的页面获取随机图片 然后 获取问题数组 然后随机问题 把随即问题放到数组里面进行保存 以确保同一问题在 一次启动中不会出现两次
     
     
     
     */
    var PsuhQModel : QuestionModel!
    var BackNode  :SKSpriteNode!
    
    var time   = 10
    let timeInfo = "时间:"
    
    
    override func didMove(to view: SKView) {
        
        createBackNode()
        initMeinvData()
        createTimeLabel()
        initBgMusic()
        createBackAction()
    }
    //:播放背景音乐
    func initBgMusic(){
        let AOBgMusic = SKAudioNode(fileNamed: "daojishi")
        AOBgMusic.autoplayLooped = true
        addChild(AOBgMusic)
    }
    //:创建返回按钮fanhui
    func createBackAction()  {
        BackNode = SKSpriteNode(texture: SKTexture(imageNamed: "fanhui"),size: CGSize(width:80 , height: 80))
        BackNode.anchorPoint = CGPoint(x: 0, y: 0)
        BackNode.position = CGPoint(x: 20, y: view!.frame.height - 100)
        BackNode.zPosition = 1
        addChild(BackNode)

    }
    func createBackNode()  {
        
        let scale = view!.frame.height/1535
        
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "gameScene.jpg"),size: CGSize(width:1024*scale , height: view!.frame.height))
        backNode.zPosition = -1
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(backNode)

        
    }
    func createMEINVNode(imageName:String)  {
        let meinvNode = SKSpriteNode(texture: SKTexture(imageNamed: imageName),size: CGSize(width:500 , height: 500))
        meinvNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(meinvNode)
    }
    //:初始化 数据
    func initMeinvData()  {
        //:根据图片名称获取
        let imageNamePrefix = "meinv"
        let imageNameSubfix = randomImageName()
        let imageName = imageNamePrefix + imageNameSubfix
        //:加载美女图片
        self.createMEINVNode(imageName: imageName)
        //:获取问题数组
        let qArr = MEINVModelManager.GETQuestionArr(imageName: imageName)
        let qestionN = qArr.count
        
        let randomNumber:Int = Int.random(in: 0...(qestionN - 1))

        PsuhQModel = qArr[randomNumber]

        
    }
    //:随机图片名称
    
    func randomImageName() -> String {
        //:产生 1-100 的随机数 包含 1 和 100
        let randomNumber:Int = Int(arc4random() % 200) + 1
        let bianhao  = randomNumber%10
     
        return String(bianhao)
    }
    func createTimeLabel()  {
        
        infoLabel.position = CGPoint(x: view!.frame.width/2, y: 30)
        addChild(infoLabel)
        createTimeAction()
    }
    
    //:懒加载 倒计时
    lazy var infoLabel:SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "时间:10"
        label.fontColor = UIColor.white
        return label
    }()
    //:创建动作
    func createTimeAction()  {
        let waitAc = SKAction.wait(forDuration: 1)
        let changeTime = SKAction.run {
            self.time -= 1
            self.infoLabel.text = self.timeInfo + String(self.time)
            if self.time == 0 {
                let reveal = SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(0.5))
                let loseScene = AnwserScene(size: self.size)
                loseScene.size = self.size
                loseScene.scaleMode = .aspectFill
                loseScene.qustion = self.PsuhQModel
                self.view?.presentScene(loseScene, transition: reveal)
                return;
            }
        }
        
        infoLabel.run(SKAction.repeatForever(SKAction.sequence([waitAc,changeTime])))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        if BackNode.contains(touchLocation) {
            let reveal = SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(0.5))
            let loseScene = StartScene(size: self.size)
            loseScene.size = self.size
            loseScene.scaleMode = .aspectFill
            self.view?.presentScene(loseScene, transition: reveal)
        }
    }
    override func update(_ currentTime: TimeInterval) {

    }
}
