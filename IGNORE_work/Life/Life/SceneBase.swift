//
//  SceneBase.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//


import SpriteKit

class SceneBase: SKScene {
    
    // frame sizing and scale
    static var sceneScale:CGFloat = 0;
    static var sceneSize:CGSize = CGSize()
    
    
    // create nodes for parts of the screen
    var contentNode = SKNode()
    var animationNode = SKNode()
    var menuOverlayNode = SKNode()
    var menuOverlayStatsNode = SKNode()
    var itemDetailNode = SKNode()
    var itemDetailPopupNode = SKNode()
    var inventoryNode = SKNode()
    var inventoryPopupNode = SKNode()
    
    var levelMode = levelMode_Start
    var itemSelected = Item()
    
    var hasCreatedInventoryMenu = false
    
    
    
    override func didMoveToView(view: SKView) {
        
        name = levelNameBase
        //print(sceneNameBase + " - didMoveToView")
        
        // setup the z positions for all the nodes
        contentNode.zPosition = zPositionContent
        animationNode.zPosition = zPositionAnimations
        menuOverlayNode.zPosition = zPositionMenuOverlay
        menuOverlayStatsNode.zPosition = zPositionMenuOverlayStats
        itemDetailNode.zPosition = zPositionItemDetail
        itemDetailPopupNode.zPosition = zPositionItemDetailPopup
        inventoryNode.zPosition = zPositionInventory
        inventoryPopupNode.zPosition = zPositionInventoryPopup
        
        // name each of the nodes
        contentNode.name = nameContentNode
        animationNode.name = nameAnimationsNode
        menuOverlayNode.name = nameMenuOverlayNode
        menuOverlayStatsNode.name = nameMenuOverlayStatsNode
        itemDetailNode.name = nameItemDetailNode
        itemDetailPopupNode.name = nameItemDetailPopupNode
        inventoryNode.name = nameInventoryNode
        inventoryPopupNode.name = nameInventoryPopupNode
        
        
        // set scene values
        moneyTotal += moneyDataOrigin[currentLevel]["levelAddValue"]! as Int
        // TODO - animation that adds money for each level
        
        
        // creating and adding content to the page
        createContent_Main()
        createContent_MenuOverlay()
 
    }
    
    
    /////////////////////////////////////
    /////////////////////////////////////
    ////          Touches            ////
    /////////////////////////////////////
    /////////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("---------- TOUCHES BEGAN (" + sceneNameBase + ") ----------")
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            print(touchedNode)
            
            if let name = touchedNode.name {
                
                ////////////////////////////
                //  menu overlay buttons  //
                ////////////////////////////
                
                
                ////////////////////////////
                //  inventory buttons     //
                ////////////////////////////
				if name == menuInventoryButtonName {
					runAction_SelectInventoryMenu()
				}
                // exit inventory button
                if name == inventoryExitButtonName {
                    runAction_ExitInventoryMenu()
                }
                // inventory item selected
                for itemCategory in allItems {
                    for item in itemCategory {
                        if name == item.name + inventoryCardName {
                            runAction_SelectInventoryItem(item: item)
                        }
                    }
                }
                // exit inventory item detail
                if name == inventoryPopupExitButtonName {
                    runAction_ExitInventoryPopup()
                }
                
                ////////////////////////////
                //  next scene button     //
                ////////////////////////////
                if name == nextSceneButtonName {
                    runLogic_NextLevel()
                }
                
                
                switch levelMode {
                
                /////////////////////////
                //  item selection     //
                /////////////////////////
                // regular scene, no popups are being displayed
                case levelMode_Start:
                    // loop through items might have selected
                    for item in allItems[currentLevel] {
                        // check if an item
                        if name == item.name + itemNameSuffix {
                            print("running on: " + name)
                            runAction_ShowItemDetail(item)
                        }
                    }
                    
                //////////////////////
                //  item detail     //
                //////////////////////
                // informational display popup is being displayed
                case levelMode_ItemDetail, levelMode_ItemDetail_Message, levelMode_ItemDetail_ErrorMoney, levelMode_ItemDetail_ChangingStats :
					// cancel from item detail
                    if name == popupButtonCancel {
                        runAction_ExitItemDetail()
					}
					// buy item from item detail
                    else if name == popupButtonConfirm {
						runLogic_AttemptBuyItem() // run logic, since there are three options for this action (error, message, actual buy)
					}
					// ok from message (consending)
					else if name == popupButtonBuyMessageOk {
						runAction_ExitBuyMessage()
					}
					// ok from error (out of money)
                    else if name == popupButtonErrorOk {
                        runAction_ExitErrorMoney()
					}
					// ok from stats changing
					else if name == popupButtonStatsChangingOk {
					
						runAction_ExitChangingStats()
					}
					
                    
                default:
                    break
                     
                }
            }
        }
    }
    
    
    ////////////////////////////////////
    ////////////////////////////////////
    ////          Update            ////
    ////////////////////////////////////
    ////////////////////////////////////
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    /////////////////////////////////////////
    /////////////////////////////////////////
    ////          Scene Setup            ////
    /////////////////////////////////////////
    /////////////////////////////////////////
    
    //////////////////
    //  main scene  //
    //////////////////
    func createContent_Main() {
        print("createContent_Main (SceneBase) " + name!)
        
        // put items on screen
        // TODO change this to sprites
        var xCount:CGFloat = 200
        for item in allItems[currentLevel] {
            contentNode.addChild(createTestItem(name: item.name + itemNameSuffix, text: item.detailName, x: xCount, y: heightMid))
            xCount += 300
        }
        
        self.addChild(contentNode)
    }
    
    /////////////////
    //  main menu  //
    /////////////////
    func createContent_MenuOverlay() {
        print("createContent_MenuOverlay (SceneBase) " + name!)
        
        // inventory
        menuOverlayNode.addChild(createInventoryButton())
        
        // money
        let moneyNode = createMoneyStats()
        menuOverlayStatsNode.addChild(moneyNode)
        
        // stats
        let traitsNode = createTraitsStats()
        menuOverlayStatsNode.addChild(traitsNode)
        menuOverlayNode.addChild(menuOverlayStatsNode)
        
        // next scene
        let nextSceneButton = createNextSceneButton()
        menuOverlayNode.addChild(nextSceneButton)
        
        // add menu overlay
        self.addChild(menuOverlayNode)
    }
    
    
    
    
    
    //////////////////////////////////////////
    //////////////////////////////////////////
    ////          Game Actions            ////
    //////////////////////////////////////////
    //////////////////////////////////////////
    
    /////////////////
    //  inventory  //
    /////////////////
	func runAction_SelectInventoryMenu() {
		print("runAction_SelectInventoryMenu (SceneBase) " + name!)
		
		// change mode
		levelMode = levelMode_Inventory
		
		// TODO optimize this, just refresh the inventory display instead of re-creating the entire inventory menu every time
		if !hasCreatedInventoryMenu || true {
			//print("creating inventory menu")
			
			let inv = createInventoryMenu()
			inventoryNode.addChild(inv)
			
			// set created to true
			hasCreatedInventoryMenu = true
		}
		
		// remove the main content for optimal perf (menu overlay is left on)
		contentNode.removeFromParent()
		menuOverlayNode.removeFromParent()
		
		
		// add inventory node
		self.addChild(inventoryNode)
		
		//print("---------- SELF CHILDREN (FROM SceneBase) -----------")
		//printAllNodes(self)
	}
	
    func runAction_ExitInventoryMenu() {
        print("runAction_ExitInventoryMenu (SceneBase) " + name! + "\n")
        
		// change mode
		levelMode = levelMode_Start
		
        // add main content back to screen
        self.addChild(contentNode)
        self.addChild(menuOverlayNode)
        
        // remove inventory menu from screen
        inventoryNode.removeFromParent()
    }
    
    func runAction_SelectInventoryItem(item item: Item) {
        print("runAction_SelectInventoryItem (SceneBase) " + name!)
        
        // change mode
		levelMode = levelMode_Inventory_ItemDetail
        
        // create inventory item detail popup
        let invDetail = createInventoryItemDetailPopup()
        
        // add to creater inventory popup
        inventoryPopupNode.addChild(invDetail)
        
        // add to screen
        self.addChild(inventoryPopupNode)
    }
    
    func runAction_ExitInventoryPopup() {
        print("runAction_ExitInventoryPopup (SceneBase) " + name! + "\n")
        
		// change mode
		levelMode = levelMode_Inventory
		
        // delete inventory popup's content
        inventoryPopupNode.removeAllChildren()
        
        // remove inventory popup from screen
        inventoryPopupNode.removeFromParent()
    }
    
	
    //////////////////////////////////////
    //  item detail - show item detail  //
    //////////////////////////////////////
    func runAction_ShowItemDetail(item: Item) {
        print("runAction_ShowItemDetail (SceneBase) " + name!)
		
		// change mode
        levelMode = levelMode_ItemDetail
		
		// save this!
        itemSelected = item
		
		// create the item detail popup
		itemDetailNode.addChild(createItemDetail())
		addChild(itemDetailNode)
	}
	
    func runAction_ExitItemDetail() {
        print("runAction_ExitItemDetail (SceneBase) " + name! + "\n")
		
		// change mode
        levelMode = levelMode_Start
		
		// remove entire popup
        itemDetailNode.removeAllChildren()
        itemDetailNode.removeFromParent()
    }
	
	////////////////////////////////////////
	//  item detail - concending message  //
	////////////////////////////////////////
	func runAction_ShowBuyMessage() {
		print("runAction_ShowBuyMessage (SceneBase) " + name!)
		
		// change mode
		levelMode = levelMode_ItemDetail_Message
		
		// add message popup to item detail popup
		itemDetailPopupNode.addChild(createBuyMessage())
		addChild(itemDetailPopupNode)
	}
	func runAction_ExitBuyMessage() {
		print("runAction_ExitBuyMessage (SceneBase) " + name! + "\n")
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the message popup
		itemDetailPopupNode.removeAllChildren()
		itemDetailPopupNode.removeFromParent()
		
		// will automatically go back to item detail (no code needed for that action)
	}
	
	
	///////////////////////////////////
	//  item detail - error - money  //
	///////////////////////////////////
	func runAction_ShowErrorMoney() {
		print("runAction_ShowErrorMoney (SceneBase) " + name!)
		
		// change mode
		levelMode = levelMode_ItemDetail_ErrorMoney
		
		// add message popup to item detail popup
		itemDetailPopupNode.addChild(createErrorMoney())
		addChild(itemDetailPopupNode)
	}
	func runAction_ExitErrorMoney() {
		print("runAction_ExitErrorMoney (SceneBase) " + name! + "\n")
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the error popup
		itemDetailPopupNode.removeAllChildren()
		itemDetailPopupNode.removeFromParent()
		
		// exit from item detail also
		runAction_ExitItemDetail()
	}
	
	
	/////////////////////////////////////
	//  item detail - changing stats   //
	/////////////////////////////////////
	func runAction_ShowChangingStats() {
		print("runAction_ShowChangingStats (SceneBase) " + name!)
		
		// change mode
		levelMode = levelMode_ItemDetail_ChangingStats
		
		// display stats changing - TODO animate this
		itemDetailPopupNode.addChild(createChangeStats())
		addChild(itemDetailPopupNode)
		
		// actually change the stats in the data models
		var key = 0
		for traitValueChange in itemSelected.traitValueChanges {
			traitsDataOrigin[key]["value"] = (traitsDataOrigin[key]["value"] as! Int) + traitValueChange
			key += 1
		}
		
		// save the new item and stats to plist
		saveItemsToDisk()
		
		// update things that are on the start screen
		runAction_UpdateMenuOverlayStats()
	}
	func runAction_ExitChangingStats() {
		print("runAction_ExitChangingStats (SceneBase) " + name! + "\n")
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the changing stats popup
		itemDetailPopupNode.removeAllChildren()
		itemDetailPopupNode.removeFromParent()
		
		// exit item detail also
		runAction_ExitItemDetail()
	}
	func runAction_UpdateMenuOverlayStats() {
		print("runAction_UpdateMenuOverlayStats (SceneBase) " + name!)
		
		let l = (menuOverlayStatsNode.childNodeWithName(statusMoneyNodeName))!.childNodeWithName(statusMoneyLevelName)
		//print(l)
		
		let newWidth = calcBarWidth(
			width: statusTraitLevelWidthMax, 
			total: moneyTotal, 
			max: traitsDataOrigin[currentLevel]["max"] as! Int
		)
		
		(l as! SKSpriteNode).size = CGSize(width: newWidth, height: (l?.frame.height)!)
	}
    
    
	
	
	////////////////////////////////////////
	////////////////////////////////////////
	////          Game Logic            ////
	////////////////////////////////////////
	////////////////////////////////////////
	
    /////////////////////////
    //  item detail - buy  //
    /////////////////////////
    // will be called from children
    func runLogic_AttemptBuyItem() {
        print("runLogic_AttemptBuyItem (SceneBase) " + name!)
        
		// increase buy attempts for item
        itemSelected.buyAttempts += 1
        
        // check if have money
        if(moneyTotal >= itemSelected.detailCost) {
            
            // check if attempts is equal to min num of buys
            if itemSelected.buyAttempts == itemSelected.buyMinAttempts {
				
				// yay!!! we can buy the item
                runLogic_ActuallyBuyItem()
                
            } else {
				// money, but not enough buy attempts
				runAction_ShowBuyMessage()
            }
        } else {
            // no money, create warning popup
			runAction_ShowErrorMoney()
        }
    }
    
    func runLogic_ActuallyBuyItem() {
        print("runLogic_ActuallyBuyItem (SceneBase) " + name!)
		
		// logic things
		moneyTotal -= itemSelected.detailCost		// decrease money - TODO animate this
		itemSelected.buyAttempts = 0				// reset try counter
		itemSelected.owns += 1						// add to item own count - this will count as inventory
		
		// go to stats changing popup
		runAction_ShowChangingStats()
    }
    
	
	//////////////////
	//  next level  //
	//////////////////
    func runLogic_NextLevel() {
        print("----------- runLogic_NextLevel -----------")
        
        // create a transistion
        let transition = SKTransition.fadeWithDuration(0.5)
        
        let scene: SceneBase = {
            switch currentLevel {
            
            // startScene game going to infancyScene
            case currentLevel_Start:
                print("going to SceneInfancy")
				currentLevel = currentLevel_Infancy
                return SceneInfancy()
                
            // infancyScene going to childhoodScene
            case currentLevel_Infancy:
                print("going to SceneChildhood")
				currentLevel = currentLevel_Childhood
                return SceneChildhood()
                
            // childhoodScene going to adolescenceScene
            case currentLevel_Childhood:
                print("going to SceneAdolescence")
				currentLevel = currentLevel_Adolescence
                return SceneAdolescence()
                
            // adolescenceScene going to teensScene
            case currentLevel_Adolescence:
                print("going to SceneTeens")
				currentLevel = currentLevel_Teens
                return SceneTeens()
                
            // teensScene going to collegeScene
            case currentLevel_Teens:
                print("going to SceneCollege")
				currentLevel = currentLevel_College
                return SceneCollege()
                
            // collegeScene going to adulthoodScene
            case currentLevel_College:
                print("going to SceneAdulthood")
				currentLevel = currentLevel_Adulthood
                return SceneAdulthood()
                
            // adulthoodScene going to end gameScene
            case currentLevel_Adulthood:
                print("going to SceneEnd")
				currentLevel = currentLevel_End
                return SceneEnd()
            
            // defaulted to start again
            default:
                print("error - going to SceneInfancy")
				currentLevel = currentLevel_Start
                return SceneStart()
            }
        }()
        
        // Configure the scene
        scene.scaleMode = .AspectFill
        scene.size = SceneBase.sceneSize
        
        // go to that scene
        view!.presentScene(scene, transition: transition)
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
