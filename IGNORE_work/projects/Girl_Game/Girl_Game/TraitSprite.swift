//
//  TraitSprite.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/26/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class TraitSprite: SKNode {
    
    private var labelSprite = SKLabelNode()
    private var backgroundSprite = SKShapeNode()
    private var valueSprite = SKShapeNode()
    
    var value: Int = 0
    
    var topPosition: CGFloat = 0
    var bottomPosition: CGFloat = 0
    var leftPosition: CGFloat = 0
    var rightPosition: CGFloat = 0
    
    convenience init(name: String, text: String, xLeft: CGFloat, yTop: CGFloat, width: CGFloat, height: CGFloat, zPosition: CGFloat, traitValue: Int) {
        self.init()
        
        value = traitValue
        
        // divy up height
        let padding: CGFloat = 0
        let heightLabel = (height-(padding*2)) * 0.6
        let heightBar = height - padding - heightLabel
        
        // create label
        labelSprite = createSKLabelNodeAdj(name: name, text: text, x: xLeft+(width/2), y: yTop-(heightLabel/2), width: width, height: heightLabel, fontColor: UIColor.blackColor())
        labelSprite.zPosition = zPosition
        self.addChild(labelSprite)
        
        // background trait bar
        backgroundSprite = SKShapeNode(rect: CGRect(x: xLeft, y: yTop - height, width: width, height: heightBar))
        backgroundSprite.zPosition = zPosition
        backgroundSprite.fillColor = greyLightColor
        backgroundSprite.lineWidth = 0
        self.addChild(backgroundSprite)
        
        // colored trait bar
        valueSprite = SKShapeNode(rect: CGRect(x: xLeft, y: yTop - height, width: (CGFloat(value)/100) * width, height: heightBar))
        valueSprite.zPosition = zPosition
        valueSprite.fillColor = pinkColor
        valueSprite.lineWidth = 0
        self.addChild(valueSprite)
        
        
        self.name = name
        
        topPosition = yTop
        bottomPosition = yTop - height
        leftPosition = xLeft
        rightPosition = xLeft + width
        
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func moveLeft(backgroundSpeed: CGFloat) {
        super.position.x -= backgroundSpeed
        leftPosition -= backgroundSpeed
        rightPosition -= backgroundSpeed
    }
    
    
}