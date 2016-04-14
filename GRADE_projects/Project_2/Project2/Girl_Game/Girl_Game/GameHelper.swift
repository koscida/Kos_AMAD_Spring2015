//
//  GG.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/12/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


////////////////////////////////
//          Colors            //
////////////////////////////////

let pinkColor = UIColor(red: 255/255, green: 65/255, blue: 159/255, alpha: 1.0)
let pinkLightColor = UIColor(red: 252/255, green: 205/255, blue: 239/255, alpha: 1.0)
let pinkBrightColor = UIColor(red: 241/255, green: 0/255, blue: 119/255, alpha: 1.0)

let tealColor = UIColor(red: 9/255, green: 160/255, blue: 179/255, alpha: 1.0)
let yellowColor = UIColor(red: 255/255, green: 227/255, blue: 26/255, alpha: 1.0)
let limeColor = UIColor(red: 246/255, green: 252/255, blue: 64/255, alpha: 1.0)

let greyLightColor = UIColor(white: 203/255, alpha: 1.0)
let greyMediumColor = UIColor(white: 127/255, alpha: 1.0)
let greyDarkColor = UIColor(white: 89/255, alpha: 1.0)



func getUIColor(r r: CGFloat, g: CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
}



/////////////////////////////////////////////////////////
//          Helper Functions - CREATE LABEL            //
/////////////////////////////////////////////////////////
func adjustLabelFontSizeToFitRect(labelNode labelNode:SKLabelNode, rect:CGRect) {
    //http://stackoverflow.com/questions/30980918/how-to-set-font-size-of-sklabelnode-to-fit-in-fixed-size-swift
    
    // Determine the font scaling factor that should let the label text fit in the given rectangle.
    let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
    //print("scalingFactor: \(scalingFactor)")
    
    // Change the fontSize.
    //print("fontSize before: \(labelNode.fontSize)")
    labelNode.fontSize *= scalingFactor
    //print("fontSize after: \(labelNode.fontSize)")
    
    // Optionally move the SKLabelNode to the center of the rectangle.
    //labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
}



// calls base
// without name and x & y and fontName
func createSKLabelNode(text text: String, fontSize: CGFloat, fontColor:  UIColor) -> SKLabelNode {
    return createSKLabelNode(name: "", text: text, x: 0, y: 0, fontSize: fontSize, fontColor:  fontColor, fontName: "MarkerFelt-Wide")
}

// calls base
// without x & y and fontName
func createSKLabelNode(name name: String, text: String, fontSize: CGFloat, fontColor:  UIColor) -> SKLabelNode {
    return createSKLabelNode(name: name, text: text, x: 0, y: 0, fontSize: fontSize, fontColor:  fontColor, fontName: "MarkerFelt-Wide")
}

// calls base
// without fontName
func createSKLabelNode(name name: String, text: String, x: CGFloat, y: CGFloat, fontSize: CGFloat, fontColor:  UIColor) -> SKLabelNode {
    return createSKLabelNode(name: name, text: text, x: x, y: y, fontSize: fontSize, fontColor: fontColor, fontName: "MarkerFelt-Wide")
}

// base
func createSKLabelNode(name name: String, text: String, x: CGFloat, y: CGFloat, fontSize: CGFloat, fontColor:  UIColor, fontName: String) -> SKLabelNode {
        let stubLabel = SKLabelNode(fontNamed: fontName)
        stubLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        stubLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        stubLabel.name = name
        stubLabel.text = text
        stubLabel.fontSize = fontSize
        stubLabel.fontColor = fontColor
        stubLabel.position = CGPoint(x: x, y: y)
        
        return stubLabel
}


// calls base adj
// without fontName
func createSKLabelNodeAdj(name name: String, text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, fontColor:  UIColor) -> SKLabelNode {
    return createSKLabelNodeAdj(name: name, text: text, x: x, y: y, width: width, height: height, fontColor: fontColor, fontName: "MarkerFelt-Wide")
}

// base adj
func createSKLabelNodeAdj(
    name name: String,
    text: String,
    x: CGFloat, y: CGFloat,
    width: CGFloat, height: CGFloat,
    fontColor:  UIColor,
    fontName: String) -> SKLabelNode {
        
        let stubLabel = createSKLabelNode(name: name, text: text, x: x, y: y, fontSize: 2, fontColor: fontColor, fontName: fontName)
        adjustLabelFontSizeToFitRect(labelNode: stubLabel, rect:CGRect(x: 0, y: 0, width: width, height: height))
        
        return stubLabel
}







/////////////////////////////////////////////////////////
//          Helper Functions - CREATE SHAPE            //
/////////////////////////////////////////////////////////

// base
func createSKShapeNodeRect(name name: String, rect: CGRect, fillColor:  UIColor) -> SKShapeNode {
    let stubShape = SKShapeNode(rect: rect)
    stubShape.fillColor = fillColor
    stubShape.name = name
    
    return stubShape
}







