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
////              Helper Functions - CREATE SHAPE             ////
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




//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - CREATE LABEL             ////
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
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 100, textColor: textColor, fontName: "MarkerFelt-Wide")
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
    return sknode;
}

// Base Text (top-left justified) (font size = 50) (fontColor = black) (fontName = "MarkerFelt-Wide")
func createLabelTextLeftJustified(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 50, textColor: textColor, fontName: "MarkerFelt-Wide")
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Top
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
    return sknode;
}

// Base Text (top-left justified) (font size = 50) (fontColor = black) (fontName = "MarkerFelt-Wide")
func createLabelTextCentered(name name: String, text: String, x: CGFloat, y: CGFloat, textColor: UIColor) -> SKLabelNode {
    let sknode = createLabelBase(name: name, text: text, position: CGPoint(x:x, y:y), textSize: 50, textColor: textColor, fontName: "MarkerFelt-Wide")
    sknode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
    sknode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
    return sknode;
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





//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
////                                                           ////
////              Helper Functions - CREATE BUTTON             ////
////                                                           ////
//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
func createSimpleButtonCentered(name name: String, text: String, x: CGFloat, y: CGFloat, widthExact: CGFloat, heightExact: CGFloat, textColor: UIColor, fillColor: UIColor) -> SKNode {
    
    let btn = SKNode()
    btn.name = name
    
    let label = createLabelTextCentered(name: name, text: text, x: x, y: y, textColor: textColor)
    btn.addChild(label)
    
    let back = createRect(name: name, widthExact: widthExact, heightExact: heightExact, xExact: x, yExact: y, fillColor: fillColor)
    btn.addChild(back)
    
    return btn
}

func createSimpleButtonBottomLeftOrigin(name name: String, text: String, x: CGFloat, y: CGFloat, widthExact: CGFloat, heightExact: CGFloat, textColor: UIColor, fillColor: UIColor) -> SKNode {
    return createSimpleButtonCentered(name: name, text: text, x: x + (widthExact/2), y: y + (heightExact/2), widthExact: widthExact, heightExact: heightExact, textColor: textColor, fillColor: fillColor)
}






//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
////                                                           ////
////              Helper Functions - CREATE ITEM               ////
////                                                           ////
//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
func createTestItem(name name: String, text: String, x: CGFloat, y: CGFloat) -> SKNode {
    let buttonWidth: CGFloat = 200
    let buttonHeight: CGFloat = 200
    
    let node = SKNode()
    node.name = name + "ItemNode"
    
    let skNodeShape = createRect(name: name, widthExact: buttonWidth, heightExact: buttonHeight, xExact: x, yExact: y, fillColor: UIColor.redColor())
    node.addChild(skNodeShape)
    
    let skNodeLabel = createLabelTextCentered(name: name, text: text, x: x, y: y, textColor: UIColor.whiteColor())
    node.addChild(skNodeLabel)
    
    return node
}







//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
////                                                                      ////
////              Helper Functions - CREATE POP UPS (GENERAL)             ////
////                                                                      ////
//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////

func createMuteOverlay() -> SKNode {
    return createRect(name: "popupMuteOverlay", widthExact: width, heightExact: height, xExact: widthMid, yExact: heightMid, fillColor: colorPopupMute)
}

func createPopupWarningBack() -> SKNode {
    return createRect(name: "popupDisplayBackWarning", widthExact: popupWarningWidth, heightExact: popupWarningHeight, xExact: widthMid, yExact: heightMid, fillColor: colorPopupBackWarning)
}

func createPopupBack() -> SKNode {
    return createRect(name: "popupDisplayBack", widthExact: popupWidth, heightExact: popupHeight, xExact: widthMid, yExact: heightMid, fillColor: colorPopupBack)
}

// (centered)
func createPopupButtonGo(name name: String, text: String, x: CGFloat, y: CGFloat) -> SKNode {
    
    return createSimpleButtonCentered(name: name, text: text, x: x, y: y, widthExact: popupButtonGoWidth, heightExact: popupButtonGoHeight, textColor: colorPopupButtonGoText, fillColor: colorPopupButtonGoFill)
}

func createPopupButtonSmall(name name: String, text: String, bright: Bool, onRight: Bool) -> SKNode {
    let buttonX = (onRight) ? popupButtonRightX : popupButtonLeftX
    let buttonBackColor = (bright) ? colorPopupButtonSmallFillBright : colorPopupButtonSmallFillMuted
    let buttonTextColor = (bright) ? colorPopupButtonSmallTextBright : colorPopupButtonSmallTextMuted
    
    return createSimpleButtonBottomLeftOrigin(name: name, text: text, x: buttonX, y: popupButtonY, widthExact: popupButtonWidth, heightExact: popupButtonHeight, textColor: buttonTextColor, fillColor: buttonBackColor)
}

func createPopupButtonExit(name name: String, x: CGFloat, y: CGFloat) -> SKNode {
    return createSimpleButtonBottomLeftOrigin(name: name, text: "X", x: x, y: y, widthExact: exitButtonWidth, heightExact: exitButtonHeight, textColor: colorInventoryButtonExitText, fillColor: colorInventoryButtonExitFill)
}




//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
////                                                                       ////
////              Helper Functions - CREATE POP UPS (SPECIFIC)             ////
////                                                                       ////
//// ///////////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////////// ////
func createItemDetail() -> SKNode {
	let node = SKNode()
	node.name = "itemDetail"
	node.zPosition = zPositionItemDetail
	
	// mute overlay
	let muteOverlay = createMuteOverlay()
	node.addChild(muteOverlay)
	
	// display back
	let displayBack = createPopupBack()
	node.addChild(displayBack)
	
	// cancel
	let cancelButton = createPopupButtonSmall(name: popupButtonCancel, text: "Cancel", bright: false, onRight: false)
	node.addChild(cancelButton)
	
	// confirm
	let confirmButton = createPopupButtonSmall(name: popupButtonConfirm, text: "Confirm", bright: true, onRight: true)
	node.addChild(confirmButton)
	
	// item image TODO
	
	// item name TODO
	
	// item desc TODO
	
	return node
}

func createErrorMoney() -> SKNode {
    let node = SKNode()
    node.name = "moneyWarning"
    node.zPosition = zPositionItemDetailPopup
    
    // mute
    let mute = createMuteOverlay()
    node.addChild(mute)
    
    /// display back
    let displayBack = createPopupWarningBack()
    node.addChild(displayBack)
    
    // confirm
    let confirmButton = createPopupButtonGo(name: popupButtonBuyMessageOk, text: "OKAY", x: widthMid, y: heightMid)
    node.addChild(confirmButton)
    
    // item warning message TODO
    
    // done
    return node
}

func createBuyMessage() -> SKNode {
    let node = SKNode()
    node.name = "buyMessage"
    node.zPosition = zPositionItemDetailPopup
    
    // mute
    let mute = createMuteOverlay()
    node.addChild(mute)
    
    /// display back
    let displayBack = createPopupWarningBack()
    node.addChild(displayBack)
    
    // item buy confirmation message TODO
    
    // confirm
    let confirmButton = createPopupButtonGo(name: popupButtonBuyMessageOk, text: "OKAY", x: widthMid, y: popupButtonWarningY)
    node.addChild(confirmButton)
    
    // done
    return node
}

func createChangeStats() -> SKNode {
    let node = SKNode()
    node.name = "changingStats"
	node.zPosition = zPositionItemDetailPopup + 1
	
	// mute
    let mute = createMuteOverlay()
    node.addChild(mute)
    
    /// display back
    let displayBack = createPopupWarningBack()
    node.addChild(displayBack)
    
    // confirm
    let confirmButton = createPopupButtonGo(name: popupButtonStatsChangingOk, text: "OKAY", x: popupButtonWarningX, y: popupButtonWarningY)
    node.addChild(confirmButton)
	
	// changing stats TODO
    
    // done
    return node
}







//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
////                                                                      ////
////              Helper Functions - CREATE MAIN MENU OVERLAY             ////
////                                                                      ////
//// //////////////////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////////////////// ////
func createInventoryButton() -> SKNode {
    return createRect(
        name: menuInventoryButtonName,
        widthExact: menuInventoryButtonWidth, heightExact: menuInventoryButtonHeight,
        xExact: menuInventoryButtonX, yExact: menuInventoryButtonY)
}

func createMoneyStats() -> SKNode {
    let node = SKNode()
    node.name = statusMoneyNodeName
    
    // dollar sign
    let moneyLabelBack = createRect(name: "moneyStatus", widthExact: statusLabelWidth, heightExact: statusLabelHeight, xExact: statusMoneyLabelX, yExact: statusLabelY, fillColor: colorStatusMoneyLabelFill)
    node.addChild(moneyLabelBack)
    let moneyLabel = createLabelTextCentered(name: "moneyStatus", text: "$", x: statusMoneyLabelX, y: statusLabelY, textColor: colorStatusMoneyLabelText)
    node.addChild(moneyLabel)
    
    // bar back
    let moneyBarBack = createStatusBarBack(name: "moneyStatus", x: statusMoneyBarX, y: statusBarY)
    node.addChild(moneyBarBack)
    
    // bar level
    let moneyBarLevelWidth = calcBarWidth(width: statusBarWidth, total: moneyTotal, max: moneyDataOrigin[currentLevel]["max"]! as Int)
    let moneyBarLevel = createStatusBarLevel(name: statusMoneyBarLevelName, x: statusMoneyBarLevelXLeft + (moneyBarLevelWidth/2), y: statusBarY, width: moneyBarLevelWidth)
    node.addChild(moneyBarLevel)
    
    return node
}

func createTraitsStats() -> SKNode {
    let node = SKNode()
    node.name = statusTraitsNodeName
    
    var runningXLeft = statusMoneyBarX + (statusBarWidth/2) + (menuPadding)
    var index = 0
    for trait in traitsDataOrigin {
        
        // bar back
        let traitBarBack = createStatusBarBack(name: "traitStatus", x: runningXLeft + (statusBarWidth/2), y: statusBarY)
        node.addChild(traitBarBack)
        
        // bar level
        let traitWidth = calcBarWidth(width: statusBarLevelMaxWidth, total: trait["value"] as! Int, max: trait["max"] as! Int)
        let traitBarLevel = createStatusBarLevel(name: trait["name"] as! String, x: runningXLeft + (statusBarPadding/2) + (traitWidth/2), y: statusBarY, width: traitWidth)
        node.addChild(traitBarLevel)
        
        // increase running X
        runningXLeft += (statusBarWidth + (menuPadding))
        index += 1
    }
    
    return node
}

func createStatusBarBack(name name: String, x: CGFloat, y: CGFloat) -> SKNode {
    return createRect(name: name, widthExact: statusBarWidth, heightExact: statusBarHeight, xExact: x, yExact: y, fillColor:  colorStatusMoneyBarBack)
}
func createStatusBarLevel(name name: String, x: CGFloat, y: CGFloat, width: CGFloat) -> SKNode {
    return createRect(name: name, widthExact: width, heightExact: statusBarLevelHeight, xExact: x, yExact: y, fillColor:  colorStatusMoneyBarLevel)
}

func createNextSceneButton() -> SKNode {
    let node = SKNode()
    node.name = "nextScene"
    
    let btn = createSimpleButtonCentered(name: nextSceneButtonName, text: "Next Level", x: nextSceneButtonX, y: nextSceneButtonY, widthExact: nextSceneButtonWidth, heightExact: nextSceneButtonHeight, textColor: colorNextSceneText, fillColor: colorNextSceneFill)
    node.addChild(btn)
    
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
    let inv = SKNode()
    inv.name = "inventoryWrapper"
    
    var runningX: CGFloat = 0
    
    
    //////////////////////////////
    //      inventory back      //
    //////////////////////////////
    inv.addChild(
        createRect(name: "inventoryBack", widthExact: width, heightExact: height, xExact: widthMid, yExact: heightMid, fillColor: colorGreyLight)
    )
    
    
    //////////////////////////
    //      header menu     //
    //////////////////////////
    let invHeaderMenu = SKNode();
    invHeaderMenu.name = "inventoryMenuHeader"
    
    // exit button
    let backBtn = createPopupButtonExit(name: inventoryExitButtonName, x: inventoryButtonExitX, y: inventoryButtonExitY)
    invHeaderMenu.addChild(backBtn)
    
    runningX = inventoryPadding
    
    // title
    let title = createLabelTitleLeftJustified(name: "inventoryTitle", text: "Inventory", x: runningX, y: (height-inventoryPadding), textColor: colorInventoryTitle )
    invHeaderMenu.addChild(title)
    
    // coins TODO
    
    // stats TODO
    
    // done
    inv.addChild(invHeaderMenu)
    
    
    ////////////////////////
    //      tabs menu     //
    ////////////////////////
    let invTabsMenu = SKNode();
    invTabsMenu.name = "invTabsMenu"
    
    runningX = inventoryPadding
    
    // TODO remove this and implement multiple tabs, this is code for one single tab
    let btn = createSimpleButtonBottomLeftOrigin(name: inventoryTabNameAll, text: "All", x: runningX, y: inventoryTabMenuY, widthExact: inventoryTabWidth, heightExact: inventoryTabHeight, textColor: colorInventoryTabText, fillColor: colorInventoryTabBack)
    invTabsMenu.addChild(btn)
    
    // done
    inv.addChild(invTabsMenu)
    
    
    ////////////////////////////////
    //      scrolling display     //
    ////////////////////////////////
    let invDisplay = SKNode();
    invDisplay.name = "invDisplay"
    
    runningX = inventoryPadding + (inventoryCardWidth/2)
    
    let invDisplayContainer = createRect(name: "invDisplayContainer", widthExact: inventoryDisplayContainerWidth, heightExact: inventoryDisplayContainerHeight, xExact: widthMid, yExact: inventoryDisplayContainerY, fillColor: colorInventoryDisplayContainerBack)
    invDisplay.addChild(invDisplayContainer)
    
    inventoryDisplayContainerWidthRunning = 0
    
    // loop through all inventory items
    //print("---------- Inventory Items (SKHelper) ----------")
    //print(inventoryItems)
    for itemCategory in allItems {
        for item in itemCategory {
            
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
                
                // image of item TODO
                
                // title
                let title = createLabelTitleCentered(name: n, text: item.detailName, x: runningX, y: inventoryCardTop - 50, textColor: colorInventoryCardTitle)
                itemCard.addChild(title)
                
                // description TODO
                
                // more info btn TODO
                
                // number of owns TODO
                
                // finish
                invDisplay.addChild(itemCard)
                
                // incrament X
                runningX += inventoryCardWidth + inventoryPadding
            }
        }
    }
    inventoryDisplayContainerWidthRunning = runningX + inventoryCardWidth + inventoryPadding
    
    // done
    inv.addChild(invDisplay)
    
    
    ///////////////////
    //      done     //
    ///////////////////
    return inv
    
}

func createInventoryItemDetailPopup() -> SKNode {
    let popup = SKNode()
    
    let mute = createMuteOverlay()
    popup.addChild(mute)
    
    let dialogue = createPopupBack()
    popup.addChild(dialogue)
    
    let exitBtn = createPopupButtonExit(name: inventoryPopupExitButtonName, x: popupRightX - popupPadding - exitButtonWidth, y: popupTopY - (popupPadding*2) - exitButtonHeight)
    popup.addChild(exitBtn)
    
    return popup
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

func calcBarWidth(width width: CGFloat, total: Int, max: Int) -> CGFloat {
    return min(width * (CGFloat(total) / CGFloat(max)), CGFloat(max))
}