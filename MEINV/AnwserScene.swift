//
//  AnwserScene.swift
//  MEINV
//
//  Created by shuxia on 2019/6/13.
//  Copyright © 2019 TKT. All rights reserved.
//

import SpriteKit
import GameplayKit

class AnwserScene: SKScene {
    
    /*
     1.当前的颜色 值 是哪个 位置的?
     2.传图片名字过来  然后根据当前的图片名称来加载 当前 问题数组
     3.然后开始回答问题
     */
    var qustion :QuestionModel!
    var qustionPositionStr = ""
    
    
    var falseNode : SKSpriteNode!
    var trueNode  : SKSpriteNode!
    var isSelect  :Bool  = false
    

    
    override func didMove(to view: SKView) {
        
        createBackNode()
        createBlackB()
        createPositionNode()
        createColorNode()
        createFTNodes()
        initBgMusic()
    }
    func createBackNode()  {
        
        let scale = view!.frame.height/900
        
        let backNode = SKSpriteNode(texture: SKTexture(imageNamed: "anwserBACK.jpg"),size: CGSize(width:600*scale , height: view!.frame.height))
        backNode.zPosition = -1
        backNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(backNode)        
    }
    //:播放背景音乐
    func initBgMusic(){
        let AOBgMusic = SKAudioNode(fileNamed: "xintiao")
        AOBgMusic.autoplayLooped = true
        addChild(AOBgMusic)
    }
    
    //:创建颜色 node
    func createColorNode()  {
        
        let ColorNode = SKSpriteNode(color: UIColor.init(hex:qustion.colorName!),size: CGSize(width:100 , height: 50))

        ColorNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height/2)
        addChild(ColorNode)
    }
    //:创建 position node
    func createPositionNode()  {
        infoLabel.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height - 100)
        addChild(infoLabel)

        
        positionLableNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height - 180)
        addChild(positionLableNode)
        
    }
    //:创建 对号 和错号
    func createFTNodes()  {
        //:对号
        trueNode = SKSpriteNode(texture: SKTexture(imageNamed: "true"), size: CGSize(width: 100, height: 100))
        trueNode.anchorPoint = CGPoint(x: 0, y: 0)
        trueNode.position = CGPoint(x: 50, y: 50)
        addChild(trueNode)
        
        //:错号
        falseNode = SKSpriteNode(texture: SKTexture(imageNamed: "False"), size: CGSize(width: 100, height: 100))
        falseNode.anchorPoint = CGPoint(x: 0, y: 0)
        falseNode.position = CGPoint(x: view!.frame.width - 150, y: 50)
        addChild(falseNode)

    }
    //:创建黑板 blackBoard
    func createBlackB()  {
        let ColorNode = SKSpriteNode(texture: SKTexture(imageNamed: "blackBoard"),size: CGSize(width:350 , height: 350))
        ColorNode.position = CGPoint(x: view!.frame.width/2, y: view!.frame.height - 125)
        addChild(ColorNode)

    }
    
    //:随机产生问题
    func createQuestion() -> String  {
        let arr = qustion.anserArr
        let qestionN = arr!.count
        let randomNumber:Int = Int.random(in: 0...(qestionN - 1))
        return arr![randomNumber]
    }
    
    //:懒加载 position
    lazy var positionLableNode:SKLabelNode = {
     
        let label = SKLabelNode(fontNamed: "Chalkduster")
        self.qustionPositionStr = self.createQuestion()
        label.text = "\(self.qustionPositionStr)的颜色是下面的颜色吗?"
        label.fontColor = UIColor.white
        label.fontSize  = 20
        return label
    }()
    //:懒加载 infoLabel
    lazy var infoLabel:SKLabelNode = {
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "请在回答下列问题:"
        label.fontColor = UIColor.white
        return label
    }()
    //:点击事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            
            return
        }
        guard !self.isSelect  else {
            return
        }
        let touchLocation = touch.location(in: self)
        //:和正确答案比对
        let nameStr1 = self.qustion.positionName!
        let nameStr2 = self.qustionPositionStr
        var initRight = false
        
        if nameStr1.isEqual(nameStr2){
            initRight = true
        }else{
            initRight = false
        }
        if falseNode.contains(touchLocation){
            self.isSelect = true;

            if initRight {
               
                self.playWrong()
            } else{
                
                self.playRight()
            }
        }
        
        if trueNode.contains(touchLocation){
            self.isSelect = true;

            if initRight {
                self.playRight()
            } else{
                self.playWrong()

            }
        }
    }

    func playWrong()  {
        let bombAction = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
        run(bombAction){
            self.fanhui()
        }
    }
    func playRight()  {
        let bombAction = SKAction.playSoundFileNamed("right", waitForCompletion: true)
        run(bombAction){
            self.fanhui()
        }
    }
    func playDaojishi()  {
        let bombAction = SKAction.playSoundFileNamed("daojishi", waitForCompletion: true)
        run(bombAction){
            self.fanhui()
        }
    }
    func fanhui()  {
        let reveal = SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(0.5))
        let loseScene = GameScene(size: self.size)
        loseScene.size = self.size
        loseScene.scaleMode = .aspectFill
//        loseScene.qustion = self.PsuhQModel
        self.view?.presentScene(loseScene, transition: reveal)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
}
