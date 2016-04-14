//
//  GameCharacterCreationScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit
import SpriteKit

class GameCharacterCreationScene: SKScene {

    // frame things
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    let ratioWidthFromHeight: CGFloat = (1328/2400)
    let ratioHeightFromWidth: CGFloat = (2400/1328)
    
    
    // views
    let BODY_OPTION = 1;
    let ARMOR_OPTION = 2;
    let WEAPON_OPTION = 3;
    var optionState = 0
    
    let optionView = SKNode()
    let displayView = SKNode()
    let detailBodyView = SKNode()
    let detailArmorView = SKNode()
    let detailWeaponView = SKNode()
    
    var currentDetailView = SKNode();
    
    
    // view sizes
    var optionWidth: CGFloat = 0
    var optionHeight: CGFloat = 0
    var optionMargin: CGFloat = 0
    var optionStartX: CGFloat = 0
    var optionStartY: CGFloat = 0
    
    var detailWidth: CGFloat = 0
    var detailHeight: CGFloat = 0
    var detailMargin: CGFloat = 0
    
    var detailDisplayWidth: CGFloat = 0
    var detailDisplayHeight: CGFloat = 0
    var detailDisplayStartX: CGFloat = 0
    var detailDisplayStartY: CGFloat = 0
    
    var detailOptionsWidth: CGFloat = 0
    var detailOptionsHeight: CGFloat = 0
    var detailOptionsStartX: CGFloat = 0
    var detailOptionsStartY: CGFloat = 0
    
    
    // display things
    var selectedBodySprite = CreationOptionCharacterSprite()
    var selectedArmorSprite = CreationOptionCharacterSprite()
    var selectedWeaponSprite = CreationOptionCharacterSprite()
    
    
    // body things
    var bodySelectedIndex = 0;
    var bodySpritesArray = [CreationOptionCharacterSprite]()
    var bodyImageNames = [
        "sil_african",
        "sil_indian",
        "sil_native",
        "sil_pacificislander",
        "sil_latina",
        "sil_asian",
        "sil_middleeastern",
        "sil_white"]
    
    
    // armor things
    var armorSelectedIndex = 0;
    var armorSpritesArray = [CreationOptionCharacterSprite]()
    var armorImageNames = [
        "sil_armor_archer_trans",
        "sil_armor_healer_trans",
        "sil_armor_warrior_trans"
    ]
    
    
    // weapon things
    var weaponSelectedIndex = 0;
    var weaponSpritesArray = [CreationOptionCharacterSprite]()
    var weaponImageNames: [String] = [
        
    ]
    
    
    
    
    override func didMoveToView(view: SKView) {
        //print("in GameCharacterCreationScene")
        
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        //print("frameWidth: \(frameWidth) frameCenterWidth: \(frameCenterWidth)")
        //print("frameHeight: \(frameHeight) frameCenterHeight: \(frameCenterHeight)")
        
        
        optionWidth = (frameWidth/4)
        optionHeight = frameHeight
        optionMargin = 20
        optionStartX = optionMargin
        optionStartY = optionMargin
        
        detailWidth = frameWidth - optionWidth
        detailHeight = frameHeight
        detailMargin = 30
        
        detailOptionsWidth = detailWidth
        detailOptionsHeight = (frameHeight/3)
        detailOptionsStartX = optionWidth + detailMargin
        detailOptionsStartY = detailMargin
        
        detailDisplayWidth = detailWidth
        detailDisplayHeight = frameHeight - detailOptionsHeight
        detailDisplayStartX = detailOptionsStartX
        detailDisplayStartY = detailOptionsHeight + detailMargin
        
        
        
        // option view
        createAndLoadOptionsView()
        
        // display view
        createAndLoadDisplayView()
        
        // detail views
        loadBodyView()
        currentDetailView = detailBodyView
        self.addChild(currentDetailView)
        
        loadArmorView()
        
        loadWeaponView()
        
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
    func createAndLoadOptionsView() {
        //print("in GameCharacterCreationScene - loadOptionsView")
        
        let numberOfOptionButtons: CGFloat = 5
        let optionButtonBackgroundWidth = optionWidth-(frameBorder*2)
        let optionButtonBackgroundHeight = (frameHeight-((numberOfOptionButtons+1)*frameBorder)) / numberOfOptionButtons
        
        let optionButton1Y = (frameBorder*1) + (optionButtonBackgroundHeight*0) // bottom most
        let optionButton2Y = (frameBorder*2) + (optionButtonBackgroundHeight*1)
        let optionButton3Y = (frameBorder*3) + (optionButtonBackgroundHeight*2)
        let optionButton4Y = (frameBorder*4) + (optionButtonBackgroundHeight*3)
        let optionButton5Y = (frameBorder*5) + (optionButtonBackgroundHeight*4) // top most
        
        
        // background
        let optionBackground = SKShapeNode(rect: CGRect(x: 0, y: 0, width: optionWidth, height: frameHeight))
        optionBackground.fillColor = greyMediumColor
        optionView.addChild(optionBackground)
        
        // detail backaground
        let detailBackground = SKShapeNode(rect: CGRect(x: optionWidth, y: 0, width: frameWidth-optionWidth, height: frameHeight))
        detailBackground.fillColor = UIColor.whiteColor()
        optionView.addChild(detailBackground)
        
        
        // body
        let r1 = CGRect(x: frameBorder, y: optionButton5Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionView.addChild(createSKShapeNodeRect(name: "bodyButton", rect: r1, fillColor: pinkColor))
        
        optionView.addChild(createSKLabelNodeAdj(name: "bodyButtonLabel", text: "Body", x: optionWidth/2, y: optionButton5Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // armor
        let r2 = CGRect(x: frameBorder, y: optionButton4Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionView.addChild(createSKShapeNodeRect(name: "armorButton", rect: r2, fillColor: pinkColor))
        
        optionView.addChild(createSKLabelNodeAdj(name: "armorButtonLabel", text: "Armor", x: optionWidth/2, y: optionButton4Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // weapon
        let r3 = CGRect(x: frameBorder, y: optionButton3Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionView.addChild(createSKShapeNodeRect(name: "weaponButton", rect: r3, fillColor: pinkColor))
        
        optionView.addChild(createSKLabelNodeAdj(name: "weaponButtonLabel", text: "Weapon", x: optionWidth/2, y: optionButton3Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // random
        let r4 = CGRect(x: frameBorder, y: optionButton2Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionView.addChild(createSKShapeNodeRect(name: "randomButton", rect: r4, fillColor: pinkLightColor))
        
        optionView.addChild(createSKLabelNodeAdj(name: "randomButtonLabel", text: "Random", x: optionWidth/2, y: optionButton2Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // save
        let r5 = CGRect(x: frameBorder, y: optionButton1Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionView.addChild(createSKShapeNodeRect(name: "saveButton", rect: r5, fillColor: tealColor))
        
        optionView.addChild(createSKLabelNodeAdj(name: "saveButtonLabel", text: "Save", x: optionWidth/2, y: optionButton1Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.blackColor()))

        
        self.addChild(optionView)
    }
    
    func createAndLoadDisplayView() {
        
        let displaySelectedHeight: CGFloat = detailDisplayHeight - (2*detailMargin)
        let displaySelectedWidth: CGFloat = displaySelectedHeight * (1328/2400)
        let displaySelectedX: CGFloat = detailDisplayStartX + (displaySelectedWidth/2)
        let displaySelectedY: CGFloat = detailDisplayStartY + (displaySelectedHeight/2)
        
        // display body
        selectedBodySprite = CreationOptionCharacterSprite(name: "bodyDetailSprite", imageName: bodyImageNames[0], x: displaySelectedX, y: displaySelectedY, width: displaySelectedWidth, height: displaySelectedHeight, select: false)
        let tmpNode1 = selectedBodySprite.getNode()
        tmpNode1.zPosition = 1
        displayView.addChild(tmpNode1)
        
        
        // display armor
        selectedArmorSprite = CreationOptionCharacterSprite(name: "armorDetailSprite", imageName: armorImageNames[0], x: displaySelectedX, y: displaySelectedY, width: displaySelectedWidth, height: displaySelectedHeight, select: false)
        let tmpNode2 = selectedArmorSprite.getNode()
        tmpNode2.zPosition = 2
        displayView.addChild(tmpNode2)
        
        // display weapon
        //TODO
        
        self.addChild(displayView)
    }
    
    func loadBodyView() {
        loadGenericView(detailView: detailBodyView, imagesNamesArray: bodyImageNames, spritesArray: &bodySpritesArray, optionNamePrefix: "bodyOptionSprite")
    }
    
    func loadArmorView() {
        loadGenericView(detailView: detailArmorView, imagesNamesArray: armorImageNames, spritesArray: &armorSpritesArray, optionNamePrefix: "armorOptionSprite")
    }
    
    func loadWeaponView() {
        loadGenericView(detailView: detailWeaponView, imagesNamesArray: weaponImageNames, spritesArray: &weaponSpritesArray, optionNamePrefix: "weaponOptionSprite")
    }
    
    
    func loadGenericView(detailView detailView: SKNode, imagesNamesArray: [String], inout spritesArray: [CreationOptionCharacterSprite], optionNamePrefix: String) {
        let detailStartX = optionWidth + detailMargin
        let detailStartY = detailMargin
        
        
        // detail (body) options
        let numOptions: CGFloat = CGFloat(imagesNamesArray.count)
        
        // compute width and height
        // set w & h
        var singleOptionHeight = detailOptionsHeight - (2*detailMargin)
        var singleOptionWidth: CGFloat = singleOptionHeight * ratioWidthFromHeight
        // compute total width
        let allOptionsTotalWidth = ((singleOptionWidth+detailMargin) * numOptions) + detailMargin
        // test fit
        if allOptionsTotalWidth > detailWidth {
            // recompute w & h
            singleOptionWidth = ( detailWidth-((numOptions+1)*detailMargin) ) / numOptions
            singleOptionHeight = singleOptionWidth * ratioHeightFromWidth
        }
        
        var singleOptionSpriteX: CGFloat = detailStartX + (singleOptionWidth/2)
        let singleOptionSpriteY: CGFloat = detailStartY + (singleOptionHeight/2)
        
        for var i = 0; i<Int(numOptions); i++ {
            let singleSprite_stub = CreationOptionCharacterSprite(name: "\(optionNamePrefix)_\(i)", imageName: imagesNamesArray[i], x: singleOptionSpriteX, y: singleOptionSpriteY, width: singleOptionWidth, height: singleOptionHeight, select: (i == 0))
            
            spritesArray.append(singleSprite_stub)
            
            detailView.addChild(singleSprite_stub.getNode())
            
            singleOptionSpriteX += (detailMargin+singleOptionWidth)
        }
        
    }
    
    
    func changeOptionDetailView(newOptionState: Int) {
        optionState = newOptionState
        
        currentDetailView.removeFromParent()
        
        switch(optionState) {
            case BODY_OPTION:
                currentDetailView = detailBodyView
            case ARMOR_OPTION:
                currentDetailView = detailArmorView
            case WEAPON_OPTION:
                currentDetailView = detailWeaponView
            default:
                return;
        }
        
        self.addChild(currentDetailView)
        
    }
    
    func selectBodyOption(optionSelectedNew: Int) {
        selectGenericOption(optionSelectedNew, spritesArray: bodySpritesArray, spritesNamesArray: bodyImageNames, selectedIndex: bodySelectedIndex, selectedSprite: selectedBodySprite)
        bodySelectedIndex = optionSelectedNew
    }
    
    func selectArmorOption(optionSelectedNew: Int) {
        selectGenericOption(optionSelectedNew, spritesArray: armorSpritesArray, spritesNamesArray: armorImageNames, selectedIndex: armorSelectedIndex, selectedSprite: selectedArmorSprite)
        armorSelectedIndex = optionSelectedNew
    }
    
    func selectWeaponOption(optionSelectedNew: Int) {
        selectGenericOption(optionSelectedNew, spritesArray: weaponSpritesArray, spritesNamesArray: weaponImageNames, selectedIndex: weaponSelectedIndex, selectedSprite: selectedWeaponSprite)
        weaponSelectedIndex = optionSelectedNew
    }
    
    func selectGenericOption(optionSelectedNew: Int, spritesArray: [CreationOptionCharacterSprite], spritesNamesArray: [String], selectedIndex: Int, selectedSprite: CreationOptionCharacterSprite) {
        
        // remove last select
        spritesArray[selectedIndex].removeSelectedBox()
        
        // add current select
        spritesArray[optionSelectedNew].addSelectedBox()
        
        // change displayed sprite
        selectedSprite.changeImage(imageName: spritesNamesArray[optionSelectedNew])
        
        
    }
    
    
    
    
    
    
    //////////////////////////////////////////
    //          Helper Functions            //
    //////////////////////////////////////////
    func stateChangeNext(newState: Int) {
        
    }
    
    

    
    ////////////////////////////////////
    //          Game Logic            //
    ////////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            
            if let name = touchedNode.name
            {
                // switching between options
                if name == "bodyButton" || name == "bodyButtonLabel" {
                    //print("bodyButton or bodyButtonLabel")
                    changeOptionDetailView(BODY_OPTION)
                    
                } else if name == "armorButton" || name == "armorButtonLabel" {
                    //print("armorButton or armorButtonLabel")
                    changeOptionDetailView(ARMOR_OPTION)
                    
                } else if name == "weaponButton" || name == "weaponButtonLabel" {
                    //print("weaponButton or weaponButtonLabel")
                    changeOptionDetailView(WEAPON_OPTION)
                    
                } else if name == "randomButton" || name == "randomButtonLabel" {
                    //print("randomButton or randomButtonLabel")
                    changeOptionDetailView(BODY_OPTION)
                    
                    let bodySelectedIndexNew = Int(arc4random_uniform(UInt32(bodySpritesArray.count)))
                    //print("bodySelectedIndexNew: \(bodySelectedIndexNew)")
                    selectBodyOption(bodySelectedIndexNew)
                    
                    let armorSelectedIndexNew = Int(arc4random_uniform(UInt32(armorSpritesArray.count)))
                    //print("armorSelectedIndexNew: \(armorSelectedIndexNew)")
                    selectArmorOption(armorSelectedIndexNew)
                    
                    let weaponSelectedIndexNew = Int(arc4random_uniform(UInt32(weaponSpritesArray.count)))
                    //print("weaponSelectedIndexNew: \(weaponSelectedIndexNew)")
                    //selectWeaponOption(weaponSelectedIndexNew)
                    
                    
                    
                } else if name == "saveButton" || name == "saveButtonLabel" {
                    //print("saveButton or saveButtonLabel")
                    
                    let transition = SKTransition.flipVerticalWithDuration(1.0)
                    let game = GameLevel1Scene(size:frame.size, bodyFileName: bodyImageNames[bodySelectedIndex], armorFileName: armorImageNames[armorSelectedIndex], weaponFileName: "")
                    view!.presentScene(game, transition: transition)
                    
                }
                
                // switching between body options
                for(var i: Int = 0; i<bodyImageNames.count; i++) {
                    if name == "bodyOptionSprite_\(i)" {
                        //print("bodyOptionSprite_\(i)")
                        selectBodyOption(i)
                    }
                }
                
                // switching between armor options
                for(var i: Int = 0; i<armorImageNames.count; i++) {
                    if name == "armorOptionSprite_\(i)" {
                        //print("armorOptionSprite_\(i)")
                        selectArmorOption(i)
                    }
                }
                
                // switching between weapon options
                for(var i: Int = 0; i<weaponImageNames.count; i++) {
                    if name == "weaponOptionSprite_\(i)" {
                        //print("weaponOptionSprite_\(i)")
                        selectWeaponOption(i)
                    }
                }
                
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}
