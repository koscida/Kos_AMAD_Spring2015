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
var levelData = [Level]()

let currentLevel_Start			= 0
let currentLevel_Infancy		= 1
let currentLevel_Childhood		= 2
let currentLevel_Adolescence	= 3
let currentLevel_Teens			= 4
let currentLevel_College		= 5
let currentLevel_Adulthood		= 6
let currentLevel_End			= 7

func loadLevelData() {
    // LEVELS
    levelData = [
		
		Level(
			name: "LevelStart",
			moneyMax: 0, moneyAddValue: 30,
			items:[]
		),
		
		//////////////////////////////
		//      infancy level       //
		//////////////////////////////
		Level(
			name: "LevelInfancy",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				// toys
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				),
				Item(
					name: "walker", resourceName: "infancy_walker",
					detailName: "Walker", detailDescription: "Learn how to walk.", detailCost: 5,
					tryMessages: ["Great idea!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 0, 0, 1]
				),
				Item(
					name: "donut", resourceName: "infancy_rings",
					detailName: "Ring Toy", detailDescription: "Every baby had this thing.", detailCost: 5,
					tryMessages: ["Fun!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [1, 0, 1, 0]
				),
				Item(
					name: "keys", resourceName: "infancy_keys",
					detailName: "Keys", detailDescription: "For the teething months.", detailCost: 5,
					tryMessages: ["Fun!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 1, 0]
				),
            
				// clothes
				Item(
					name: "onesie_superhero", resourceName: "infancy_onsie-future-superhero",
					detailName: "\"Superhero\" Onsie", detailDescription: "Cute onsie for a baby!", detailCost: 10,
					tryMessages: [
						"Why don't you pick out a different one for a girl?",
						"You won't look cute in that, why don't you pick something else?",
						"This onsie is for a boy.  Are you sure you want it?"
					],
					buyMinAttempts: 4, buyAttempts: 0, owns: 0,
					traitValueChanges: [1, 1, 1, 1]
				),
				Item(
					name: "onsie_wife-future", resourceName: "infancy_onsie-future-wife",
					detailName: "\"Future Trophy Wife\" Onsie", detailDescription: "Cute onsie for a baby!", detailCost: 10,
					tryMessages: ["How funny!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, -1]
				)
			] // end items array
		),
		Level(
			name: "LevelChildhood",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		),
		Level(
			name: "LevelAdolescence",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		),
		Level(
			name: "LevelTeens",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		),
		Level(
			name: "LevelCollege",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		),
		Level(
			name: "LevelAdulthood",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		),
		Level(
			name: "LevelEnd",
			moneyMax: 30, moneyAddValue: 30,
			items:[
				Item(
					name: "plushie", resourceName: "infancy_plushie",
					detailName: "Frog Plushie", detailDescription: "Soft and safe stuffed animal.", detailCost: 5,
					tryMessages: ["Cute!"],
					buyMinAttempts: 1, buyAttempts: 0, owns: 0,
					traitValueChanges: [0, 1, 0, 0]
				)
			]
		)
	] // end levelData array
}


let levelNameBase           = "LevelBase"
/*let levelNameStart          = "LevelStart"
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
]*/

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
var traitsDataOrigin = [Trait]()
func loadTraitData() {
	// LEVELS
	traitsDataOrigin = [
		Trait(
			name	: "Empathy",
			fem		: true,
			value	: 0,
			max		: 10
		),
		Trait(
			name	: "Nuturing",
			fem		: true,
			value	: 0,
			max		: 10
		),
		Trait(
			name	: "Logic",
			fem		: false,
			value	: 0,
			max		: 10
		),
		Trait(
			name	: "Confidence",
			fem		: false,
			value	: 0,
			max		: 10
		)
	]
}







//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////
////                                        ////
////              DATA - MONEY              ////
////                                        ////
//// ////////////////////////////////////// ////
//// ////////////////////////////////////// ////

// this will change
var moneyTotal: CGFloat = 0
var moneyGoal: CGFloat = 0
var moneyTmp: CGFloat = 0




//// ////////////////////////////////////////// ////
//// ////////////////////////////////////////// ////
////											////
////              DATA - LOAD ORIGIN			////
////											////
//// ////////////////////////////////////////// ////
//// ////////////////////////////////////////// ////
func loadOriginData() {
    loadLevelData()
	loadTraitData()
}



let alphaIncrament: CGFloat = 0.1







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

let colorBlack = UIColor.blackColor()
let colorWhite = UIColor.whiteColor()


//////////////////////////////
//  item display scrolling
let colorItemDisplayBack = colorGreyLight


///////////////////
// menu overlay
let colorStatusBarBack = colorGreyDark

let colorStatusMoneyText = colorWhite
let colorStatusTraitBarBack = colorGreyLight
let colorStatusTraitBarLevel = colorPurple

let colorNextSceneFill = colorPink
let colorNextSceneText = colorWhite



//////////////////
// item detail
let colorPopupMute = UIColor(red: (colorGreyDark_Red), green: (colorGreyDark_Green), blue: (colorGreyDark_Blue), alpha: 0.6)
let colorPopupBack = colorGreyLight
let colorPopupText = colorWhite

let colorPopupBackWarning = colorGreyMedium

let colorPopupButtonSmallFillBright = colorPink
let colorPopupButtonSmallTextBright = colorWhite
let colorPopupButtonSmallFillMuted = colorGreyMedium
let colorPopupButtonSmallTextMuted = colorBlack

let colorPopupButtonBigFill = colorPink
let colorPopupButtonBigText = colorWhite

let colorChangingStatsTraitBarBack = colorWhite
let colorChangingStatsTraitBarLevel = colorStatusTraitBarLevel



/////////////////
// inventory
let colorInventoryButtonFill = colorPink
let colorInventoryButtonText = colorWhite

let colorInventoryButtonExitFill = colorGreyMedium
let colorInventoryButtonExitText = colorBlack

let colorInventoryTitle = colorBlack

let colorInventoryTabBack = colorGreyMedium
let colorInventoryTabText = colorBlack

let colorInventoryDisplayContainerBack = colorGreyMedium
let colorInventoryCardBack = colorGreyDark
let colorInventoryCardTitle = colorWhite


let colorStartText = colorWhite











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

let fontTitle = "MarkerFelt-Wide"
let fontText = "Helvetica"


/////////////////////
//		Items
let itemPadding: CGFloat = 40

let itemDisplayContainerNode = "itemDisplayContainerNode"

let itemDisplayXIncrament: CGFloat = (150)

let itemDisplayNameSuffix = "_itemDisplay"
let itemDisplayWidth: CGFloat = 800
let itemDisplayHeight: CGFloat = 800
let itemDisplayY = heightMid

let itemDisplayImageWidth = itemDisplayWidth - (itemPadding*2)
let itemDisplayImageHeight = itemDisplayHeight - (itemPadding*2)
let itemDisplayImageY = itemDisplayY
let itemDisplayXOffset = (itemDisplayImageWidth/2) + itemPadding




//////////////////////////
//		Generic Popup	//
let popupPadding: CGFloat = 20

let popupWidthFraction: CGFloat = 0.8
let popupHeightFraction: CGFloat = 0.8
let popupWidth = popupWidthFraction * width
let popupHeight = popupHeightFraction * height
let popupX = widthMid
let popupXLeft = popupX - (popupWidth / 2)
let popupXRight = popupX + (popupWidth / 2)
let popupY = heightMid
let popupYBottom = popupY - (popupHeight / 2)
let popupYTop = popupY + (popupHeight / 2)

let popupButtonSmallWidth: CGFloat = 300
let popupButtonSmallHeight: CGFloat = 150
let popupButtonBigWidth: CGFloat = 500
let popupButtonBigHeight: CGFloat = 200

let popupTextTitleHeight = popupPadding * 6
let popupTextRegularHeight = popupTextTitleHeight * 0.5



//////////////////////////
//		Item Detail		//
let itemDetailPadding = popupPadding * 2

let itemDetailWidth = popupWidth
let itemDetailHeight = popupHeight
let itemDetailX = popupX
let itemDetailY = popupY


let itemDetailButtonCancel = "cancelBtn"
let itemDetailButtonConfirm = "confirmBtn"
let itemDetailButtonWidth = popupButtonSmallWidth
let itemDetailButtonHeight = popupButtonSmallHeight
let itemDetailLeftButtonX = popupXLeft + itemDetailPadding + (itemDetailButtonWidth/2)
let itemDetailRightButtonX = popupXRight - itemDetailPadding - (itemDetailButtonWidth/2)
let itemDetailButtonY = popupYBottom + itemDetailPadding + (itemDetailButtonHeight/2)


let itemDetailImageHeight = popupHeight - (3*itemDetailPadding) - itemDetailButtonHeight
let itemDetailImageWidth = itemDetailImageHeight
let itemDetailImageX = popupXLeft + itemDetailPadding + (itemDetailImageWidth/2)
let itemDetailImageY = popupYTop - itemDetailPadding - (itemDetailImageHeight/2)

let itemDetailTitleWidth = popupWidth - (3*itemDetailPadding) - itemDetailImageWidth
let itemDetailTitleHeight = popupTextTitleHeight
let itemDetailTitleX = popupXRight - itemDetailPadding - (itemDetailTitleWidth/2)
let itemDetailTitleXLeft = itemDetailTitleX - (itemDetailTitleWidth/2)
let itemDetailTitleY = popupYTop - itemDetailPadding - (itemDetailTitleHeight/2)

let itemDetailDescWidth = itemDetailTitleWidth
let itemDetailDescHeight = popupTextRegularHeight
let itemDetailDescX = itemDetailTitleX
let itemDetailDescXLeft = itemDetailTitleXLeft
let itemDetailDescY = itemDetailTitleY - (itemDetailTitleHeight/2) - itemDetailPadding - (itemDetailDescHeight/2)

let itemDetailCostWidth = (itemDetailTitleWidth/2) - popupPadding
let itemDetailCostHeight = popupTextRegularHeight
let itemDetailCostXLeft = itemDetailTitleXLeft
let itemDetailCostX = itemDetailCostXLeft + (itemDetailCostWidth/2)
let itemDetailCostY = itemDetailDescY - (itemDetailDescHeight/2) - itemDetailPadding - (itemDetailCostHeight/2)



//////////////////////////////
//		Changing Stats		//
let changingStatsPadding = popupPadding * 2

let changingStatsWidth = popupWidth * 1.1
let changingStatsHeight = popupHeight * 1.1
let changingStatsX = popupX
let changingStatsXLeft = changingStatsX - (changingStatsWidth / 2)
let changingStatsXRight = changingStatsX + (changingStatsWidth / 2)
let changingStatsY = popupY
let changingStatsYTop = changingStatsY + (changingStatsHeight / 2)
let changingStatsYBottom = changingStatsY - (changingStatsHeight / 2)


let changingStatsMoneyDecrement: CGFloat = 0.5
let changingStatsTraitIncrement: CGFloat = 0.1
let changingStatsDurationSec: CGFloat = 2
let changingStatsFPS: CGFloat = 5
let changingStatsTotalFrames = changingStatsDurationSec * changingStatsFPS

let changingStatsMoneyNodeName = "changingMoneyNode"
let changingStatsMoneyWidth = changingStatsWidth
let changingStatsMoneyHeight = popupTextTitleHeight
let changingStatsMoneyX = changingStatsX
let changingStatsMoneyY = popupYTop - changingStatsPadding - (changingStatsMoneyHeight/2)

let changingStatsTraitSuffix = "_changingTraitNode"
let changingStatsTraitWidth = changingStatsWidth * 0.5
let changingStatsTraitHeight = (changingStatsHeight - 
		changingStatsPadding - changingStatsMoneyHeight - changingStatsPadding - 
		changingStatsPadding - popupButtonBigHeight - changingStatsPadding - 
		(changingStatsPadding * 4)
	) / 4
let changingStatsTraitX = changingStatsX
let changingStatsTraitXLeft = changingStatsTraitX - (changingStatsTraitWidth/2)
let changingStatsTraitFirstY = changingStatsYTop - changingStatsPadding - changingStatsMoneyHeight - changingStatsPadding - (changingStatsTraitHeight/2) - changingStatsPadding

let changingStatsButtonOk = "statsOkBtn"
let changingStatsButtonWidth = popupButtonBigWidth
let changingStatsButtonHeight = popupButtonBigHeight
let changingStatsButtonX = changingStatsX
let changingStatsButtonY = changingStatsYBottom + (changingStatsButtonHeight / 2) + changingStatsPadding



//////////////////////////
//			Error		//
let errorPadding = popupPadding 

let errorWidth = popupWidth * 0.9
let errorHeight = popupHeight * 0.9
let errorX = popupX
let errorXLeft = errorX - (errorWidth / 2)
let errorXRight = errorX + (errorWidth / 2)
let errorY = popupY
let errorYTop = errorY + (errorHeight / 2)
let errorYBottom = errorY - (errorHeight / 2)

let errorMessageWidth = errorWidth * 0.75
let errorMessageHeight = popupTextRegularHeight
let errorMessageX = errorX
let errorMessageY = errorYTop - (errorHeight - errorButtonHeight - errorPadding)/2


let errorButtonOk = "errorBtn"
let errorButtonWidth = popupButtonBigWidth
let errorButtonHeight = popupButtonBigHeight
let errorButtonX = errorX
let errorButtonY = errorYBottom + (errorButtonHeight / 2) + (errorPadding*2)



//////////////////////////////////////
//			Buy Confirmation		//
let buyConfirmPadding = popupPadding * 2

let buyConfirmWidth = popupWidth * 1.1
let buyConfirmHeight = popupHeight * 1.1
let buyConfirmX = popupX
let buyConfirmXLeft = buyConfirmX - (buyConfirmWidth / 2)
let buyConfirmXRight = buyConfirmX + (buyConfirmWidth / 2)
let buyConfirmY = popupY
let buyConfirmYTop = buyConfirmY + (buyConfirmHeight / 2)
let buyConfirmYBottom = buyConfirmY - (buyConfirmHeight / 2)

let buyConfirmMessageOk = "buyMessageBtn"
let buyConfirmButtonWidth = popupButtonBigWidth
let buyConfirmButtonHeight = popupButtonBigHeight
let buyConfirmButtonX = buyConfirmX
let buyConfirmButtonY = buyConfirmYBottom + (buyConfirmButtonHeight / 2) + buyConfirmPadding

let buyConfirmLabelWidth = buyConfirmWidth - (buyConfirmPadding*2)
let buyConfirmLabelHeight = buyConfirmHeight - buyConfirmButtonHeight - (buyConfirmPadding*3)
let buyConfirmLabelX = buyConfirmX
let buyConfirmLabelY = buyConfirmYTop - buyConfirmPadding - (buyConfirmLabelHeight/2)



//////////////////////////////////
//			Inventory Menu		//

let menuPadding: CGFloat = 20

let menuInventoryButtonName = "inventoryBtn"
let menuInventoryButtonWidth: CGFloat = 300
let menuInventoryButtonHeight: CGFloat = 100
let menuInventoryButtonX = menuPadding + (nextSceneButtonWidth/2)
let menuInventoryButtonY = 0 + (menuInventoryButtonHeight/2) + menuPadding
let menuInventoryButtonLabelWidth = menuInventoryButtonWidth - (menuPadding*2)
let menuInventoryButtonLabelHeight = menuInventoryButtonHeight - (menuPadding*2)

let nextSceneButtonName = "nextSceneBtn"
let nextSceneButtonHeight = menuInventoryButtonHeight
let nextSceneButtonWidth = menuInventoryButtonWidth
let nextSceneButtonX = width - (menuInventoryButtonWidth/2) - menuPadding
let nextSceneButtonY = menuPadding + (nextSceneButtonHeight/2)
let nextSceneButtonTextHeight = nextSceneButtonHeight - (menuPadding*2)
let nextSceneButtonTextWidth = nextSceneButtonWidth - (menuPadding*2)



let statusPadding = menuPadding*1.5

let statusBarBackWidth = width
let statusBarBackHeight: CGFloat = 100
let statusBarBackX = widthMid
let statusBarBackY = height - (statusBarBackHeight/2)

let statusMoneyNodeName = "statusMoneyNode"
let statusMoneyWidth = width * (1/5)
let statusMoneyHeight = statusBarBackHeight - (statusPadding*2)
let statusMoneyXLeft = statusPadding
let statusMoneyY = height - statusPadding - (statusMoneyHeight/2)

let statusTraitsNodeName = "statusTraitsNode"
let statusTraitBarWidth = ((width - statusPadding) / 10) - statusPadding
let statusTraitBarHeight = statusBarBackHeight - (statusPadding*2)
let statusTraitLevelHeight = statusTraitBarHeight
let statusTraitLevelWidthMax = statusTraitBarWidth
let statusTraitY = height - (statusPadding*1) - (statusTraitBarHeight/2)
let statusTraitLeftX = width - statusPadding - statusTraitBarWidth
let statusTrait1XLeft = statusTraitLeftX
let statusTrait2XLeft = statusTrait1XLeft - statusTraitBarWidth - statusPadding
let statusTrait3XLeft = statusTrait2XLeft - statusTraitBarWidth - statusPadding
let statusTrait4XLeft = statusTrait3XLeft - statusTraitBarWidth - statusPadding

let statusTraitNameSuffix = "_level"



let inventoryPadding: CGFloat = 40

let inventoryBackWidth = width
let inventoryBackHeight = height
let inventoryBackX = widthMid
let inventoryBackY = heightMid


let inventoryHeaderMenuHeight = inventoryPadding + exitButtonHeight + inventoryPadding // all the padding

let inventoryExitButtonName = "inventoryExitBtn"
let exitButtonWidth: CGFloat = 100
let exitButtonHeight: CGFloat = 100
let inventoryButtonExitX = width - (exitButtonWidth/2) - inventoryPadding
let inventoryButtonExitY = height - (exitButtonHeight/2) - inventoryPadding

let inventoryTitleHeight = exitButtonHeight
let inventoryTitleXLeft = inventoryPadding
let inventoryTitleY = inventoryBackHeight - inventoryPadding 


let inventoryTabHeight: CGFloat = 100
let inventoryTabWidth: CGFloat = 300
let inventoryTabMenuHeight = inventoryTabHeight // no padding
let inventoryTabMenuX = inventoryPadding + (inventoryTabWidth/2)
let inventoryTabMenuY = inventoryBackHeight - inventoryHeaderMenuHeight - (inventoryTabMenuHeight/2)
let inventoryTabNameSuffix = "TabBtn"
let inventoryTabMasName = "Other"
let inventoryTabNameAll = "tabAllBtn"

let inventoryDisplayContainerWidth = width
let inventoryDisplayContainerHeight = height - (inventoryHeaderMenuHeight + inventoryTabMenuHeight)
let inventoryDisplayContainerY = (inventoryDisplayContainerHeight/2)

let inventoryCardName = "ItemCard"
let inventoryCardHeight = inventoryDisplayContainerHeight * 0.9
let inventoryCardWidth = inventoryCardHeight * 0.6
let inventoryCardTop = inventoryDisplayContainerHeight * 0.95
let inventoryCardY = inventoryCardTop - (inventoryCardHeight/2)

let inventoryCardImageWidth = inventoryCardWidth - (inventoryPadding*2)
let inventoryCardImageHeight = inventoryCardImageWidth
let inventoryCardImageXOffset = (inventoryCardImageWidth/2) + inventoryPadding
let inventoryCardImageY = inventoryCardTop - inventoryPadding - (inventoryCardImageHeight/2)

let inventoryCardTitleWidth = inventoryCardWidth - (inventoryPadding*2)
let inventoryCardTitleHeight = popupTextTitleHeight
let inventoryCardTitleY = inventoryCardImageY - (inventoryCardImageHeight/2) - inventoryPadding - (inventoryCardTitleHeight/2)

let inventoryCardOwnsWidth = (inventoryCardWidth - (inventoryPadding*2))/2
let inventoryCardOwnsHeight = popupTextRegularHeight
let inventoryCardOwnsY = inventoryCardTitleY - (inventoryCardTitleHeight/2) - inventoryPadding - (inventoryCardOwnsHeight/2)


let inventoryItemDetailPadding = inventoryPadding

let inventoryItemDetailWidth = popupWidth
let inventoryItemDetailHeight = popupHeight
let inventoryItemDetailX = popupX
let inventoryItemDetailXLeft = popupX - (inventoryItemDetailWidth/2)
let inventoryItemDetailXRight = popupX + (inventoryItemDetailWidth/2)
let inventoryItemDetailY = popupY
let inventoryItemDetailYTop = popupY + (inventoryItemDetailHeight/2)
let inventoryItemDetailYButton = popupY - (inventoryItemDetailHeight/2)

let inventoryItemDetailExitButtonName = "inventoryPopupExitBtn"
let inventoryItemDetailExitButtonX = inventoryItemDetailXRight - inventoryItemDetailPadding - (exitButtonWidth/2)
let inventoryItemDetailExitButtonY = inventoryItemDetailYTop - inventoryItemDetailPadding - (exitButtonHeight/2)



