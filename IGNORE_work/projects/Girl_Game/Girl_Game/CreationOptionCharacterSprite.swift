//
//  MySKSpriteNode.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/13/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class CreationOptionCharacterSprite {
    
    private var node: SKNode
    
    private var sprite: SKSpriteNode
    private var selectBox: SKShapeNode
    
    private var selected: Bool
    
    
    convenience init(name: String, imageName: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, select: Bool) {
        self.init()
        
        let stubSprite = SKSpriteNode(imageNamed: imageName)
        sprite = stubSprite as SKSpriteNode
        
        sprite.size = CGSize(width: width, height: height)
        sprite.position = CGPoint(x: x, y: y)
        sprite.name = name
        
        node = SKNode()
        node.addChild(sprite)
        
        selected = select
        if(selected) {
            addSelectedBox()
        }
    }
    
    init() {
        node = SKNode()
        sprite = SKSpriteNode()
        selectBox = SKShapeNode()
        selected = false
    }
    
    func getNode() -> SKNode {
        return node;
    }
    
    func changeImage(imageName imageName: String) {
        sprite.texture = SKTexture(imageNamed: imageName)
    }
    
    func addSelectedBox() {
        selectBox = SKShapeNode(rect: CGRect(x: sprite.position.x-(sprite.size.width/2), y: sprite.position.y-(sprite.size.height/2), width: sprite.size.width, height: sprite.size.height))
        selectBox.strokeColor = pinkBrightColor
        selectBox.name = sprite.name
        selectBox.lineWidth = 5
        
        node.addChild(selectBox)
    }
    
    func removeSelectedBox() {
        //print("in removeSelectedBox")
        selectBox.removeFromParent()
    }
    
}