//
//  SKHelper.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit



//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - SHAPES (GENERIC)            
////                                                          ////
//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////

// Base (fraction width and height) (exact x and y)
func createRect(name name: String, widthFraction: CGFloat, heightFraction: CGFloat, xExact: CGFloat, yExact: CGFloat, fillColor:  UIColor) -> SKNode {
    return createRectBase(name: name, size: CGSize(width: widthFraction, height: heightFraction), position: CGPoint(x: xExact, y: yExact), fillColor: fillColor)
}

// Base (fraction width and height) (exact x and y) (color = white)
func createRect(name name: String, widthFraction: CGFloat, heightFraction: CGFloat, xExact: CGFloat, yExact: CGFloat) -> SKNode {
    return createRectBase(name: name, size: CGSize(width: widthFraction, height: heightFraction), position: CGPoint(x: xExact, y: yExact), fillColor: UIColor.whiteColor())
}

// Base (exact width and height) (exact x and y)
func createRect(name name: String, widthExact: CGFloat, heightExact: CGFloat, xExact: CGFloat, yExact: CGFloat, fillColor:  UIColor) -> SKNode {
    return createRectBase(name: name, size: CGSize(width: widthExact, height: heightExact), position: CGPoint(x: xExact, y: yExact), fillColor: fillColor)
}

// Base (exact width and height) (exact x and y) (color = white)
func createRect(name name: String, widthExact: CGFloat, heightExact: CGFloat, xExact: CGFloat, yExact: CGFloat) -> SKNode {
    return createRectBase(name: name, size: CGSize(width: widthExact, height: heightExact), position: CGPoint(x: xExact, y: yExact), fillColor: UIColor.whiteColor())
}

// Base
func createRectBase(name name: String, size: CGSize, position: CGPoint, fillColor:  UIColor) -> SKSpriteNode {
    let skNode = SKSpriteNode(color: fillColor, size: size)
    skNode.name = name
    skNode.position = position
    
    return skNode
}

func createSpriteBase(name name: String, size: CGSize, position: CGPoint, imageName: String) -> SKSpriteNode {
	
	let tmpTex = SKTexture(imageNamed: imageName)
	let skNode = SKSpriteNode(texture: tmpTex, size: size)
	
	//skNode.size = size
	skNode.name = name
	skNode.position = position
	
	return skNode
}




//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - LABELS (GENERIC)         ////
////                                                          ////
//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////

// Base Title (top-left justified) (font size = 100) (fontName = "MarkerFelt-Wide")
func createLabelTitleLeftJustified(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 100, textColor: textColor, fontName: "MarkerFelt-Wide")
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Top
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    return sknode;
}

// Base Title (centered) (font size = 100) (fontName = "MarkerFelt-Wide")
func createLabelTitleCentered(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 100, textColor: textColor, fontName: fontTitle)
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
    return sknode;
}

// Base Text (top-left justified) (font size = 50) (fontColor = black) (fontName = "MarkerFelt-Wide")
func createLabelTextLeftJustified(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 50, textColor: textColor, fontName: fontText)
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Top
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    return sknode;
}

// Base Text (top-left justified) (font size = 50) (fontColor = black) (fontName = "MarkerFelt-Wide")
func createLabelTextCentered(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 50, textColor: textColor, fontName: fontText)
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
    return sknode;
}

func createLabelFillRect(name name: String, text: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
	let node = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 50, textColor: textColor, fontName: fontText)
	
	scaleAndPositionLabelNode(node: node, x: x, y: y, width: width, height: height)
	return node;
}


// Base
func createLabelBase(name name: String, text: String, position: CGPoint, textSize: CGFloat, textColor:  UIColor, fontName: String) -> SKLabelNode {
    let sknode = SKLabelNode(fontNamed: fontName)
    //sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
    //sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
    sknode.name = name
    sknode.text = text
    sknode.position = position
    sknode.fontSize = textSize
    sknode.fontColor = textColor
    
    return sknode
}





//// ///////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////// ////
////                                                               ////
////              Helper Functions - BUTTONS (GENERAL)             ////
////                                                               ////
//// ///////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////// ////
func createSimpleButtonCentered(name name: String, text: String, x: CGFloat, y: CGFloat, widthExact: CGFloat, heightExact: CGFloat, textColor: UIColor, fillColor: UIColor) -> SKNode {
    
    let btn = SKNode()
    btn.name = name
    
    let label = createLabelTextCentered(name: name, text: text, x: x, y: y, textColor: textColor)
    btn.addChild(label)
    
    let back = createRect(name: name, widthExact: widthExact, heightExact: heightExact, xExact: x, yExact: y, fillColor: fillColor)
    btn.addChild(back)
    
    return btn
}







//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
////                                                                      ////
////              Helper Functions - POP UPS (GENERAL)             
////                                                                      ////
//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
func createMuteOverlay() -> SKNode {
    return createRect(name: "popupMuteOverlay", widthExact: width, heightExact: height, xExact: popupX, yExact: popupY, fillColor: colorPopupMute)
}
func createPopupBack(width width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> SKNode {
    return createRect(name: "popupDisplayBack", widthExact: width, heightExact: height, xExact: x, yExact: y, fillColor: colorPopupBack)
}

func createPopupButtonSmall(name name: String, text: String, bright: Bool, onRight: Bool) -> SKNode {
    let buttonX = (onRight) ? itemDetailRightButtonX : itemDetailLeftButtonX
    let buttonBackColor = (bright) ? colorPopupButtonSmallFillBright : colorPopupButtonSmallFillMuted
    let buttonTextColor = (bright) ? colorPopupButtonSmallTextBright : colorPopupButtonSmallTextMuted
    
    return createSimpleButtonCentered(name: name, text: text, x: buttonX, y: itemDetailButtonY, widthExact: itemDetailButtonWidth, heightExact: itemDetailButtonHeight, textColor: buttonTextColor, fillColor: buttonBackColor)
}

func createPopupButtonLarge(name name: String, text: String, x: CGFloat, y: CGFloat) -> SKNode {
	return createSimpleButtonCentered(name: name, text: text, x: x, y: y, widthExact: popupButtonBigWidth, heightExact: popupButtonBigHeight, textColor: colorPopupButtonBigFill, fillColor: colorPopupButtonBigText)
}

func createPopupButtonExit(name name: String, x: CGFloat, y: CGFloat) -> SKNode {
    return createSimpleButtonCentered(name: name, text: "X", x: x, y: y, widthExact: exitButtonWidth, heightExact: exitButtonHeight, textColor: colorInventoryButtonExitText, fillColor: colorInventoryButtonExitFill)
}






//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
////                                                           ////
////              Helper Functions - CREATE ITEM               ////
////                                                           ////
//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
func createItems() -> ItemDisplay {
	
	let node = ItemDisplay()
	node.name = "itemsScrolling"
	
	var runningXLeft: CGFloat = 0
	var runningWidth: CGFloat = 0
	
	for item in levelData[currentLevel].items {
		let n = createItemDisplay(item: item, xLeft: runningXLeft)
		node.addChild(n)
		
		runningXLeft += itemDisplayWidth + (itemPadding*2)
		runningWidth += (n.width + itemPadding)
	}
	
	node.width = runningWidth
	
	return node
}

func createItemDisplay(item item: Item, xLeft: CGFloat) -> ItemDisplay {
	let name = item.name + itemDisplayNameSuffix
	
	let node = ItemDisplay()
	node.name = name
	node.width = itemDisplayWidth
	
	// back
	node.addChild(
		createRect(name: name, widthExact: itemDisplayWidth, heightExact: itemDisplayHeight, xExact: xLeft + (itemDisplayWidth/2), yExact: itemDisplayY, fillColor: colorItemDisplayBack)
	)
	
	// image
	node.addChild(
		createSpriteBase(name: name, size: CGSize(width: itemDisplayImageWidth, height: itemDisplayImageHeight), position: CGPoint(x: xLeft + itemDisplayXOffset, y: itemDisplayImageY), imageName: item.resourceName)
	)
	
	// name?
	// TODO: add name to item display scrolling
	
	return node
}






//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
////                                                           ////
////              Helper Functions - SCENE START               ////
////                                                           ////
//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
func createSceneStart() -> SKNode {
	let node = SKNode()
	
	let titleLabel1 = createLabelTitleCentered(name: "", text: "This is a game", x: widthMid, y: heightMid + 300, textColor: colorStartText)
	node.addChild(titleLabel1)
	
	let titleLabel2 = createLabelTitleCentered(name: "", text: "about the game of life", x: widthMid, y: heightMid + 100, textColor: colorStartText)
	node.addChild(titleLabel2)
	
	let titleLabel3 = createLabelTitleCentered(name: "", text: "for women", x: widthMid, y: heightMid - 100, textColor: colorStartText)
	node.addChild(titleLabel3)
	
	let playButton = createPopupButtonLarge(name: "playButton", text: "PLAY", x: widthMid, y: heightMid - 300)
	node.addChild(playButton)
	
	return node
}








//// /////////////////////////////////////////////////////// ////
//// /////////////////////////////////////////////////////// ////
////                                                         ////
////              Helper Functions - ITEM DEATIL             ////
////                                                         ////
//// /////////////////////////////////////////////////////// ////
//// /////////////////////////////////////////////////////// ////
func createItemDetail(itemSelected itemSelected: Item) -> SKNode {
	let node = SKNode()
	node.name = "itemDetail"
	node.zPosition = zPositionItemDetail
	
	// mute overlay
	let muteOverlay = createMuteOverlay()
	node.addChild(muteOverlay)
	
	// display back
	let displayBack = createPopupBack(width: itemDetailWidth, height: itemDetailHeight, x: itemDetailX, y: itemDetailY)
	node.addChild(displayBack)
	
	// cancel
	let cancelButton = createPopupButtonSmall(name: itemDetailButtonCancel, text: "Cancel", bright: false, onRight: false)
	node.addChild(cancelButton)
	
	// confirm
	let confirmButton = createPopupButtonSmall(name: itemDetailButtonConfirm, text: "Buy", bright: true, onRight: true)
	node.addChild(confirmButton)
	
	// item image
	let imgNode = createSpriteBase(
		name: itemSelected.name + "_img", 
		size: CGSize(width: itemDetailImageWidth, 
			height: itemDetailImageHeight), 
		position: CGPointMake(itemDetailImageX, itemDetailImageY), 
		imageName: itemSelected.resourceName)
	node.addChild(imgNode)
	
	// item name
	let title = createItemDetailTitle(name: itemSelected.name + "_name", text: itemSelected.detailName)
	node.addChild(title)
	
	// item desc
	let desc = createItemDetailDescription(name: itemSelected.name + "_desc", text: itemSelected.detailDescription)
	node.addChild(desc)
	
	// item cost
	let cost = createItemDetailCost(name: itemSelected.name + "_cost", cost: itemSelected.detailCost)
	node.addChild(cost)
	
	// TODO: item stats
	
	return node
}
func createItemDetailTitle(name name: String, text: String) -> SKLabelNode {
	
	let node = SKLabelNode(fontNamed: fontTitle)
	
	node.name = name
	node.text = text
	node.fontColor = UIColor.whiteColor()
	
	scaleAndPositionLabelNode(node: node, x: itemDetailTitleX, y: itemDetailTitleY, width: itemDetailTitleWidth, height: itemDetailTitleHeight)
	
	return node;
}
func createItemDetailDescription(name name: String, text: String) -> SKLabelNode {
	let node = SKLabelNode(fontNamed: fontText)
	
	node.name = name
	node.text = text
	node.fontColor = UIColor.whiteColor()
	
	scaleAndPositionLabelNode(node: node, x: itemDetailDescX, y: itemDetailDescY, width: itemDetailDescWidth, height: itemDetailDescHeight)
	
	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
	node.position = CGPoint(x: itemDetailDescXLeft, y: itemDetailDescY)
	
	return node
}
func createItemDetailCost(name name: String, cost: CGFloat) -> SKLabelNode {
	let node = SKLabelNode(fontNamed: fontText)
	
	node.name = name
	node.text = "Cost: " + String(cost)
	node.fontColor = UIColor.whiteColor()
	
	scaleAndPositionLabelNode(node: node, x: itemDetailCostX, y: itemDetailCostY, width: itemDetailCostWidth, height: itemDetailCostHeight)
	
	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
	
	node.position = CGPoint(x: itemDetailCostXLeft, y: itemDetailCostY)
	
	return node
}



//// ////////////////////////////////////////////////////////// ////
//// ////////////////////////////////////////////////////////// ////
////															////
////              Helper Functions - BUY CONFIRMATION
////															////
//// ////////////////////////////////////////////////////////// ////
//// ////////////////////////////////////////////////////////// ////
func createBuyConfirmMessage(itemSelected itemSelected: Item) -> SKNode {
	let node = SKNode()
	node.name = "buyMessage"
	node.zPosition = zPositionItemDetailPopup
	
	// mute
	let mute = createMuteOverlay()
	node.addChild(mute)
	
	/// display back
	let displayBack = createPopupBack(width: buyConfirmWidth, height: buyConfirmHeight, x: buyConfirmX, y: buyConfirmY)
	node.addChild(displayBack)
	
	// TODO: item buy confirmation message
	let msg = createLabelTextCentered(name: "msg", text: itemSelected.tryMessages[itemSelected.buyAttempts-1], x: buyConfirmLabelX, y: buyConfirmLabelY, textColor: UIColor.blackColor())
	node.addChild(msg)
	
	// confirm
	let confirmButton = createPopupButtonLarge(name: buyConfirmMessageOk, text: "OKAY", x: buyConfirmButtonX, y: buyConfirmButtonY)
	node.addChild(confirmButton)
	
	// done
	return node
}



//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
////                                                                       ////
////              Helper Functions - BUY ERROR            
////                                                                       ////
//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
func createErrorMoney() -> SKNode {
	let node = SKNode()
	node.name = "moneyWarning"
	node.zPosition = zPositionItemDetailPopup
	
	// mute
	let mute = createMuteOverlay()
	node.addChild(mute)
	
	/// display back
	let displayBack = createRect(name: "popupDisplayBackWarning", widthExact: errorWidth, heightExact: errorHeight, xExact: errorX, yExact: errorY, fillColor: colorPopupBackWarning)
	node.addChild(displayBack)
	
	// confirm
	let confirmButton = createPopupButtonLarge(name: errorButtonOk, text: "OKAY", x: errorButtonX, y: errorButtonY)
	node.addChild(confirmButton)
	
	// TODO: item warning message
	node.addChild(
		createLabelFillRect(name: "", text: "Error: You do not have\n enough money to buy this item", width: errorMessageWidth, height: errorMessageHeight, x: errorMessageX, y: errorMessageY, textColor: colorPopupText)
	)
	
	// done
	return node
}





//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
////                                                                       ////
////              Helper Functions - CHANGE STATS            
////                                                                       ////
//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
func createChangeStats() -> SKNode {
	let node = SKNode()
	node.name = "changingStats"
	node.zPosition = zPositionItemDetailPopup + 1
	
	// mute
	let mute = createMuteOverlay()
	node.addChild(mute)
	
	/// display back
	let displayBack = createPopupBack(width: changingStatsWidth, height: changingStatsHeight, x: changingStatsX, y: changingStatsY)
	node.addChild(displayBack)
	
	// confirm
	let confirmButton = createPopupButtonLarge(name: changingStatsButtonOk, text: "OKAY", x: changingStatsButtonX, y: changingStatsButtonY)
	node.addChild(confirmButton)
	
	// money
	let money = createChangingMoney()
	node.addChild(money)
	
	// traits
	let traitNode = createChangingTraits()
	node.addChild(traitNode)
	
	// done
	return node
}
func createChangingMoney() -> SKLabelNode {
	let node = SKLabelNode(fontNamed: fontText)
	
	node.name = changingStatsMoneyNodeName
	node.text = "Money: " + String(moneyTotal)
	
	scaleAndPositionLabelNode(node: node, x: changingStatsMoneyX, y: changingStatsMoneyY, width: changingStatsMoneyWidth, height: changingStatsMoneyHeight)
	
	return node
}
func createChangingTraits() -> SKNode {
	let node = SKNode()
	node.name = "changingStats"
	
	// TODO: diff for each level
	var runningY = changingStatsTraitFirstY
	for trait in traitsDataOrigin {
		
		let b = createChagingStatsBarBack(name: trait.name + "_changingStatsTraitBack", x: changingStatsTraitX, y: runningY)
		node.addChild(b)
		
		let newLevelWidth = calcBarWidth(maxWidth: changingStatsTraitWidth, currentValue: trait.value, maxValue: trait.max)
		let l = createChangingStatsBarLevel(name: trait.name + changingStatsTraitSuffix, xLeft: changingStatsTraitXLeft, y: runningY, width: newLevelWidth)
		node.addChild(l)
		
		runningY -= (changingStatsPadding + changingStatsTraitHeight)
	}
	
	return node
}

func createChagingStatsBarBack(name name: String, x: CGFloat, y: CGFloat) -> SKNode {
	return createRect(name: name, widthExact: changingStatsTraitWidth, heightExact: changingStatsTraitHeight, xExact: x, yExact: y, fillColor:  colorChangingStatsTraitBarBack)
}
func createChangingStatsBarLevel(name name: String, xLeft: CGFloat, y: CGFloat, width: CGFloat) -> SKNode {
	return createRect(name: name, widthExact: width, heightExact: changingStatsTraitHeight, xExact: xLeft + (width/2), yExact: y, fillColor:  colorChangingStatsTraitBarLevel)
}











//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
////                                                                      ////
////              Helper Functions - CREATE MAIN MENU OVERLAY             ////
////                                                                      ////
//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
func createInventoryButton() -> SKNode {
	let node = SKNode()
	node.name = menuInventoryButtonName
	
	// back
	node.addChild(
		createRect(
			name: menuInventoryButtonName,
			widthExact: menuInventoryButtonWidth, heightExact: menuInventoryButtonHeight,
			xExact: menuInventoryButtonX, yExact: menuInventoryButtonY, fillColor: colorInventoryButtonFill)
	)
	
	// label
	node.addChild(
		createLabelFillRect(name: menuInventoryButtonName, text: "Inventory", width: menuInventoryButtonLabelWidth, height: menuInventoryButtonLabelHeight, x: menuInventoryButtonX, y: menuInventoryButtonY, textColor: colorInventoryButtonText)
	)
	
	return node
}
// back bar for upper menu button 
func createStatsBar() -> SKNode {
	let node = SKNode()
	node.name = "statsNode"
	
	let back = createRect(name: "statsBack", widthExact: statusBarBackWidth, heightExact: statusBarBackHeight, xExact: statusBarBackX, yExact: statusBarBackY, fillColor: colorStatusBarBack)
	node.addChild(back)
	
	// money
	let moneyNode = createMoneyStats()
	node.addChild(moneyNode)
	
	// stats
	let traitsNode = createTraitsStats()
	node.addChild(traitsNode)

	return node
}
func createMoneyStats() -> SKLabelNode {
    let node = SKLabelNode(fontNamed: fontText)
    node.name = statusMoneyNodeName
	node.color = colorStatusMoneyText
	
	let am = "Money: " + String(moneyTotal)
	node.text = am
	
	scaleAndPositionLabelNode(node: node, x: statusMoneyXLeft, y: statusMoneyY, width: width, height: statusMoneyHeight)
	node.position = CGPoint(x: statusMoneyXLeft, y: statusMoneyY)
	
	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
	
	return node
    
    // dollar sign
    /*let moneyLabelBack = createRect(name: "moneyStatus", widthExact: statusMoneyLabelWidth, heightExact: statusMoneyLabelHeight, xExact: statusMoneyLabelX, yExact: statusMoneyLabelY, fillColor: colorStatusMoneyLabelFill)
    node.addChild(moneyLabelBack)
    let moneyLabel = createLabelTextCentered(name: "moneyStatus", text: "$", x: statusMoneyLabelX, y: statusMoneyLabelY, textColor: colorStatusMoneyLabelText)
    node.addChild(moneyLabel)
    
    // bar back
    let moneyBarBack = createStatusBarBack(name: "moneyStatus", x: statusMoneyBarX, y: statusMoneyBarY)
    node.addChild(moneyBarBack)
    
    // bar level
    let currentMoneyBarLevelWidth = calcBarWidth(width: statusMoneyLevelWidthMax, total: moneyTotal, max: moneyDataOrigin[currentLevel]["max"]! as Int)
    print("currentMoneyBarLevelWidth: " + String(currentMoneyBarLevelWidth))
    let moneyBarLevel = createStatusBarLevel(
        name: statusMoneyLevelName, 
        x: statusMoneyLevelXLeft + (currentMoneyBarLevelWidth/2), 
        y: statusMoneyLevelY, 
        width: currentMoneyBarLevelWidth
    )
    node.addChild(moneyBarLevel)*/
}

func createTraitsStats() -> SKNode {
    let node = SKNode()
    node.name = statusTraitsNodeName
    
    var runningXLeft = statusTraitLeftX
    var index = 0
    for trait in traitsDataOrigin {
        
        // bar back
        let traitBarBack = createStatusBarBack(name: "traitStatus", x: runningXLeft + (statusTraitBarWidth/2), y: statusTraitY)
        node.addChild(traitBarBack)
        
        // bar level
        let currentTraitWidth = calcBarWidth(maxWidth: statusTraitLevelWidthMax, currentValue: trait.value, maxValue: trait.max)
        let traitBarLevel = createStatusBarLevel(name: (trait.name) + statusTraitNameSuffix, xLeft: runningXLeft, y: statusTraitY, width: currentTraitWidth)
        node.addChild(traitBarLevel)
        
        // increase running X
        runningXLeft -= (statusTraitBarWidth + statusPadding)
        index += 1
    }
    
    return node
}

func createStatusBarBack(name name: String, x: CGFloat, y: CGFloat) -> SKNode {
    return createRect(name: name, widthExact: statusTraitBarWidth, heightExact: statusTraitBarHeight, xExact: x, yExact: y, fillColor:  colorStatusTraitBarBack)
}
func createStatusBarLevel(name name: String, xLeft: CGFloat, y: CGFloat, width: CGFloat) -> SKNode {
    return createRect(name: name, widthExact: width, heightExact: statusTraitBarHeight, xExact: xLeft + (width/2), yExact: y, fillColor:  colorStatusTraitBarLevel)
}

func createNextSceneButton() -> SKNode {
    let node = SKNode()
    node.name = "nextScene"
	
	// back
	node.addChild(
		createRect(name: nextSceneButtonName, widthExact: nextSceneButtonWidth, heightExact: nextSceneButtonHeight, xExact: nextSceneButtonX, yExact: nextSceneButtonY, fillColor: colorNextSceneFill)
	)
	
	// text
	node.addChild(
		createLabelFillRect(name: nextSceneButtonName, text: "Next Level >>", width: nextSceneButtonTextWidth, height: nextSceneButtonTextHeight, x: nextSceneButtonX, y: nextSceneButtonY, textColor: colorNextSceneText)
	)
    
    return node
}







//// ///////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////// ////
////                                                                   ////
////              Helper Functions - CREATE INVENTORY MENU             ////
////                                                                   ////
//// ///////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////// ////

var inventoryDisplayContainerWidthRunning:CGFloat = 0

func createInventoryMenu() -> SKNode {
    
    // create a wrapper
    let node = SKNode()
    node.name = "inventoryWrapper"
    
    
    //////////////////////////////
    //      inventory back      //
    //////////////////////////////
    node.addChild(
        createRect(name: "inventoryBack", widthExact: inventoryBackWidth, heightExact: inventoryBackHeight, xExact: inventoryBackX, yExact: inventoryBackY, fillColor: colorGreyLight)
    )
    
    
    //////////////////////////
    //      header menu     //
    //////////////////////////
    
    // exit button
    let backBtn = createPopupButtonExit(name: inventoryExitButtonName, x: inventoryButtonExitX, y: inventoryButtonExitY)
    node.addChild(backBtn)
    
    // title
    let title = createLabelTitleLeftJustified(name: "inventoryTitle", text: "Inventory", x: inventoryTitleXLeft, y: inventoryTitleY, textColor: colorInventoryTitle )
    node.addChild(title)
    
    // TODO: coins 
    
    // TODO: stats
    
    
    
    ////////////////////////
    //      tabs menu     //
    ////////////////////////
    
	// tabs
    // TODO: remove this and implement multiple tabs, this is code for one single tab
    let btn = createSimpleButtonCentered(name: inventoryTabNameAll, text: "All", x: inventoryTabMenuX, y: inventoryTabMenuY, widthExact: inventoryTabWidth, heightExact: inventoryTabHeight, textColor: colorInventoryTabText, fillColor: colorInventoryTabBack)
    node.addChild(btn)
    
    
    
    ////////////////////////////////
    //      scrolling display     //
    ////////////////////////////////
    let invDisplay = SKNode();
    invDisplay.name = "invDisplay"
    
    var runningX = inventoryPadding + (inventoryCardWidth/2)
    
    let invDisplayContainer = createRect(name: "invDisplayContainer", widthExact: inventoryDisplayContainerWidth, heightExact: inventoryDisplayContainerHeight, xExact: widthMid, yExact: inventoryDisplayContainerY, fillColor: colorInventoryDisplayContainerBack)
    invDisplay.addChild(invDisplayContainer)
    
    inventoryDisplayContainerWidthRunning = 0
    
    // loop through all inventory items
    //print("---------- Inventory Items (SKHelper) ----------")
    //print(inventoryItems)
    for level in levelData {
        for item in level.items {
            
            // check if want to display item (owns is more than 0)
            if(item.owns > 0) {
                //print(item)
                // item card
                let itemCard = SKNode()
                let n = item.name + inventoryCardName
                itemCard.name = n
                
                // item back
                let itemBack = createRect(name: n, widthExact: inventoryCardWidth, heightExact: inventoryCardHeight, xExact: runningX, yExact: inventoryCardY, fillColor: colorInventoryCardBack)
                itemCard.addChild(itemBack)
                
                // image of item
				let imgNode = createSpriteBase(
					name: item.name + "_img", 
					size: CGSize(width: inventoryCardImageWidth, height: inventoryCardImageHeight), 
					position: CGPointMake(runningX, inventoryCardImageY), 
					imageName: item.resourceName)
				node.addChild(imgNode)
                
                // title
                let title = createLabelFillRect(name: n, text: item.detailName, width: inventoryCardTitleWidth, height: inventoryCardTitleHeight, x: runningX, y: inventoryCardTitleY, textColor: colorInventoryCardTitle)
                itemCard.addChild(title)
                
                // TODO: description
                
                // TODO: more info btn
                
                // TODO: number of owns
				let owns = createLabelFillRect(name: n, text: "Own: " + String(item.owns), width: inventoryCardOwnsWidth, height: inventoryCardOwnsHeight, x: runningX, y: inventoryCardOwnsY, textColor: colorInventoryCardTitle)
				itemCard.addChild(owns)
                
                // finish
                invDisplay.addChild(itemCard)
                
                // incrament X
                runningX += inventoryCardWidth + inventoryPadding
            }
        }
    }
    inventoryDisplayContainerWidthRunning = runningX + inventoryCardWidth + inventoryPadding
    
    // done
    node.addChild(invDisplay)
    
    
    ///////////////////
    //      done     //
    ///////////////////
    return node
    
}

func createInventoryItemDetailPopup(itemSelected itemSelected: Item) -> SKNode {
    let node = SKNode()
    
    let mute = createMuteOverlay()
    node.addChild(mute)
    
    let dialogue = createPopupBack(width: inventoryItemDetailWidth, height: inventoryItemDetailHeight, x: inventoryItemDetailX, y: inventoryItemDetailY)
    node.addChild(dialogue)
    
    let exitBtn = createPopupButtonExit(name: inventoryItemDetailExitButtonName, x: inventoryItemDetailExitButtonX, y: inventoryItemDetailExitButtonY)
    node.addChild(exitBtn)
	
	
	
	// item image
	let imgNode = createSpriteBase(
		name: itemSelected.name + "_img", 
		size: CGSize(width: itemDetailImageWidth, 
			height: itemDetailImageHeight), 
		position: CGPointMake(itemDetailImageX, itemDetailImageY), 
		imageName: itemSelected.resourceName)
	node.addChild(imgNode)
	
	// item name
	let title = createItemDetailTitle(name: itemSelected.name + "_name", text: itemSelected.detailName)
	node.addChild(title)
	
	// item desc
	let desc = createItemDetailDescription(name: itemSelected.name + "_desc", text: itemSelected.detailDescription)
	node.addChild(desc)
	
	// item cost
	let cost = createItemDetailCost(name: itemSelected.name + "_cost", cost: itemSelected.detailCost)
	node.addChild(cost)
	
	// TODO: item stats
    
	
	
    return node
}






//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - CALCULATIONS             ////
////                                                          ////
//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
func calcXForFarRight(itemWidth: CGFloat) -> CGFloat {
    return width - itemWidth
}

func centerTextLabelInRect(label label: SKLabelNode, rectX: CGFloat, rectY: CGFloat, rectWidth: CGFloat, rectHeight: CGFloat) {
    let labelWidth = label.frame.width
    let labelHeight = label.frame.height
    label.position.x = rectX + ((rectWidth-labelWidth) / 2)
    label.position.y = rectY + (rectHeight/2) + (labelHeight/2)
}

func calcBarWidth(maxWidth maxWidth: CGFloat, currentValue: CGFloat, maxValue: CGFloat) -> CGFloat {
	let calculatedWidth = maxWidth * (currentValue / maxValue)
	if calculatedWidth < 0 {
		return 0
	} else if calculatedWidth > maxWidth {
		return maxWidth
	} else {
		return calculatedWidth
	}
}

func scaleAndPositionLabelNode(node node: SKLabelNode, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
	
	node.position = CGPoint(x: x, y: y)
	
	node.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
	node.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
	
	
	// Determine the font scaling factor that should let the label text fit in the given rectangle.
	let scalingFactor = min(width / node.frame.width, height / node.frame.height)
	
	// Change the fontSize.
	node.fontSize *= scalingFactor
}



func printTraits() {
	for trait in traitsDataOrigin {
		print(trait.name + " value: " + String(trait.value) + " max: " + String(trait.max))
	}
	//print(traitsDataOrigin)
}