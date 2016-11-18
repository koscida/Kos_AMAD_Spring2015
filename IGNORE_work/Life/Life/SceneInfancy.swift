//
//  SceneBirth.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
//

/* ******************************** */
/*              STATE 1             */
/* ******************************** */

import SpriteKit

class SceneInfancy: SceneBase {
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        //print("didMoveToView " + sceneNameInfancy)
        
        name = sceneNameInfancy
        
        // creating and adding content to the page
        createContent_Main()
        
        // add menu overlay
        createContent_MenuOverlay()
        
        // test that all nodes have been added
        //print(self.children)
    }
    
    /////////////////////////////////
    //          Touches            //
    /////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        print("---------- TOUCHES BEGAN (" + sceneNameInfancy + ") ----------")
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            //print(touchedNode)
            
            if let name = touchedNode.name {
                
                switch sceneState {
                  
                // regular scene, no popups are being displayed
                case 0:
                    // loop through items might have selected
                    for item in infantItems {
                        // check if an item
                        if name == item.name {
                            print("running on: " + name)
                            runAction_SelectedItem(item)
                        }
                    }
                    
                // informational display popup is being displayed
                case 1:
                    if name == popupButtonCancel {
                        runAction_ExitPopup()
                    } else if name == popupButtonConfirm {
                        runAction_ConfirmItem()
                    }
                    
                default:
                    break
                    
                    
                }
            }
            
            //stateChangeNext()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    
    /////////////////////////////////////////
    //          Content loaders            //
    /////////////////////////////////////////
    func createContent_Main() {
        print("createContent_Main " + name!)
        
        // put items on screen
        // TODO change this to sprites
        var xCount:CGFloat = 200
        for item in infantItems {
            let tmpItem: ItemNode = createTestItem(name: item.name, text: item.name, x: xCount, y: SceneBase.frameCenterHeight)
            contentNode.addChild(tmpItem)
            xCount += 300
        }
        
        self.addChild(contentNode)
    }
    
    func createContent_ItemDeatilPopup(item: Item) {
        print("createContent_DisplayItemModal " + name!)
        
        // mute overlay
        let muteOverlay = createMuteOverlay()
        popupOverlayNode.addChild(muteOverlay)
        
        // display back
        let displayBack = createPopupBack()
        popupOverlayNode.addChild(displayBack)
        
        // cancel
        let cancelButton = createPopupSmallButton(name: popupButtonCancel, text: "Cancel", bright: false, onRight: false)
        popupOverlayNode.addChild(cancelButton)
        
        // confirm
        let confirmButton = createPopupSmallButton(name: popupButtonConfirm, text: "Confirm", bright: true, onRight: true)
        popupOverlayNode.addChild(confirmButton)
        
        // item image TODO
        
        // item name TODO
        
        // item desc TODO
        
        self.addChild(popupOverlayNode)
    }
    
    
    
    
    ////////////////////////////////////
    //          Game Logic            //
    ////////////////////////////////////
    func runAction_SelectedItem(item: Item) {
        print("runAction_SelectedItem")
        itemSelected = item
        createContent_ItemDeatilPopup(item)
        sceneState++
    }
    
    func runAction_ExitPopup() {
        print("runAction_ExitPopup\n")
        sceneState = 0
        popupOverlayNode.removeAllChildren()
        popupOverlayNode.removeFromParent()
    }
    
    func runAction_ConfirmItem() {
        print("runAction_ConfirmItem")
        runAction_BuyItem()
        runAction_ExitPopup()
    }
    
    func runAction_BuyItem() {
        print("runAction_buyItem")
        // check if have money TODO
        
        // check number of min buys TODO
        
        // add to item own count TODO persisted
        itemSelected.owns++
        
        // add to inventory TODO persisted
        inventoryItems.append(itemSelected)
        //print("---------- Inventory Items (" + self.name! + ") ----------")
        //print(inventoryItems)
        
        // change stats TODO
        
        // show bought message? TODO
    }
}
