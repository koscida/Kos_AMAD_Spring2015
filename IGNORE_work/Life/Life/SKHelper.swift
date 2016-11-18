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



//// //////////////////////////////////////////// ////
//// //////////////////////////////////////////// ////
////                                              ////
////              Helper Data - COLOR             ////
////                                              ////
//// //////////////////////////////////////////// ////
//// //////////////////////////////////////////// ////

// https://color.adobe.com/Flat-rainbow-color-theme-3012612/edit/?copy=true&base=2&rule=Custom&selected=0&name=Copy%20of%20Flat%20rainbow&mode=rgb&rgbvalues=0.945098,0.352941,0.352941,0.941176,0.768627,0.0980392,0.305882,0.729412,0.435294,0.176471,0.584314,0.74902,0.584314,0.356863,0.647059&swatchOrder=0,1,2,3,4
let colorPink = UIColor(red: 241/255, green: 90/255, blue: 90/255, alpha: 1.0)
let colorYellow = UIColor(red: 240/255, green: 196/255, blue: 25/255, alpha: 1.0)
let colorGreen = UIColor(red: 78/255, green: 186/255, blue: 111/255, alpha: 1.0)
let colorBlue = UIColor(red: 45/255, green: 149/255, blue: 191/255, alpha: 1.0)
let colorPurple = UIColor(red: 149/255, green: 91/255, blue: 165/255, alpha: 1.0)

let colorGreyLight = UIColor(red: 225/255, green: 215/255, blue: 215/255, alpha: 1.0)
let colorGreyMedium = UIColor(red: 175/255, green: 165/255, blue: 165/255, alpha: 1.0)
let colorGreyDarkRed: CGFloat = 125/255, colorGreyDarkGreen: CGFloat = 115/255, colorGreyDarkBlue: CGFloat = 115/255
let colorGreyDark = UIColor(red: colorGreyDarkRed, green: colorGreyDarkGreen, blue: colorGreyDarkBlue, alpha: 1.0)


let colorPopupMute = UIColor(red: (colorGreyDarkRed), green: (colorGreyDarkGreen), blue: (colorGreyDarkBlue), alpha: 0.6)
let colorPopupBack = colorGreyLight
let colorPopupGoButtonText = UIColor.whiteColor()

let colorPopupSmallButtonBackBright = colorPink
let colorPopupSmallButtonTextBright = UIColor.whiteColor()
let colorPopupSmallButtonBackMuted = colorGreyMedium
let colorPopupSmallButtonTextMuted = UIColor.blackColor()

let colorPopupGoButtonBack = colorPink


let colorInventoryBackButtonFill = colorGreyMedium
let colorInventoryBackButtonText = UIColor.blackColor()

let colorInventoryBackButton = colorGreyMedium
let colorInventoryTitle = UIColor.blackColor()

let colorInventoryTabBack = colorGreyMedium
let colorInventoryTabText = UIColor.blackColor()

let colorInventoryDisplayContainerBack = colorGreyMedium
let colorInventoryCardBack = colorGreyDark
let colorInventoryCardTitle = UIColor.blackColor()


let colorStartText = UIColor.whiteColor()








//// ///////////////////////////////////////////// ////
//// ///////////////////////////////////////////// ////
////                                               ////
////              Helper Data - VALUES             ////
////                                               ////
//// ///////////////////////////////////////////// ////
//// ///////////////////////////////////////////// ////

let sceneNameBase = "SceneBase"
let sceneNameStart = "SceneStart"
let sceneNameInfancy = "SceneInfancy"
let sceneNameChildhood = "SceneChildhood"
let sceneNameAdolescence = "SceneAdolescence"
let sceneNameTeens = "SceneTeens"
let sceneNameCollege = "SceneCollege"
let sceneNameAdulthood = "SceneAdulthood"
let sceneNameEnd = "SceneEnd"
let sceneNames = [sceneNameStart, sceneNameInfancy, sceneNameChildhood, sceneNameAdolescence, sceneNameTeens, sceneNameCollege, sceneNameAdulthood, sceneNameEnd]

let nameContentNode = "ContentNode"
let nameAnimationsNode = "AnimationsNode"
let nameMenuOverlayNode = "MenuOverlayNode"
let namePopupNode = "PopupNode"
let nameInventoryNode = "InventoryNode"


let zPositionContent: CGFloat = 1
let zPositionAnimations: CGFloat = 10
let zPositionMenuOverlay: CGFloat = 20
let zPositionPopup: CGFloat = 30
let zPositionInventory: CGFloat = 40


let popupWidthFraction: CGFloat = 0.8
let popupHeightFraction: CGFloat = 0.8
let popupWidth: CGFloat = popupWidthFraction * SceneBase.frameWidth
let popupHeight: CGFloat = popupHeightFraction * SceneBase.frameHeight
let popupX: CGFloat = SceneBase.frameCenterWidth - (popupWidth / 2)
let popupY: CGFloat = SceneBase.frameCenterHeight - (popupHeight / 2)

let popupPadding: CGFloat = 20

let popupButtonWidth: CGFloat = 300
let popupButtonHeight: CGFloat = 150
let popupButtonLeftX: CGFloat = popupX + popupPadding
let popupButonRightX: CGFloat = popupX + popupWidth - popupPadding - popupButtonWidth
let popupButtonY: CGFloat = popupY + popupPadding

let popupButtonCancel = "cancelBtn"
let popupButtonConfirm = "confirmBtn"

let popupGoButtonWidth: CGFloat = 500
let popupGoButtonHeight: CGFloat = 200


let menuPadding: CGFloat = 20

let menuInventoryButtonWidth: CGFloat = 200
let menuInventoryButtonHeight: CGFloat = 200
let menuInventoryButtonX: CGFloat = SceneBase.frameWidth - menuInventoryButtonWidth - menuPadding
let menuInventoryButtonY: CGFloat = 0 + menuPadding
let menuInventoryButtonName = "inventoryBtn"


let inventoryPadding: CGFloat = 40

let inventoryBackButtonName = "inventoryBackBtn"
let inventoryBackButtonWidth: CGFloat = 100
let inventoryBackButtonHeight: CGFloat = 100
let inventoryHeaderMenuHeight = inventoryPadding + inventoryBackButtonHeight + inventoryPadding

let inventoryTabHeight: CGFloat = 100
let inventoryTabWidth: CGFloat = 300
let inventoryTabMenuHeight = inventoryPadding + inventoryTabHeight
let inventoryTabMenuY = SceneBase.frameHeight - inventoryHeaderMenuHeight - inventoryTabMenuHeight
let inventoryTabNameSuffix = "TabBtn"
let inventoryTabMasName = "Other"
let inventoryTabNameAll = "tabAllBtn"

let inventoryDisplayContainerWidth = SceneBase.frameWidth
let inventoryDisplayContainerHeight = SceneBase.frameHeight - (inventoryHeaderMenuHeight + inventoryTabMenuHeight)

let inventoryCardHeight = inventoryDisplayContainerHeight * 0.9
let inventoryCardWidth = inventoryCardHeight * 0.6
let inventoryCardTop = inventoryDisplayContainerHeight * 0.95
let inventoryCardY = inventoryCardTop - inventoryCardHeight







//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - CREATE SHAPE             ////
////                                                          ////
//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////

// Base (fraction width and height) (exact x and y)
func createRect(name name: String, widthFraction: CGFloat, heightFraction: CGFloat, xExact: CGFloat, yExact: CGFloat, fillColor:  UIColor) -> SKShapeNode {
    return createRectBase(name: name, rect: CGRect(x: xExact, y: yExact, width: widthFraction*SceneBase.sceneSize.width, height: heightFraction*SceneBase.sceneSize.height), fillColor: fillColor)
}

// Base (fraction width and height) (exact x and y) (color = white)
func createRect(name name: String, widthFraction: CGFloat, heightFraction: CGFloat, xExact: CGFloat, yExact: CGFloat) -> SKShapeNode {
    return createRectBase(name: name, rect: CGRect(x: xExact, y: yExact, width: widthFraction*SceneBase.sceneSize.width, height: heightFraction*SceneBase.sceneSize.height), fillColor: UIColor.whiteColor())
}

// Base (exact width and height) (exact x and y)
func createRect(name name: String, widthExact: CGFloat, heightExact: CGFloat, xExact: CGFloat, yExact: CGFloat, fillColor:  UIColor) -> SKShapeNode {
    return createRectBase(name: name, rect: CGRect(x: xExact, y: yExact, width: widthExact, height: heightExact), fillColor: fillColor)
}

// Base (exact width and height) (exact x and y) (color = white)
func createRect(name name: String, widthExact: CGFloat, heightExact: CGFloat, xExact: CGFloat, yExact: CGFloat) -> SKShapeNode {
    return createRectBase(name: name, rect: CGRect(x: xExact, y: yExact, width: widthExact, height: heightExact), fillColor: UIColor.whiteColor())
}

// Base
func createRectBase(name name: String, rect: CGRect, fillColor:  UIColor) -> SKShapeNode {
    let sknode = SKShapeNode(rect: rect)
    sknode.fillColor = fillColor
    sknode.name = name
    
    return sknode
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
func createSimpleButton(name name: String, text: String, x: CGFloat, y: CGFloat, widthExact: CGFloat, heightExact: CGFloat, textColor: UIColor, fillColor: UIColor) -> SKNode {
    
    let btn = SKNode()
    btn.name = name
    
    let label = createLabelTextCentered(name: name, text: text, x: x + (widthExact/2), y: y + (heightExact/2), textColor: textColor)
    btn.addChild(label)
    
    let back = createRect(name: name, widthExact: widthExact, heightExact: heightExact, xExact: x, yExact: y, fillColor: fillColor)
    btn.addChild(back)
    
    return btn
    
}

/*func createBaseButton(skNodeShape skNodeShape: SKShapeNode, skNodeLabel: SKLabelNode) -> SKNode {
    let skNodeParent = SKNode()
    skNodeParent.name = skNodeShape.name
    
    skNodeParent.addChild(skNodeShape)
    skNodeParent.addChild(skNodeLabel)
    
    return skNodeParent
}*/





//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
////                                                           ////
////              Helper Functions - CREATE ITEM               ////
////                                                           ////
//// ///////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////// ////
func createTestItem(name name: String, text: String, x: CGFloat, y: CGFloat) -> ItemNode {
    let buttonWidth: CGFloat = 200
    let buttonHeight: CGFloat = 200
    
    let skNodeShape = createRect(name: name, widthExact: buttonWidth, heightExact: buttonHeight, xExact: x-(buttonWidth/2), yExact: y-(buttonHeight/2), fillColor: UIColor.redColor())
    
    let skNodeLabel = createLabelTextCentered(name: name, text: text, x: x, y: y, textColor: UIColor.whiteColor())
    
    let skNodeParent = ItemNode()
    skNodeParent.addChild(skNodeShape)
    skNodeParent.addChild(skNodeLabel)
    skNodeParent.name = name + "ItemNode"
    
    return skNodeParent
}






//// ////////////////////////////////////////////////////////// ////
//// ////////////////////////////////////////////////////////// ////
////                                                            ////
////              Helper Functions - CREATE POP UPS             ////
////                                                            ////
//// ////////////////////////////////////////////////////////// ////
//// ////////////////////////////////////////////////////////// ////

func createMuteOverlay() -> SKShapeNode {
    return createRect(name: "popupMuteOverlay", widthExact: SceneBase.frameWidth, heightExact: SceneBase.frameHeight, xExact: 0, yExact: 0, fillColor: colorPopupMute)
}

func createPopupBack() -> SKShapeNode {
    return createRect(name: "popupDisplayBack", widthExact: popupWidth, heightExact: popupHeight, xExact: popupX, yExact: popupY, fillColor: colorPopupBack)
}

// (centered)
func createPopupGoButton(name name: String, text: String, x: CGFloat, y: CGFloat) -> SKNode {
    
    return createSimpleButton(name: name, text: text, x: x + (popupGoButtonWidth/2), y: y + (popupGoButtonHeight/2), widthExact: popupGoButtonWidth, heightExact: popupGoButtonHeight, textColor: colorPopupGoButtonText, fillColor: colorPopupGoButtonBack)
}

func createPopupSmallButton(name name: String, text: String, bright: Bool, onRight: Bool) -> SKNode {
    let buttonX = (onRight) ? popupButonRightX : popupButtonLeftX
    let buttonBackColor = (bright) ? colorPopupSmallButtonBackBright : colorPopupSmallButtonBackMuted
    let buttonTextColor = (bright) ? colorPopupSmallButtonTextBright : colorPopupSmallButtonTextMuted
    
    return createSimpleButton(name: name, text: text, x: buttonX, y: popupButtonY, widthExact: popupButtonWidth, heightExact: popupButtonHeight, textColor: buttonTextColor, fillColor: buttonBackColor)
}






//// ///////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////// ////
////                                                                   ////
////              Helper Functions - CREATE INVENTORY MENU             ////
////                                                                   ////
//// ///////////////////////////////////////////////////////////////// ////
//// ///////////////////////////////////////////////////////////////// ////

func createInventoryBack() -> SKShapeNode {
    return createRect(name: "inventoryMenuBack", widthExact: SceneBase.frameWidth, heightExact: SceneBase.frameHeight, xExact: 0, yExact: 0, fillColor: colorGreyLight)
}



func createInventoryHeaderMenu() -> SKNode {
    let invHeaderMenu = SKNode();
    invHeaderMenu.name = "invHeaderMenu"
    
    var runningX = inventoryPadding
    
    // back button
    let backBtn = createSimpleButton(name: inventoryBackButtonName, text: "X", x: runningX, y: (SceneBase.frameHeight - inventoryBackButtonHeight - inventoryPadding), widthExact: inventoryBackButtonWidth, heightExact: inventoryBackButtonHeight, textColor: colorInventoryBackButtonText, fillColor: colorInventoryBackButtonFill)
    invHeaderMenu.addChild(backBtn)
    
    runningX += inventoryBackButtonWidth + inventoryPadding
    
    // title
    let title = createLabelTitleLeftJustified(name: "inventoryTitle", text: "Inventory", x: runningX, y: (SceneBase.frameHeight-inventoryPadding), textColor: colorInventoryTitle )
    invHeaderMenu.addChild(title)
    
    // coins TODO
    
    
    // stats TODO
    
    // done
    return invHeaderMenu
}

func createInventoryTabsMenu() -> SKNode {
    let invTabsMenu = SKNode();
    invTabsMenu.name = "invTabsMenu"
    
    let runningX = inventoryPadding
    
    
    // TODO remove this and implement multiple tabs, this is code for one single tab
    let btn = createSimpleButton(name: inventoryTabNameAll, text: "All", x: runningX, y: inventoryTabMenuY, widthExact: inventoryTabWidth, heightExact: inventoryTabHeight, textColor: colorInventoryTabText, fillColor: colorInventoryTabBack)
    invTabsMenu.addChild(btn)
    
    
    
    // TODO add tabs, removed for easy
    /*
    // traits
    for trait in femTraits + [inventoryTabMasName] {
        // create label
        let label = createLabelTextCentered(name: trait+inventoryTabNameSuffix, text: trait, x: runningX + (inventoryTabWidth/2), y: inventoryTabMenuY + (inventoryTabHeight/2), textColor: colorInventoryTabText)
        
        // create back
        let back = createRect(name: trait+"TabBtn", widthExact: inventoryTabWidth, heightExact: inventoryTabHeight, xExact: runningX, yExact: inventoryTabMenuY, fillColor: colorInventoryTabBack)
        
        // create button
        let btn = createBaseButton(skNodeShape: back, skNodeLabel: label)
        
        // add to tab menu
        invTabsMenu.addChild(btn)
        
        // incrament runningX
        runningX += inventoryPadding + inventoryTabWidth
    }
    */
    
    
    
    // done
    return invTabsMenu
}

var inventoryDisplayContainerWidthRunning:CGFloat = 0

func createIntentoryDisplay() -> SKNode {
    let invDisplay = SKNode();
    invDisplay.name = "invDisplay"
    
    var runningX = inventoryPadding
    
    
    let invDisplayContainer = createRect(name: "invDisplayContainer", widthExact: inventoryDisplayContainerWidth, heightExact: inventoryDisplayContainerHeight, xExact: 0, yExact: 0, fillColor: colorInventoryDisplayContainerBack)
    invDisplay.addChild(invDisplayContainer)
    
    inventoryDisplayContainerWidthRunning = 0
    
    // loop through all inventory items
    //print("---------- Inventory Items (SKHelper) ----------")
    //print(inventoryItems)
    for item in inventoryItems {
        //print(item)
        // item card
        let itemCard = SKNode()
        let n = item.name+"ItemCard"
        itemCard.name = n
        
        // item back 
        let itemBack = createRect(name: n, widthExact: inventoryCardWidth, heightExact: inventoryCardHeight, xExact: runningX, yExact: inventoryCardY, fillColor: colorInventoryCardBack)
        itemCard.addChild(itemBack)
        
        // image of item TODO
        
        // title
        let title = createLabelTitleCentered(name: n, text: item.detailName, x: runningX + (inventoryCardWidth/2), y: inventoryCardTop - 50, textColor: colorInventoryCardTitle)
        itemCard.addChild(title)
        
        // description TODO
        
        // more info btn TODO
        
        // finish
        invDisplay.addChild(itemCard)
        
        // incrament X
        runningX += inventoryCardWidth + inventoryPadding
    }
    inventoryDisplayContainerWidthRunning = runningX + inventoryCardWidth + inventoryPadding
    
    
    // done
    return invDisplay
}




//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
////                                                          ////
////              Helper Functions - CALCULATIONS             ////
////                                                          ////
//// //////////////////////////////////////////////////////// ////
//// //////////////////////////////////////////////////////// ////
func calcXForFarRight(itemWidth: CGFloat) -> CGFloat {
    return SceneBase.sceneSize.width - itemWidth
}

func centerTextLabelInRect(label label: SKLabelNode, rectX: CGFloat, rectY: CGFloat, rectWidth: CGFloat, rectHeight: CGFloat) {
    let labelWidth = label.frame.width
    let labelHeight = label.frame.height
    label.position.x = rectX + ((rectWidth-labelWidth) / 2)
    label.position.y = rectY + (rectHeight/2) + (labelHeight/2)
}