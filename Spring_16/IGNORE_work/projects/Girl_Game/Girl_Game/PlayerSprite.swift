//
//  CreateLevelSprite.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/14/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class PlayerSprite: SKNode {
    
    private var bodySprite = SKSpriteNode()
    private var armorSprite = SKSpriteNode()
    private var weaponSprite = SKSpriteNode()
    private var size = CGSize()
    private var max: CGFloat = 0
    
    private var moveSpeed:CGFloat = 10
    
    var topPosition: CGFloat = 0
    var bottomPosition: CGFloat = 0
    var leftPosition: CGFloat = 0
    var rightPosition: CGFloat = 0
    
    convenience init(name: String, bodyImageName: String, armorImageName: String, weaponImageName: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, zPosition: CGFloat, maxHeight: CGFloat) {
        self.init()
        size = CGSize(width: width, height: height)
        let position = CGPoint(x: x, y: y)
        
        topPosition = y + (height/2)
        bottomPosition = y - (height/2)
        leftPosition = x - (width/2)
        rightPosition = x + (width/2)
        
        max = maxHeight
        
        let bodyTexture = SKTexture(imageNamed: bodyImageName)
        let armorTexture = SKTexture(imageNamed: armorImageName)
        let weaponTexture = SKTexture(imageNamed: weaponImageName)
        
        
        bodySprite.texture = bodyTexture
        bodySprite.size = size
        bodySprite.position = position
        bodySprite.name = name
        bodySprite.zPosition = zPosition
        self.addChild(bodySprite)
        
        armorSprite.texture = armorTexture
        armorSprite.size = size
        armorSprite.position = position
        armorSprite.name = name
        armorSprite.zPosition = (zPosition + 1)
        self.addChild(armorSprite)
        
        /*
        weaponSprite.texture = weaponTexture
        weaponSprite.size = size
        weaponSprite.position = position
        weaponSprite.name = name
        weaponSprite.zPosition = (zPosition + 2)
        self.addChild(weaponSprite)
*/
        
    }
    
    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func movePlayerUp() {
        if super.position.y <= (max - (size.height/2)) {
            super.position.y += moveSpeed
            topPosition += moveSpeed
            bottomPosition += moveSpeed
        }
        
    }
    
    func movePlayerDown() {
        if super.position.y >= (0 + (size.height/2)) {
            super.position.y -= moveSpeed
            topPosition -= moveSpeed
            bottomPosition -= moveSpeed
        }
    }
    
    
}