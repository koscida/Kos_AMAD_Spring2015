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
    var sceneNode_content = SKNode()
    var sceneNode_animation = SKNode()
    var sceneNode_menuOverlay = SKNode()
    var sceneNode_itemDetail = SKNode()
	var sceneNode_itemDetailPopup = SKNode()
    var sceneNode_inventory = SKNode()
    var sceneNode_inventoryPopup = SKNode()
    
    var levelMode = levelMode_Start
    var itemSelected = Item()
    
    var hasCreatedInventoryMenu = false
	
	
	var animatingAlpha = false
	var nodeToChange = SKNode()
    
    
    
    override func didMoveToView(view: SKView) {
        name = levelNameBase
        //print(sceneNameBase + " - didMoveToView")
        
        // setup the z positions for all the nodes
        sceneNode_content.zPosition = zPositionContent
        sceneNode_animation.zPosition = zPositionAnimations
        sceneNode_menuOverlay.zPosition = zPositionMenuOverlay
        sceneNode_itemDetail.zPosition = zPositionItemDetail
		sceneNode_itemDetailPopup.zPosition = zPositionItemDetailPopup
        sceneNode_inventory.zPosition = zPositionInventory
        sceneNode_inventoryPopup.zPosition = zPositionInventoryPopup
        
        // name each of the nodes
        sceneNode_content.name = nameContentNode
        sceneNode_animation.name = nameAnimationsNode
        sceneNode_menuOverlay.name = nameMenuOverlayNode
        sceneNode_itemDetail.name = nameItemDetailNode
		sceneNode_itemDetailPopup.name = nameItemDetailPopupNode
        sceneNode_inventory.name = nameInventoryNode
        sceneNode_inventoryPopup.name = nameInventoryPopupNode
        
        
        // set scene values
        moneyTotal += levelData[currentLevel].moneyAddValue
		moneyGoal = moneyTotal
        // TODO: animation that adds money for each level
		
		for t in traitsDataOrigin {
			t.valueGoal = t.value
		}
        
        
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
		// TODO: add check for next scene, make sure want to do that
        
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
                for level in levelData {
                    for item in level.items {
                        if name == item.name + inventoryCardName {
                            runAction_SelectInventoryItem(item: item)
                        }
                    }
                }
                // exit inventory item detail
                if name == inventoryItemDetailExitButtonName {
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
                    for item in levelData[currentLevel].items {
                        // check if an item
                        if name == item.name + itemDisplayNameSuffix {
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
                    if name == itemDetailButtonCancel {
                        runAction_ExitItemDetail()
					}
					// buy item from item detail
                    else if name == itemDetailButtonConfirm {
						runLogic_AttemptBuyItem() // run logic, since there are three options for this action (error, message, actual buy)
					}
					// ok from message (consending)
					else if name == buyConfirmMessageOk {
						runAction_ExitBuyMessage()
					}
					// ok from error (out of money)
                    else if name == errorButtonOk {
                        runAction_ExitErrorMoney()
					}
					// ok from stats changing
					else if name == changingStatsButtonOk {
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
		
		/////////////////////////////////////////
		// animate the item display scroll
		if levelMode == levelMode_Start {
			for n in sceneNode_content.children { // this is the container node
				let node = n as! ItemDisplay
				
				// check if end reached end of screen (and that there is only 1 node) - add a second node
				if (node.position.x <= ((node.width - width)*(-1))) && (sceneNode_content.children.count == 1) {
					let node2 = createItems()
					node2.position.x = width + itemPadding
					sceneNode_content.addChild(node2)
				}
				
				// check if off screen - remove it
				if node.position.x <= (node.width * (-1)) {
					node.removeFromParent()
				}
				
				// move it
				let newX = node.position.x - itemDisplayXIncrament
				node.position = CGPoint(x: newX, y: node.position.y)
			}
		}
		
		///////////////////////////////////////////////////
		// adding a popup, so animate the fading in
		if animatingAlpha {
			if nodeToChange.alpha < 1 {
				nodeToChange.alpha += alphaIncrament
			} else {
				animatingAlpha = false
			}
		}
		
		///////////////////////////////
		// UPDATE STATS CHANGING!!!
		if levelMode == levelMode_ItemDetail_ChangingStats {
			
			// compare money, if not equal, need to change
			// TODO: fix this - show int not float
			if moneyGoal < moneyTotal {
				//print("moneyGoal: " + String(moneyGoal) + " moneyTotal: " + String(moneyTotal))
				if(moneyGoal != moneyTotal) {
					// decrement the money model
					moneyTotal -= changingStatsMoneyDecrement
					
					// display this new money model data
					let moneyNode: SKLabelNode = (sceneNode_itemDetailPopup.childNodeWithName("//" + changingStatsMoneyNodeName)) as! SKLabelNode
					moneyNode.text = "Money: " + String(moneyTotal)
				}
			}
			
			// compare traits, update them
			for trait in traitsDataOrigin {
				if(trait.value < trait.valueGoal) {
					// change value
					trait.value += changingStatsTraitIncrement
				}
				if(trait.value > trait.valueGoal) {
					// change value
					trait.value -= changingStatsTraitIncrement
				}
				
				// display model data
				let traitNode = (sceneNode_itemDetailPopup.childNodeWithName("//" + trait.name + changingStatsTraitSuffix)) as! SKSpriteNode
				let newLevelWidth = calcBarWidth(maxWidth: changingStatsTraitWidth, currentValue: trait.value, maxValue: trait.max)
				traitNode.size = CGSize(width: newLevelWidth, height: changingStatsTraitHeight)
				traitNode.position = CGPoint(x: changingStatsTraitXLeft + (newLevelWidth/2), y: traitNode.position.y)
			}
		}
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
        // TODO: change this to sprites
		sceneNode_content.addChild(createItems())
        
        
        self.addChild(sceneNode_content)
    }
    
    /////////////////
    //  main menu  //
    /////////////////
    func createContent_MenuOverlay() {
        print("createContent_MenuOverlay (SceneBase) " + name!)
        
        // inventory
        sceneNode_menuOverlay.addChild(createInventoryButton())
        
		// stats
		let statsNode = createStatsBar()
		sceneNode_menuOverlay.addChild(statsNode)
		
                
        // next scene
        let nextSceneButton = createNextSceneButton()
        sceneNode_menuOverlay.addChild(nextSceneButton)
        
        // add menu overlay
        self.addChild(sceneNode_menuOverlay)
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
		
		// TODO: optimize this, just refresh the inventory display instead of re-creating the entire inventory menu every time
		if !hasCreatedInventoryMenu || true {
			//print("creating inventory menu")
			
			let inv = createInventoryMenu()
			sceneNode_inventory.addChild(inv)
			
			// set created to true
			hasCreatedInventoryMenu = true
		}
		
		// remove the main content for optimal perf (menu overlay is left on)
		sceneNode_content.removeFromParent()
		sceneNode_menuOverlay.removeFromParent()
		
		
		// add inventory node
		self.addChild(sceneNode_inventory)
		
		//print("---------- SELF CHILDREN (FROM SceneBase) -----------")
		//printAllNodes(self)
	}
	
    func runAction_ExitInventoryMenu() {
        print("runAction_ExitInventoryMenu (SceneBase) " + name! + "\n")
        
		// change mode
		levelMode = levelMode_Start
		
        // add main content back to screen
        self.addChild(sceneNode_content)
        self.addChild(sceneNode_menuOverlay)
        
        // remove inventory menu from screen
        sceneNode_inventory.removeFromParent()
    }
    
    func runAction_SelectInventoryItem(item item: Item) {
        print("runAction_SelectInventoryItem (SceneBase) " + name!)
        
        // change mode
		levelMode = levelMode_Inventory_ItemDetail
        
        // create inventory item detail popup
		let invDetail = createInventoryItemDetailPopup(itemSelected: item)
        
        // add to creater inventory popup
        sceneNode_inventoryPopup.addChild(invDetail)
        
        // add to screen
        self.addChild(sceneNode_inventoryPopup)
		animatingAlpha = true; nodeToChange = sceneNode_inventoryPopup; nodeToChange.alpha = 0
    }
    
    func runAction_ExitInventoryPopup() {
        print("runAction_ExitInventoryPopup (SceneBase) " + name! + "\n")
        
		// change mode
		levelMode = levelMode_Inventory
		
        // delete inventory popup's content
        sceneNode_inventoryPopup.removeAllChildren()
        
        // remove inventory popup from screen
        sceneNode_inventoryPopup.removeFromParent()
    }
    
	
    //////////////////////////////////////
    //  item detail - show item detail  //
    //////////////////////////////////////
    func runAction_ShowItemDetail(item: Item) {
        print("runAction_ShowItemDetail (SceneBase) " + name!)
		
		// change mode
        levelMode = levelMode_ItemDetail
		
		// save which item selected!
        itemSelected = item
		
		// create the item detail popup
		sceneNode_itemDetail.addChild(createItemDetail(itemSelected: itemSelected))
		addChild(sceneNode_itemDetail)
		animatingAlpha = true; nodeToChange = sceneNode_itemDetail; nodeToChange.alpha = 0
	}
	
    func runAction_ExitItemDetail() {
        print("runAction_ExitItemDetail (SceneBase) " + name! + "\n")
		
		// change mode
        levelMode = levelMode_Start
		
		// remove entire popup
        sceneNode_itemDetail.removeAllChildren()
        sceneNode_itemDetail.removeFromParent()
    }
	
	////////////////////////////////////////
	//  item detail - concending message  //
	////////////////////////////////////////
	func runAction_ShowBuyMessage() {
		print("runAction_ShowBuyMessage (SceneBase) " + name!)
		
		// change mode
		levelMode = levelMode_ItemDetail_Message
		
		// add message popup to item detail popup
		sceneNode_itemDetailPopup.addChild(createBuyConfirmMessage(itemSelected: itemSelected))
		addChild(sceneNode_itemDetailPopup)
		animatingAlpha = true; nodeToChange = sceneNode_itemDetailPopup; nodeToChange.alpha = 0
	}
	func runAction_ExitBuyMessage() {
		print("runAction_ExitBuyMessage (SceneBase) " + name! + "\n")
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the message popup
		sceneNode_itemDetailPopup.removeAllChildren()
		sceneNode_itemDetailPopup.removeFromParent()
		
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
		sceneNode_itemDetailPopup.addChild(createErrorMoney())
		addChild(sceneNode_itemDetailPopup)
		animatingAlpha = true; nodeToChange = sceneNode_itemDetailPopup; nodeToChange.alpha = 0
	}
	func runAction_ExitErrorMoney() {
		print("runAction_ExitErrorMoney (SceneBase) " + name! + "\n")
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the error popup
		sceneNode_itemDetailPopup.removeAllChildren()
		sceneNode_itemDetailPopup.removeFromParent()
		
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
		
		// display stats changing
		sceneNode_itemDetailPopup.addChild(createChangeStats())
		addChild(sceneNode_itemDetailPopup)
		animatingAlpha = true; nodeToChange = sceneNode_itemDetailPopup; nodeToChange.alpha = 0
	}
	func runAction_ExitChangingStats() {
		print("runAction_ExitChangingStats (SceneBase) " + name! + "\n")
		
		// ACTUALLY CHANGE DATA MODELS - we do this after so model data doesn't get in the way of changing stats data
		// traits
		/*var key = 0
		for traitValueChange in itemSelected.traitValueChanges {
			traitsDataOrigin[key].value += traitValueChange
			key += 1
		}
		
		// money
		moneyTotal -= itemSelected.detailCost*/
		
		
		// save the new item and stats to plist
		saveItemsToDisk()
		
		
		// update things that are on the start screen
		runAction_UpdateMenuOverlayStats()
		
		
		// change mode
		levelMode = levelMode_ItemDetail
		
		// remove the changing stats popup
		sceneNode_itemDetailPopup.removeAllChildren()
		sceneNode_itemDetailPopup.removeFromParent()
		
		// exit item detail also
		runAction_ExitItemDetail()
	}
	// by now the stats will have been updated, so all that needs to be done is to redraw them on the screen
	func runAction_UpdateMenuOverlayStats() {
		print("runAction_UpdateMenuOverlayStats (SceneBase) " + name!)
		
		// update money
		let moneyNode: SKLabelNode = (sceneNode_menuOverlay.childNodeWithName("//" + statusMoneyNodeName)) as! SKLabelNode
		//print(moneyNode)
		moneyNode.text = "Money: " + String(moneyTotal)
		
		// update stats
		var runningXLeft = statusTraitLeftX
		for trait in traitsDataOrigin {
			let node: SKSpriteNode = sceneNode_menuOverlay.childNodeWithName("//" + trait.name + statusTraitNameSuffix) as! SKSpriteNode
			let newLevelWidth = calcBarWidth(maxWidth: statusTraitLevelWidthMax, currentValue: trait.value, maxValue: trait.max)
			//print(trait.name + " - statusTraitLevelWidthMax: " + String(statusTraitLevelWidthMax) + " - value: " + String(trait.value) + " max: " + String(trait.max) + " width: " + String(newLevelWidth))
			node.size = CGSize(width: newLevelWidth, height: statusTraitLevelHeight)
			node.position = CGPoint(x: runningXLeft + (newLevelWidth/2), y: statusTraitY)
			runningXLeft -= (statusTraitBarWidth + statusPadding)
		}
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
		itemSelected.buyAttempts = 0				// reset try counter
		itemSelected.owns += 1						// add to item own count - this will count as inventory
		
		
		// update money goals
		moneyGoal -= itemSelected.detailCost
		
		// update trait goals
		var key = 0
		for trait in traitsDataOrigin {
			trait.valueGoal += itemSelected.traitValueChanges[key]
			key += 1
		}
		
		
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
