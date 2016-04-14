//
//  GameScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
//

import SpriteKit

class GameLevel1Scene: SKScene {
    
    // frame things
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    // player
    var player = CreateLevelSpriteNode()
    
    // background
    var backgroundCurrent1 = SKSpriteNode()
    var backgroundCurrent2 = SKSpriteNode()
    
    // screen options
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // frame
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        
        
        // setup screen
        //createSKShapeNodeRect
        
        
        // setup background
        backgroundCurrent1.texture = SKTexture(imageNamed: "background_level1")
        backgroundCurrent1.size = CGSize(width: frameWidth, height: frameHeight)
        backgroundCurrent1.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight)
        backgroundCurrent1.name = "backgroundCurrent1"
        backgroundCurrent1.zPosition = 1
        self.addChild(backgroundCurrent1)
        
        backgroundCurrent2.texture = SKTexture(imageNamed: "background_level1")
        backgroundCurrent2.size = CGSize(width: frameWidth, height: frameHeight)
        backgroundCurrent2.position = CGPoint(x: frameCenterWidth+frameWidth, y: frameCenterHeight)
        backgroundCurrent2.name = "backgroundCurrent1"
        backgroundCurrent2.zPosition = 1
        self.addChild(backgroundCurrent2)
        
        
        // setup player
        let w = (frameHeight/5)
        let h = w * (2400/1328)
        player = CreateLevelSpriteNode(name: "player", imageName: "sil_latina_archer", x: frameCenterWidth, y: frameCenterHeight, width: w, height: h, zPosition: 2)
        self.addChild(player)
    }
    
    
    
    ///////////////////////////////////////
    //          Scene loaders            //
    ///////////////////////////////////////
    
    
    
    
    
    ////////////////////////////////////
    //          Game Logic            //
    ////////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        // update bacground
        backgroundCurrent1.position.x -= 20
        backgroundCurrent2.position.x -= 20
        
        if(backgroundCurrent1.position.x <= (frameWidth/(-2))+19) {
            backgroundCurrent1.position.x = frameWidth + (frameWidth/2)
        }
        if (backgroundCurrent2.position.x <= (frameWidth/(-2))+19) {
            backgroundCurrent2.position.x = frameWidth + (frameWidth/2)
        }
    }
}
