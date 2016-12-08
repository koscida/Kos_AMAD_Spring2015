//
//  SceneAdolescence.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//


/* ******************************** */
/*              STATE 3             */
/* ******************************** */


import SpriteKit

class SceneAdolescence: SceneBase {
    
    override func didMoveToView(view: SKView) {
        
		let background = SKSpriteNode(texture: SKTexture(imageNamed: "background_adolescence"), size: CGSize(width: width, height: height))
		background.position = CGPoint(x: widthMid, y: heightMid)
		addChild(background)
		
		super.didMoveToView(view)
		
		name = levelData[currentLevel].name
    }
    
    
}