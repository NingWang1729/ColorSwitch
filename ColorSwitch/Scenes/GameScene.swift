//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Ning Wang on 8/12/21.
//

import SpriteKit

class GameScene: SKScene {

    var colorSwitch: SKSpriteNode!

    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width / 3, height: frame.size.width / 3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        addChild(colorSwitch)
    }
}
