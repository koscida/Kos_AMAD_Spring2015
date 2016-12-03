//
//  DataHelper.swift
//  Life
//
//  Created by Brittany Ann Kos on 11/22/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////
////                                        ////
////              DATA - LEVELS             ////
////                                        ////
//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////

// this will change
var currentLevel = 0

// this will change
var allItems = [[Item]]()

let currentLevel_Start			= -1
let currentLevel_Infancy		= 0
let currentLevel_Childhood		= 1
let currentLevel_Adolescence	= 2
let currentLevel_Teens			= 3
let currentLevel_College		= 4
let currentLevel_Adulthood		= 5
let currentLevel_End			= 6

let itemNameSuffix = "_Item"

func loadLevelData() {
    // LEVELS
    allItems = [
        
        //////////////////////////////
        //      infancy items       //
        //////////////////////////////
        [
            // toys
            Item(
                name: "plushie", resourceName: "",
                detailName: "Plushie", detailDescription: "This is a stuffed animal.", detailCost: 5,
                tryMessages: ["Cute!"],
                buyMinAttempts: 1, buyAttempts: 0, owns: 0,
                traitValueChanges: [1, 1, 1, 1, 1, 1, 1, 1]
            ),
            Item(
                name: "walker", resourceName: "",
                detailName: "Walker", detailDescription: "Learn how to walk.", detailCost: 5,
                tryMessages: ["Great idea!"],
                buyMinAttempts: 1, buyAttempts: 0, owns: 0,
                traitValueChanges: [1, 1, 1, 1, 1, 1, 1, 1]
            ),
            Item(
                name: "donut", resourceName: "",
                detailName: "Donut Thing", detailDescription: "Every baby had this thing.", detailCost: 5,
                tryMessages: ["Fun!"],
                buyMinAttempts: 1, buyAttempts: 0, owns: 0,
                traitValueChanges: [1, 1, 1, 1, 1, 1, 1, 1]
            ),
            Item(
                name: "keys", resourceName: "",
                detailName: "Donut Thing", detailDescription: "Every baby had this thing.", detailCost: 5,
                tryMessages: ["Fun!"],
                buyMinAttempts: 1, buyAttempts: 0, owns: 0,
                traitValueChanges: [1, 1, 1, 1, 1, 1, 1, 1]
            ),
            
            // clothes
            Item(
                name: "onesie_superhero", resourceName: "",
                detailName: "\"Superhero\" Onsie", detailDescription: "Cute onsie for a baby!", detailCost: 10,
                tryMessages: [
                    "What a cute onsie for a boy.  Why don't you pick out a different one for a girl?",
                    "You won't look cute in that, pick something else.",
                    "This onsie is for a boy.  Are you sure you want it?"
                ],
                buyMinAttempts: 4, buyAttempts: 0, owns: 0,
                traitValueChanges: [1, 1, 1, 1]
            ),
            Item(
                name: "onsie_wife-future", resourceName: "infancy_wife-onsie",
                detailName: "\"Future Trophy Wife\" Onsie", detailDescription: "Cute onsie for a baby!", detailCost: 10,
                tryMessages: ["How funny!"],
                buyMinAttempts: 1, buyAttempts: 0, owns: 0,
                traitValueChanges: [0, 1, 0, -1]
            )
        ]
    ]
}


let levelNameBase           = "LevelBase"
let levelNameStart          = "LevelStart"
let levelNameInfancy        = "LevelInfancy"
let levelNameChildhood      = "LevelChildhood"
let levelNameAdolescence    = "LevelAdolescence"
let levelNameTeens          = "LevelTeens"
let levelNameCollege        = "LevelCollege"
let levelNameAdulthood      = "LevelAdulthood"
let levelNameEnd            = "LevelEnd"
let levelNames = [
    levelNameStart,
    levelNameInfancy,
    levelNameChildhood,
    levelNameAdolescence,
    levelNameTeens,
    levelNameCollege,
    levelNameAdulthood,
    levelNameEnd
]

let nameContentNode             = "ContentNode"
let nameAnimationsNode          = "AnimationsNode"
let nameMenuOverlayNode         = "MenuOverlayNode"
let nameMenuOverlayStatsNode    = "MenuOverlayStatsNode"
let nameItemDetailNode          = "ItemDetailNode"
let nameItemDetailPopupNode     = "ItemDetailPopupNode"
let nameInventoryNode           = "InventoryNode"
let nameInventoryPopupNode      = "InventoryPopupNode"

let zPositionContent: CGFloat			= 1
let zPositionAnimations: CGFloat		= 10
let zPositionMenuOverlay: CGFloat		= 20
let zPositionMenuOverlayStats: CGFloat	= 21
let zPositionItemDetail: CGFloat		= 30
let zPositionItemDetailPopup: CGFloat	= 35
let zPositionInventory: CGFloat			= 40
let zPositionInventoryPopup: CGFloat	= 50

let levelMode_Start = 0
let levelMode_ItemDetail = 1
let levelMode_ItemDetail_Message = 2
let levelMode_ItemDetail_ErrorMoney = 3
let levelMode_ItemDetail_ChangingStats = 4
let levelMode_Inventory = 10
let levelMode_Inventory_ItemDetail = 11








//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////
////                                        ////
////              DATA - TRAITS             ////
////                                        ////
//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////

/*let keyTraitReceptive       = 0
let keyTraitEmpathy         = 1
let keyTraitPatience        = 2
let keyTraitNuturing        = 3
let keyTraitIndependence    = 4
let keyTraitLogic           = 5
let keyTraitConfidence      = 6
let keyTraitDisclipline     = 7*/

let keyTraitEmpathy         = 0
let keyTraitNuturing        = 1
let keyTraitLogic           = 2
let keyTraitConfidence      = 3


// this will change (value)
var traitsDataOrigin = [
    [
        "name": "Empathy",
        "fem" : true,
        "value" : 1,
        "max" : 30
    ],
    [
        "name": "Nuturing",
        "fem" : true,
        "value" : 1,
        "max" : 30
    ],

    [
        "name": "Logic",
        "fem" : false,
        "value" : 1,
        "max" : 30
    ],
    [
        "name": "Confidence",
        "fem" : false,
        "value" : 1,
        "max" : 30
    ]
]







//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////
////                                        ////
////              DATA - MONEY              ////
////                                        ////
//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////

// this will change
var moneyTotal = 0

var moneyDataOrigin = [
    [
        "max" : 30,
        "levelAddValue" : 30
    ],
    [
        "max" : 30,
        "levelAddValue" : 30
    ],
    [
        "max" : 30,
        "levelAddValue" : 30
    ],
    [
        "max" : 30,
        "levelAddValue" : 30
    ],
    [
        "max" : 30,
        "levelAddValue" : 30
    ],
    [
        "max" : 30,
        "levelAddValue" : 30
    ]
]




//// ////////////////////////////////////////// ////
//// ////////////////////////////////////////// ////
////											////
////              DATA - LOAD ORIGIN			////
////											////
//// ////////////////////////////////////////// ////
//// ////////////////////////////////////////// ////
func loadOriginData() {
    loadLevelData()
}










//// ///////////////////////////////////// ////
//// ///////////////////////////////////// ////
////                                       ////
////              DATA - COLOR             ////
////                                       ////
//// ///////////////////////////////////// ////
//// ///////////////////////////////////// ////

// https://color.adobe.com/Flat-rainbow-color-theme-3012612/edit/?copy=true&base=2&rule=Custom&selected=0&name=Copy%20of%20Flat%20rainbow&mode=rgb&rgbvalues=0.945098,0.352941,0.352941,0.941176,0.768627,0.0980392,0.305882,0.729412,0.435294,0.176471,0.584314,0.74902,0.584314,0.356863,0.647059&swatchOrder=0,1,2,3,4
let colorPink = UIColor(red: 241/255, green: 90/255, blue: 90/255, alpha: 1.0)
let colorYellow = UIColor(red: 240/255, green: 196/255, blue: 25/255, alpha: 1.0)
let colorGreen = UIColor(red: 78/255, green: 186/255, blue: 111/255, alpha: 1.0)
let colorBlue = UIColor(red: 45/255, green: 149/255, blue: 191/255, alpha: 1.0)
let colorPurple = UIColor(red: 149/255, green: 91/255, blue: 165/255, alpha: 1.0)

let colorGreyDark_Red: CGFloat = 63/255, colorGreyDark_Green: CGFloat = 63/255, colorGreyDark_Blue: CGFloat = 63/255

let colorGreyLight = UIColor(red: 174/255, green: 174/255, blue: 174/255, alpha: 1.0)
let colorGreyMedium = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1.0)
let colorGreyDark = UIColor(red: colorGreyDark_Red, green: colorGreyDark_Green, blue: colorGreyDark_Blue, alpha: 1.0)


let colorStatusMoneyLabelText = UIColor.whiteColor()
let colorStatusMoneyLabelFill = colorGreyMedium
let colorStatusMoneyBarBack = UIColor.whiteColor()
let colorStatusMoneyBarLevel = colorPink


let colorNextSceneFill = UIColor.whiteColor()
let colorNextSceneText = colorPink


let colorPopupMute = UIColor(red: (colorGreyDark_Red), green: (colorGreyDark_Green), blue: (colorGreyDark_Blue), alpha: 0.6)
let colorPopupBack = colorGreyLight

let colorPopupBackWarning = colorGreyMedium

let colorPopupButtonSmallFillBright = colorPink
let colorPopupButtonSmallTextBright = UIColor.whiteColor()
let colorPopupButtonSmallFillMuted = colorGreyMedium
let colorPopupButtonSmallTextMuted = UIColor.blackColor()

let colorPopupButtonGoFill = colorPink
let colorPopupButtonGoText = UIColor.whiteColor()

let colorInventoryButtonExitFill = colorGreyMedium
let colorInventoryButtonExitText = UIColor.blackColor()

let colorInventoryTitle = UIColor.blackColor()

let colorInventoryTabBack = colorGreyMedium
let colorInventoryTabText = UIColor.blackColor()

let colorInventoryDisplayContainerBack = colorGreyMedium
let colorInventoryCardBack = colorGreyDark
let colorInventoryCardTitle = UIColor.blackColor()


let colorStartText = UIColor.whiteColor()











//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////
////                                        ////
////              DATA - VALUES             ////
////                                        ////
//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////

var width: CGFloat = 0
var height: CGFloat = 0
let widthMid = width/2
let heightMid = height/2


let popupWidthFraction: CGFloat = 0.8
let popupHeightFraction: CGFloat = 0.8
let popupWidth: CGFloat = popupWidthFraction * width
let popupHeight: CGFloat = popupHeightFraction * height
let popupLeftX: CGFloat = widthMid - (popupWidth / 2)
let popupRightX = popupLeftX + popupWidth
let popupBottomY: CGFloat = heightMid - (popupHeight / 2)
let popupTopY = popupButtonY + popupHeight

let popupWarningDiffHor = popupWidth * 0.2
let popupWarningDiffVer = popupHeight * 0.2
let popupWarningWidth = popupWidth - popupWarningDiffHor
let popupWarningHeight = popupHeight - popupWarningDiffVer
let popupWarningLeftX = popupLeftX + (popupWarningDiffHor / 2)
let popupWarningRightX = popupRightX - (popupWarningDiffHor / 2)
let popupWarningBottomY = popupBottomY + (popupWarningDiffVer / 2)
let popupWarningTopY = popupTopY - (popupWarningDiffVer / 2)


let popupPadding: CGFloat = 20

let popupButtonWidth: CGFloat = 300
let popupButtonHeight: CGFloat = 150
let popupButtonLeftX: CGFloat = popupLeftX + popupPadding
let popupButtonRightX: CGFloat = popupLeftX + popupWidth - popupPadding - popupButtonWidth
let popupButtonY: CGFloat = popupBottomY + popupPadding

let popupButtonCancel			= "cancelBtn"
let popupButtonConfirm			= "confirmBtn"
let popupButtonBuyMessageOk		= "buyMessageBtn"
let popupButtonErrorOk			= "errorBtn"
let popupButtonStatsChangingOk	= "statsOkBtn"


let popupButtonGoWidth: CGFloat = 500
let popupButtonGoHeight: CGFloat = 200

let popupButtonWarningWidth: CGFloat = 500
let popupButtonWarningHeight: CGFloat = 200
let popupButtonWarningX = widthMid
let popupButtonWarningY = popupWarningBottomY + (popupButtonWarningHeight / 2) + popupPadding


let menuPadding: CGFloat = 20
let statusBarPadding: CGFloat = 10

let menuInventoryButtonWidth: CGFloat = 200
let menuInventoryButtonHeight: CGFloat = 200
let menuInventoryButtonX: CGFloat = width - (menuInventoryButtonWidth/2) - menuPadding
let menuInventoryButtonY: CGFloat = 0 + (menuInventoryButtonHeight/2) + menuPadding
let menuInventoryButtonName = "inventoryBtn"


let statusMoneyNodeName = "statusMoneyNode"
let statusMoneyLevelName = "statusMoneybarLevel"
let statusTraitsNodeName = "statusTraitsNode"

let statusPadding = menuPadding

let statusMoneyLabelWidth = menuPadding * 2.5
let statusMoneyLabelHeight = statusMoneyLabelWidth
let statusMoneyLabelX = statusPadding + (statusMoneyLabelWidth/2)
let statusMoneyLabelY = height - statusPadding - (statusMoneyLabelHeight/2)

let statusMoneyBarHeight = statusMoneyLabelHeight - (1.5*statusPadding)
let statusMoneyBarWidth = ((width - statusMoneyLabelWidth - statusPadding) / 9) - statusPadding
let statusMoneyBarY = statusMoneyLabelY
let statusMoneyBarX = statusPadding + statusMoneyLabelWidth + (statusMoneyBarWidth/2)
let statusMoneyLevelHeight = statusMoneyBarHeight
let statusMoneyLevelWidthMax = statusMoneyBarHeight
let statusMoneyLevelY = statusMoneyLabelY
let statusMoneyLevelXLeft = statusPadding + statusMoneyLabelWidth

let statusTraitBarWidth = statusMoneyBarWidth
let statusTraitBarHeight = statusMoneyBarHeight
let statusTraitLevelHeight = statusTraitBarHeight
let statusTraitLevelWidthMax = statusTraitBarWidth
let statusTraitY = statusMoneyLabelY
let statusTraitXLeftFirst = statusMoneyLevelXLeft + statusMoneyBarWidth + statusPadding


let nextSceneButtonName = "nextSceneBtn"
let nextSceneButtonHeight = menuInventoryButtonHeight * 0.5
let nextSceneButtonWidth = nextSceneButtonHeight * 2.5
let nextSceneButtonX = menuPadding + (nextSceneButtonWidth/2)
let nextSceneButtonY = menuPadding + (nextSceneButtonHeight/2)


let exitButtonWidth: CGFloat = 100
let exitButtonHeight: CGFloat = 100

let inventoryPadding: CGFloat = 40

let inventoryExitButtonName = "inventoryExitBtn"

let inventoryHeaderMenuHeight = inventoryPadding + exitButtonHeight + inventoryPadding

let inventoryTabHeight: CGFloat = 100
let inventoryTabWidth: CGFloat = 300
let inventoryTabMenuHeight = inventoryPadding + inventoryTabHeight
let inventoryTabMenuY = height - inventoryHeaderMenuHeight - inventoryTabMenuHeight
let inventoryTabNameSuffix = "TabBtn"
let inventoryTabMasName = "Other"
let inventoryTabNameAll = "tabAllBtn"

let inventoryDisplayContainerWidth = width
let inventoryDisplayContainerHeight = height - (inventoryHeaderMenuHeight + inventoryTabMenuHeight)
let inventoryDisplayContainerY = (inventoryDisplayContainerHeight/2)

let inventoryCardHeight = inventoryDisplayContainerHeight * 0.9
let inventoryCardWidth = inventoryCardHeight * 0.6
let inventoryCardTop = inventoryDisplayContainerHeight * 0.95
let inventoryCardY = inventoryCardTop - (inventoryCardHeight/2)

let inventoryCardName = "ItemCard"
let inventoryPopupExitButtonName = "inventoryPopupExitBtn"

let inventoryButtonExitX = width - exitButtonWidth - inventoryPadding
let inventoryButtonExitY = height - exitButtonHeight - inventoryPadding

