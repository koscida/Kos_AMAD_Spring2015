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

class CreateLevelSpritePlayer: SKNode {
    
    var bodySprite = SKSpriteNode()
    var armorSprite = SKSpriteNode()
    var weaponSprite = SKSpriteNode()
    
    convenience init(name: String, bodyImageName: String, armorImageName: String, weaponImageName: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, zPosition: CGFloat) {
        self.init()
        let size = CGSize(width: width, height: height)
        let position = CGPoint(x: x, y: y)
        
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
    
    
    
    
    
    
}