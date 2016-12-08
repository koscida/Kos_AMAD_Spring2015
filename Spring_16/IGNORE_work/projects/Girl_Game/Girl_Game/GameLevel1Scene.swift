//
//  GameScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
//

import SpriteKit

class GameLevel1Scene: SKScene {
    
    // timers
    var previousTime: CFTimeInterval = 0
    var frameCount: Int = 0
    var shouldCorrectAfterPause = false
    var delta: CFTimeInterval = 0
    
    // game modes
    var gamePaused = true
    var PAUSE_SCREEN_INSTRUCTIONS = 0
    var PAUSE_SCREEN_DOLL = 10
    var PAUSE_SCREEN_CAR = 11
    var PAUSE_SCREEN_LIPSTICK = 12
    var PAUSE_SCREEN_OVENMIT = 13
    var PAUSE_SCREEN_TEAPOT = 14
    var PAUSE_SCREEN_SWORD = 20
    var PAUSE_SCREEN_TRUCK = 21
    var PAUSE_SCREEN_TOOLS = 22
    var PAUSE_SCREEN_MOTORCYCLE = 23
    var PAUSE_SCREEN_PLANE = 24
    var pauseScreenNum = 0
    var pauseScreenFrame = SKSpriteNode()
    
    // traits
    var traitsFrame = SKSpriteNode()
    var traitSprites = [TraitSprite]()
    
    
    // frame things
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    // player
    var player = PlayerSprite()
    var movingPlayerUp = false;
    var movingPlayerDown = false;
    var playerBodyFile = ""
    var playerArmorFile = ""
    var playerWeaponFile = ""
    
    // background
    var backgroundCurrent1 = SKSpriteNode()
    var backgroundCurrent2 = SKSpriteNode()
    var backgroundSpeed: CGFloat = 20
    
    // toys
    var toyNames = ["item_childhood_doll", "item_childhood_car", "item_childhood_lipstick", "item_childhood_ovenmit", "item_childhood_teapot",
    "item_childhood_swords", "item_childhood_truck", "item_childhood_tools", "item_childhood_motorcycle", "item_childhood_plane"]
    var items = [ItemSprite]()
    
    // frame variables
    var zPositionBackground: CGFloat = 1
    var zPositionItems: CGFloat = 10
    var zPositionCharacter: CGFloat = 20
    var zPositionButtons: CGFloat = 30
    var zPositionOverlay: CGFloat = 100
    
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // frame
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        
        
        
        // setup buttons
        //createSKShapeNodeRect
        let arrowButtonWidth:CGFloat = 200;
        let arrowButtonHeight:CGFloat = frameHeight / 2;
        let arrowButtonX: CGFloat = 0
        let arrowButtonDownY: CGFloat = 0
        let arrowButtonUpY: CGFloat = arrowButtonDownY + arrowButtonHeight
        
        let upButton = createSKShapeNodeRect(name: "upButton", rect: CGRect(x: arrowButtonX, y: arrowButtonUpY, width: arrowButtonWidth, height: arrowButtonHeight), fillColor: greyMediumColor)
        upButton.strokeColor = greyDarkColor
        upButton.lineWidth = 10
        upButton.zPosition = zPositionButtons
        self.addChild(upButton)
        
        let upButtonLabel = createSKLabelNodeAdj(name: "upButton", text: "Up", x: arrowButtonX + (arrowButtonWidth/2), y: arrowButtonUpY + (arrowButtonHeight/2), width: arrowButtonWidth, height: arrowButtonHeight, fontColor: UIColor.whiteColor())
        upButtonLabel.zPosition = zPositionButtons + 1
        self.addChild(upButtonLabel)
        
        
        let downButton = createSKShapeNodeRect(name: "downButton", rect: CGRect(x: arrowButtonX, y: arrowButtonDownY, width: arrowButtonWidth, height: arrowButtonHeight), fillColor: greyMediumColor)
        downButton.strokeColor = greyDarkColor
        downButton.lineWidth = 10
        downButton.zPosition = zPositionButtons
        self.addChild(downButton)
        
        let downButtonLabel = createSKLabelNodeAdj(name: "downButton", text: "Down", x: arrowButtonX + (arrowButtonWidth/2), y: arrowButtonDownY + (arrowButtonHeight/2), width: arrowButtonWidth, height: arrowButtonHeight, fontColor: UIColor.whiteColor())
        downButtonLabel.zPosition = zPositionButtons + 1
        self.addChild(downButtonLabel)
        
        
        // setup traits
        let traitsHeight = frameHeight * 0.15
        let traitsWidth = frameWidth - arrowButtonWidth
        let traitsX = arrowButtonWidth
        
        let traitsBack = createSKShapeNodeRect(name: "traits", rect: CGRect(x: arrowButtonWidth, y: frameHeight - traitsHeight, width: traitsWidth, height: traitsHeight), fillColor: UIColor.whiteColor())
        traitsFrame.addChild(traitsBack)
        
        let traitPadding: CGFloat = 20
        let traitHeight = traitsHeight - (2*traitPadding)
        let traitWidth = (traitsWidth - (7*traitPadding)) / 6
        let traitY = frameHeight - traitPadding
        
        let traitNames = ["Cognitive", "Compassionate", "Competitive", "Confident", "Congenial", "Curious"]
        var traitMovingX = traitsX + traitPadding
        
        for t in traitNames {
            let tempTrait = TraitSprite(name: "traits", text: t, xLeft: traitMovingX, yTop: traitY, width: traitWidth, height: traitHeight, zPosition: zPositionButtons, traitValue: 25)
            traitSprites.append(tempTrait)
            traitsFrame.addChild(tempTrait)
            traitMovingX += (traitWidth + traitPadding)
        }
        
        traitsFrame.zPosition = zPositionButtons
        self.addChild(traitsFrame)
        
        
        
        // setup background
        backgroundCurrent1.texture = SKTexture(imageNamed: "background_level1")
        backgroundCurrent1.size = CGSize(width: frameWidth, height: frameHeight)
        backgroundCurrent1.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight)
        backgroundCurrent1.name = "backgroundCurrent1"
        backgroundCurrent1.zPosition = zPositionBackground
        self.addChild(backgroundCurrent1)
        
        backgroundCurrent2.texture = SKTexture(imageNamed: "background_level1")
        backgroundCurrent2.size = CGSize(width: frameWidth, height: frameHeight)
        backgroundCurrent2.position = CGPoint(x: frameCenterWidth+frameWidth, y: frameCenterHeight)
        backgroundCurrent2.name = "backgroundCurrent1"
        backgroundCurrent2.zPosition = zPositionBackground
        self.addChild(backgroundCurrent2)
        
        
        // setup player
        let w = (frameHeight/5)
        let h = w * (2400/1328)
        print("playerBodyFile \(playerBodyFile)  --  playerArmorFile \(playerArmorFile)  --  playerWeaponFile \(playerWeaponFile)")
        player = PlayerSprite(name: "player", bodyImageName: playerBodyFile, armorImageName: playerArmorFile, weaponImageName: playerWeaponFile, x: frameCenterWidth, y: frameCenterHeight, width: w, height: h, zPosition: zPositionCharacter, maxHeight: frameHeight)
        self.addChild(player)
        
        
        
        
        
        // setup pause screen
        pauseScreenFrame.zPosition = zPositionOverlay
        displayPauseScreen()
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
    func displayPauseScreen() {
        let overlay = createSKShapeNodeRect(name: "pauseOverlay", rect: CGRect(x: 0, y: 0, width: frameWidth, height: frameWidth), fillColor: UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.6))
        pauseScreenFrame.addChild(overlay)
        
        switch(pauseScreenNum) {
        case PAUSE_SCREEN_INSTRUCTIONS:
            let introText1 = createSKLabelNodeAdj(name: "introText", text: "Level 1: Early Childhood", x: frameCenterWidth, y: frameCenterHeight+300, width: frameWidth, height: frameHeight, fontColor: UIColor.whiteColor())
            pauseScreenFrame.addChild(introText1)
            
            let introText2 = createSKLabelNodeAdj(name: "introText", text: "Collect toys to gain points", x: frameCenterWidth, y: frameCenterHeight, width: frameWidth/1.5, height: frameHeight, fontColor: UIColor.whiteColor())
            pauseScreenFrame.addChild(introText2)
            
            let introText3 = createSKLabelNodeAdj(name: "introText", text: "Let's play!", x: frameCenterWidth, y: frameCenterHeight-300, width: frameWidth/3, height: frameHeight, fontColor: UIColor.whiteColor())
            pauseScreenFrame.addChild(introText3)
            
        default: break;
        }
        
        self.addChild(pauseScreenFrame)
    }
    
    func startPlayingGame() {
        gamePaused = false
        
        pauseScreenNum = -1
        
        pauseScreenFrame.removeAllChildren()
        pauseScreenFrame.removeFromParent()
    }
    
    
    
    
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
                // pause screens
                if name == "pauseOverlay" || name == "introText" {
                    startPlayingGame()
                }
                
                
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
        
        if(!gamePaused) {
            
            //////////////////////////////
            //          Timers          //
            //////////////////////////////
            frameCount++
            //print(frameCount)
            
            if shouldCorrectAfterPause {
                delta = 0
                shouldCorrectAfterPause = false
            } else {
                delta = currentTime - previousTime
            }
            previousTime = currentTime
            
            //print(currentTime)
            //print(delta)
            
        
        
            //////////////////////////////////
            //          Background          //
            //////////////////////////////////
            // update background
            backgroundCurrent1.position.x -= backgroundSpeed
            backgroundCurrent2.position.x -= backgroundSpeed
            
            if(backgroundCurrent1.position.x <= (frameWidth/(-2))+19) {
                backgroundCurrent1.position.x = frameWidth + (frameWidth/2)
            }
            if (backgroundCurrent2.position.x <= (frameWidth/(-2))+19) {
                backgroundCurrent2.position.x = frameWidth + (frameWidth/2)
            }
            
            
            /////////////////////////////
            //          Items          //
            /////////////////////////////
            // move all items
            for item in items {
                item.moveLeft(backgroundSpeed)
                
            }
            // test is need to add an item
            if frameCount % 20 == 0 {
                addItem()
            }
            
            /////////////////////////////////
            //          Collision          //
            /////////////////////////////////
            //print("player.rightPosition: \(player.rightPosition)")
            //print("player.leftPosition: \(player.leftPosition)")
            //print("player.bottomPosition: \(player.bottomPosition)")
            //print("player.topPosition: \(player.topPosition)")

            for item in items {
                //print("\(item.name) -- item.leftPosition: \(item.leftPosition)")
                //print("\(item.name) -- item.rightPosition: \(item.rightPosition)")
                //print("\(item.name) -- item.topPosition: \(item.topPosition)")
                //print("\(item.name) -- item.bottomPosition: \(item.bottomPosition)")
                if (
                    item.leftPosition <= player.rightPosition &&
                    item.rightPosition >= player.leftPosition &&
                    item.topPosition >= player.bottomPosition &&
                    item.bottomPosition <= player.topPosition
                    ) {
                        //print("collision with \(item.name)")
                        
                        // stop showing on screen
                        item.removeFromParent()
                        
                        // turn collected on
                        item.collected = true
                        
                        // test if girl or boy
                        if(item.type <= 4) { // girl
                            print("girl")
                        } else { // boy
                            print("boy")
                        }
                }
                
            }
            
        } else {
            
            //////////////////////////////
            //          Timers          //
            //////////////////////////////
            shouldCorrectAfterPause = true
            delta = 0
            
            
        }
        
        
        ///////////////////////////////
        //          Buttons          //
        ///////////////////////////////
        // update player sprite
        if(movingPlayerUp) {
            player.movePlayerUp()
        }
        if(movingPlayerDown) {
            player.movePlayerDown()
        }
    }
    
    
    
    ////////////////////////////////////////
    //          GamePlay Logic            //
    ////////////////////////////////////////
    
    
    func addItem() {
        // random toy
        let index = Int(arc4random_uniform(UInt32(toyNames.count)))
        let imageName = toyNames[index]
        let name = "toy\(items.count)"
        let w = (frameHeight/8)
        let h = w
        let y = CGFloat(arc4random_uniform(UInt32(frameHeight)))
        
        // create new item
        let item = ItemSprite(name: name, imageName: imageName, x: frameWidth+w, y: y, width: w, height: h, zPosition: zPositionItems, itemType: index)
        
        // add to item to list
        items.append(item)
        
        // add to screen
        self.addChild(item)
        
        //print("adding: \(item.name)")
    }
    
    
    
}
