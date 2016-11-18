//
//  SceneBase.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import SpriteKit

class SceneBase: SKScene {

    static var state = 0;
    
    // frame sizing and scale
    static var sceneScale:CGFloat = 0;
    static var sceneSize:CGSize = CGSize()
    
    static var frameWidth: CGFloat {
        set {}
        get { return SceneBase.sceneSize.width }
    }
    static var frameCenterWidth: CGFloat {
        set {}
        get { return SceneBase.sceneSize.width/2 }
    }
    static var frameHeight: CGFloat {
        set {}
        get { return SceneBase.sceneSize.height }
    }
    static var frameCenterHeight: CGFloat {
        set {}
        get { return SceneBase.sceneSize.height/2 }
    }
    
    
    // create nodes for parts of the screen
    var contentNode = SKNode()
    var animationNode = SKNode()
    var menuOverlayNode = SKNode()
    var popupOverlayNode = SKNode()
    var inventoryNode = SKNode()
    var inventoryPopupNode = SKNode()
    
    var sceneState = 0
    var itemSelected = Item()
    
    var hasCreatedInventoryMenu = false
    
    
    // does not get called - scene children override
    override func didMoveToView(view: SKView) {
        
        name = sceneNameBase
        //print(sceneNameBase + " - didMoveToView")
        
        // setup the z positions for all the nodes
        contentNode.zPosition = zPositionContent
        animationNode.zPosition = zPositionAnimations
        menuOverlayNode.zPosition = zPositionMenuOverlay
        popupOverlayNode.zPosition = zPositionPopup
        inventoryNode.zPosition = zPositionInventory
        inventoryPopupNode.zPosition = zPositionInventoryPopup
        
        // name each of the nodes
        contentNode.name = nameContentNode
        animationNode.name = nameAnimationsNode
        menuOverlayNode.name = nameMenuOverlayNode
        popupOverlayNode.name = namePopupNode
        inventoryNode.name = nameInventoryNode
        inventoryPopupNode.name = nameInventoryPopupNode
        
    }
    
    
    
    /////////////////////////////////
    //          Touches            //
    /////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("---------- TOUCHES BEGAN (" + sceneNameBase + ") ----------")
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            //print(touchedNode)
            
            if let name = touchedNode.name {
                
                ////////////////////////////
                //  menu overlay buttons  //
                ////////////////////////////
                if name == menuInventoryButtonName {
                    createContent_InventoryMenu()
                }
                
                ////////////////////////////
                //  inventory buttons     //
                ////////////////////////////
                // exit inventory button
                if name == inventoryExitButtonName {
                    runAction_ExitInventoryMenu()
                }
                // inventory item selected
                for item in inventoryItems {
                    if name == item.name + inventoryCardName {
                        runAction_SelectInventoryItem(item: item)
                        print(name + " in item card")
                    }
                }
                // exit inventory item detail
                if name == inventoryPopupExitButtonName {
                    runAction_ExitInventoryPopup()
                }
                
                // TODO add tab logic when changing from one single tab to multiple tabs
            }
        }
    }

    
    
    
    
    /////////////////////////////////////
    //          Scene Setup            //
    /////////////////////////////////////
    func createContent_MenuOverlay() {
        print("createContent_MenuOverlay " + name!)
        
        // inventory
        let inventoryBtn = createRect(name: menuInventoryButtonName, widthExact: menuInventoryButtonWidth, heightExact: menuInventoryButtonHeight, xExact: menuInventoryButtonX, yExact: menuInventoryButtonY)
        menuOverlayNode.addChild(inventoryBtn)
        
        // money TODO
        
        // stats TODO
        
        
        // add menu overlay
        self.addChild(menuOverlayNode)
    }
    
    func createContent_InventoryMenu() {
        print("createContent_InventoryMenu " + name!)
        
        // TODO optimize this, just refresh the inventory display instead of re-creating the entire inventory menu every time
        if !hasCreatedInventoryMenu || true {
            //print("creating inventory menu")
            
            
            let inv = createInventoryMenu()
            inventoryNode.addChild(inv)
            
            
            // code for movable scrolling view
            //let invDisplayMovable = SKNode() // replacing with: invDisplayMovable
            /*
            let scrollView = CustomScrollView(
                frame: CGRect(x: 0, y: 0, width: inventoryDisplayContainerWidth, height:inventoryDisplayContainerHeight),
                scene: self,
                moveableNode: invDisplayMovable,
                scrollDirection: .horizontal)
            
            scrollView.contentSize = CGSizeMake(inventoryDisplayContainerWidthRunning, inventoryDisplayContainerHeight)
            
            view?.addSubview(scrollView)
             */
            
            //addChild(invDisplayMovable) // replacing with: inventoryNode.addChild(invDisplayMovable)
            
            // soon
            //scrollView?.removeFromSuperView()
            
            
            
            
            // set created to true
            hasCreatedInventoryMenu = true
        }
        
        
        // remove the main content for optimal perf (menu overlay is left on)
        contentNode.removeFromParent()
        
        // add inventory node
        self.addChild(inventoryNode)
        
        //print("---------- SELF CHILDREN (FROM SceneBase) -----------")
        //printAllNodes(self)
    }
    
    
    
    
    ////////////////////////////////////
    //          Game Logic            //
    ////////////////////////////////////
    func runAction_ExitInventoryMenu() {
        print("runAction_ExitInventoryMenu")
        
        // add main content back to screen
        self.addChild(contentNode)
        
        // remove inventory menu from screen
        inventoryNode.removeFromParent()
    }
    
    func runAction_SelectInventoryItem(item item: Item) {
        print("runAction_SelectInventoryItem")
        
        // change state to inventory item selected
        
        // create inventory item detail popup
        let invDetail = createInventoryItemDetail()
        
        // add to creater inventory popup
        inventoryPopupNode.addChild(invDetail)
        
        // add to screen
        self.addChild(inventoryPopupNode)
    }
    
    func runAction_ExitInventoryPopup() {
        print("runAction_ExitInventoryPopup")
        
        // delete inventory popup's content
        inventoryPopupNode.removeAllChildren()
        
        // remove inventory popup from screen
        inventoryPopupNode.removeFromParent()
    }
    
    
    
    
    
    
    ///////////////////////////////////////
    //          Scene Changes            //
    ///////////////////////////////////////
    
    func stateChangeNext() {
        print("----------- stateChangeNext -----------")
        
        // create a transistion
        let transition = SKTransition.fadeWithDuration(0.5)
        
        var error = false
        
        let scene: SceneBase = {
            
            switch SceneBase.state {
                
                // start game going to infancy
                case 0:
                    return SceneInfancy()
                
                // infancy going to childhood
                case 1:
                    return SceneChildhood()
                
                // childhood going to adolescence
                case 2:
                    return SceneAdolescence()
                
                // adolescence going to teens
                case 3:
                    return SceneTeens()
                
                // teens going to college
                case 4:
                    return SceneCollege()
                
                // college going to adulthood
                case 5:
                    return SceneAdulthood()
                
                // adulthood going to end game
                case 6:
                    return SceneEnd()
                
                // defaulted to start again
                default:
                    error = true
                    return SceneStart()
            }
        }()
        
        
        // Configure the scene
        scene.scaleMode = .AspectFill
        scene.size = SceneBase.sceneSize
        
        // Configure the scene
        scene.scaleMode = .AspectFill
        scene.size = size

        
        
        // go to that scene
        view!.presentScene(scene, transition: transition)
        
        // incrament state
        if(error) {
            SceneBase.state = 0
        } else {
            SceneBase.state += 1;
        }
        
    }
    
    
    
    
    
    
    
    
    func printAllNodes(node: SKNode) {
        // print the node
        print(node)
        // print the node's z index
        print(node.zPosition)
        
        // loop through all children
        for child in node.children {
            printAllNodes(child)
        }
    }
    
    
}