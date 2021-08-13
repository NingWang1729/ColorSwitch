//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Ning Wang on 8/12/21.
//

import SpriteKit

enum PlayColors {
    static let colors = [
        UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
        UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
    ]
}

class GameScene: SKScene {

    var colorSwitch: SKSpriteNode!

    override func didMove(to view: SKView) {
        setUpPhysics()
        layoutScene()
    }
    
    func setUpPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width / 3, height: frame.size.width / 3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width / 2)
        colorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)
        
        spawnBall()
    }
    
    func spawnBall() {
        let ball =  SKSpriteNode(imageNamed: "ball")
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        ball.physicsBody?.isDynamic = true
        addChild(ball)
    }
    
    
}


extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            print("CONTACT!!!")
        }
    }
}
