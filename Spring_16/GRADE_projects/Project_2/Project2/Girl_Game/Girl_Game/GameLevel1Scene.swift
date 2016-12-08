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
    var player = CreateLevelSpritePlayer()
    var movingPlayerUp = false;
    var movingPlayerDown = false;
    var playerBodyFile = ""
    var playerArmorFile = ""
    var playerWeaponFile = ""
    
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
        let arrowButtonWidth:CGFloat = 200;
        let arrowButtonHeight:CGFloat = frameHeight / 2;
        let arrowButtonX: CGFloat = 0
        let arrowButtonDownY: CGFloat = 0
        let arrowButtonUpY: CGFloat = arrowButtonDownY + arrowButtonHeight
        
        let upButton = createSKShapeNodeRect(name: "upButton", rect: CGRect(x: arrowButtonX, y: arrowButtonUpY, width: arrowButtonWidth, height: arrowButtonHeight), fillColor: greyMediumColor)
        upButton.strokeColor = greyDarkColor
        upButton.lineWidth = 10
        upButton.zPosition = 10
        self.addChild(upButton)
        
        let upButtonLabel = createSKLabelNodeAdj(name: "upButton", text: "Up", x: arrowButtonX + (arrowButtonWidth/2), y: arrowButtonUpY + (arrowButtonHeight/2), width: arrowButtonWidth, height: arrowButtonHeight, fontColor: UIColor.whiteColor())
        upButtonLabel.zPosition = 11
        self.addChild(upButtonLabel)
        
        
        let downButton = createSKShapeNodeRect(name: "downButton", rect: CGRect(x: arrowButtonX, y: arrowButtonDownY, width: arrowButtonWidth, height: arrowButtonHeight), fillColor: greyMediumColor)
        downButton.strokeColor = greyDarkColor
        downButton.lineWidth = 10
        downButton.zPosition = 10
        self.addChild(downButton)
        
        let downButtonLabel = createSKLabelNodeAdj(name: "downButton", text: "Down", x: arrowButtonX + (arrowButtonWidth/2), y: arrowButtonDownY + (arrowButtonHeight/2), width: arrowButtonWidth, height: arrowButtonHeight, fontColor: UIColor.whiteColor())
        downButtonLabel.zPosition = 11
        self.addChild(downButtonLabel)
        
        
        
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
        print("playerBodyFile \(playerBodyFile)  --  playerArmorFile \(playerArmorFile)  --  playerWeaponFile \(playerWeaponFile)")
        player = CreateLevelSpritePlayer(name: "player", bodyImageName: playerBodyFile, armorImageName: playerArmorFile, weaponImageName: playerWeaponFile, x: frameCenterWidth, y: frameCenterHeight, width: w, height: h, zPosition: 2)
        
        self.addChild(player)
    }
    
    convenience init(size: CGSize, bodyFileName: String, armorFileName: String, weaponFileName: String) {
        self.init(size: size)
        
        playerBodyFile = bodyFileName
        playerArmorFile = armorFileName
        playerWeaponFile = weaponFileName
        
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
            let touchedNode = self.nodeAtPoint(location)
            
            if let name = touchedNode.name
            {
                // switching between options
                if name == "upButton" {
                    //print("upButton")
                    movingPlayerUp = true;
                    
                } else if name == "downButton" {
                    //print("downButton")
                    movingPlayerDown = true;

                }
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        movingPlayerUp = false;
        movingPlayerDown = false;
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
        
        // update player sprite
        if(movingPlayerUp) {
            movePlayerUp();
        }
        if(movingPlayerDown) {
            movePlayerDown();
        }
    }
    
    
    func movePlayerUp() {
        if player.position.y <= (frameHeight - (player.bodySprite.size.height/2)) {
            player.position.y += 10
        }
        
    }
    
    func movePlayerDown() {
        if player.position.y >= (0 + (player.bodySprite.size.height/2)) {
            player.position.y -= 10
        }
    }
}
