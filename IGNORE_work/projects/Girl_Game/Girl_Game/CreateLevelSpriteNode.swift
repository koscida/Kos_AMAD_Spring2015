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

class CreateLevelSpriteNode: SKSpriteNode {
    
    init(name: String, imageName: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, zPosition: CGFloat) {
        let texture = SKTexture(imageNamed: imageName)
        let size = CGSize(width: width, height: height)
        
        super.init(texture: texture, color: UIColor.clearColor(), size: size)
        
        super.position = CGPoint(x: x, y: y)
        super.name = name
        super.zPosition = zPosition
        
    }
    
    init() {
        let texture = SKTexture(imageNamed: "Shaceship")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.hidden = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeImage(imageName imageName: String) {
        self.texture = SKTexture(imageNamed: imageName)
    }
    
}