//
//  ItemSprite.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/26/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class ItemSprite: SKNode {
    
    private var itemSprite = SKSpriteNode()
    
    var collected: Bool = false
    
    var type: Int = 0
    
    var topPosition: CGFloat = 0
    var bottomPosition: CGFloat = 0
    var leftPosition: CGFloat = 0
    var rightPosition: CGFloat = 0
    
    convenience init(name: String, imageName: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, zPosition: CGFloat, itemType: Int) {
        self.init()
        let size = CGSize(width: width, height: height)
        let position = CGPoint(x: x, y: y)
        
        let imageTexture = SKTexture(imageNamed: imageName)
        
        itemSprite.texture = imageTexture
        itemSprite.size = size
        itemSprite.position = position
        itemSprite.name = name
        super.name = name
        itemSprite.zPosition = zPosition
        self.addChild(itemSprite)
        
        topPosition = y + (height/2)
        bottomPosition = y - (height/2)
        leftPosition = x - (width/2)
        rightPosition = x + (width/2)
        
        type = itemType
        
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