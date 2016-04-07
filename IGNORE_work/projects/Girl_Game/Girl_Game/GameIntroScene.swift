//
//  GameInroScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit
import SpriteKit

class GameIntroScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let myLabel = SKLabelNode()
        myLabel.text = "Welcome to \"Strong Female Character\""
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:10)

        self.addChild(myLabel)
    }
    
    override init(size: CGSize) {
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}

