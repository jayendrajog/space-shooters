//
//  GameScene.swift
//  space shooters
//
//  Created by Jayendra Ashutosh Jog on 12/18/15.
//  Copyright (c) 2015 Jayendra. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var Player = SKSpriteNode(imageNamed: "spaceship.png")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        Player.position = CGPointMake(self.size.width/2, self.size.height/10)
        var Timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("SpawnBullets"), userInfo: nil, repeats: true)
        self.addChild(Player)
    }
    
    func SpawnBullets()
    {
        var Bullet = SKSpriteNode(imageNamed: "Bullet.png")
        Bullet.zPosition = -1
        Bullet.position = CGPointMake(Player.position.x, Player.position.y)
        let action = SKAction.moveToY(self.size.height, duration: 0.5)
        Bullet.runAction(SKAction.repeatActionForever(action))
        self.addChild(Player)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            Player.position.x = location.x
        
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            Player.position.x = location.x
            
        }

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
