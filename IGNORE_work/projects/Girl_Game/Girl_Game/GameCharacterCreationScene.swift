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

    
    
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    let BODY_OPTION = 1;
    let ARMOR_OPTION = 2;
    let WEAPON_OPTION = 3;
    var optionState = 0
    
    let optionsView = SKNode()
    let bodyDetailView = SKNode()
    let armorDetailView = SKNode()
    let weaponDetailView = SKNode()
    
    var loadedOptionsView = false
    var loadedBodyDetailView = false
    var loadedArmorDetailView = false
    var loadedWeaponDetailView = false
    
    var currentDetailView = SKNode();
    
    
    override func didMoveToView(view: SKView) {
        //print("in GameCharacterCreationScene")
        
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        //print("frameWidth: \(frameWidth) frameCenterWidth: \(frameCenterWidth)")
        //print("frameHeight: \(frameHeight) frameCenterHeight: \(frameCenterHeight)")
        
        createAndLoadOptionsView()
        
        currentDetailView = bodyDetailView
        loadBodyView()
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
        
        let optionBackgroundWidth = (frameWidth/4)
        
        let numberOfOptionButtons: CGFloat = 5
        let optionButtonBackgroundWidth = optionBackgroundWidth-(frameBorder*2)
        let optionButtonBackgroundHeight = (frameHeight-((numberOfOptionButtons+1)*frameBorder)) / numberOfOptionButtons
        
        let optionButton1Y = (frameBorder*1) + (optionButtonBackgroundHeight*0) // bottom most
        let optionButton2Y = (frameBorder*2) + (optionButtonBackgroundHeight*1)
        let optionButton3Y = (frameBorder*3) + (optionButtonBackgroundHeight*2)
        let optionButton4Y = (frameBorder*4) + (optionButtonBackgroundHeight*3)
        let optionButton5Y = (frameBorder*5) + (optionButtonBackgroundHeight*4) // top most
        
        
        // background
        let optionBackground = SKShapeNode(rect: CGRect(x: 0, y: 0, width: optionBackgroundWidth, height: frameHeight))
        optionBackground.fillColor = UIColor.whiteColor()
        optionsView.addChild(optionBackground)
        
        
        // body
        let r1 = CGRect(x: frameBorder, y: optionButton5Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionsView.addChild(createSKShapeNodeRect(name: "bodyButton", rect: r1, fillColor: pinkColor))
        
        optionsView.addChild(createSKLabelNodeAdj(name: "bodyButtonLabel", text: "Body", x: optionBackgroundWidth/2, y: optionButton5Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // armor
        let r2 = CGRect(x: frameBorder, y: optionButton4Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionsView.addChild(createSKShapeNodeRect(name: "armorButton", rect: r2, fillColor: pinkColor))
        
        optionsView.addChild(createSKLabelNodeAdj(name: "armorButtonLabel", text: "Armor", x: optionBackgroundWidth/2, y: optionButton4Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // weapon
        let r3 = CGRect(x: frameBorder, y: optionButton3Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionsView.addChild(createSKShapeNodeRect(name: "weaponButton", rect: r3, fillColor: pinkColor))
        
        optionsView.addChild(createSKLabelNodeAdj(name: "weaponButtonLabel", text: "Weapon", x: optionBackgroundWidth/2, y: optionButton3Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // random
        let r4 = CGRect(x: frameBorder, y: optionButton2Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionsView.addChild(createSKShapeNodeRect(name: "randomButton", rect: r4, fillColor: pinkLightColor))
        
        optionsView.addChild(createSKLabelNodeAdj(name: "randomButtonLabel", text: "Random", x: optionBackgroundWidth/2, y: optionButton2Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.whiteColor()))
        
        
        // save
        let r5 = CGRect(x: frameBorder, y: optionButton1Y, width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight)
        optionsView.addChild(createSKShapeNodeRect(name: "saveButton", rect: r5, fillColor: tealColor))
        
        optionsView.addChild(createSKLabelNodeAdj(name: "saveButtonLabel", text: "Save", x: optionBackgroundWidth/2, y: optionButton1Y+(optionButtonBackgroundHeight/2), width: optionButtonBackgroundWidth, height: optionButtonBackgroundHeight, fontColor: UIColor.blackColor()))

        
        loadedOptionsView = true
        self.addChild(optionsView)
    }
    func loadBodyView() {
        let optionBackgroundWidth = (frameWidth/4)
        
        var img = SKSpriteNode(imageNamed: "sil_white")
        img.position = CGPoint(x: optionBackgroundWidth, y: frameCenterHeight)
        bodyDetailView.addChild(img)
        
        loadedBodyDetailView = true
    }
    func loadArmorView() {
        
        
        loadedArmorDetailView = true
    }
    func loadWeaponView() {
        
        
        loadedWeaponDetailView = true
    }
    
    
    func changeOptionDetailView(newOptionState: Int) {
        optionState = newOptionState
        
        currentDetailView.removeFromParent()
        
        
        
        switch(optionState) {
            case BODY_OPTION:
                if(!loadedBodyDetailView) { loadBodyView() }
                currentDetailView = bodyDetailView
            case ARMOR_OPTION:
                if(!loadedArmorDetailView) { loadArmorView() }
                currentDetailView = armorDetailView
            case WEAPON_OPTION:
                if(!loadedWeaponDetailView) { loadWeaponView() }
                currentDetailView = weaponDetailView
            default:
                return;
        }
        
        self.addChild(currentDetailView)
        
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
                if name == "bodyButton" || name == "bodyButtonLabel" {
                    print("bodyButton")
                    changeOptionDetailView(BODY_OPTION)
                    
                } else if name == "armorButton" || name == "armorButtonLabel" {
                    print("armorButton")
                    changeOptionDetailView(ARMOR_OPTION)
                    
                } else if name == "weaponButton" || name == "weaponButtonLabel" {
                    print("weaponButton")
                    changeOptionDetailView(WEAPON_OPTION)
                    
                } else if name == "randomButton" || name == "randomButtonLabel" {
                    print("randomButton")
                    
                } else if name == "saveButton" || name == "saveButtonLabel" {
                    print("saveButton")
                    
                }
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}
