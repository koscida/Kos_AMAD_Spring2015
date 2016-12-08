//
//  SceneBirth.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
//


/* ******************************** */
/*              STATE 1             */
/* ******************************** */

import SpriteKit

class SceneInfancy: SceneBase {
    
    override func didMoveToView(view: SKView) {
		
		let background = SKSpriteNode(texture: SKTexture(imageNamed: "background_infancy"), size: CGSize(width: width, height: height))
		background.position = CGPoint(x: widthMid, y: heightMid)
		addChild(background)
		
        super.didMoveToView(view)
        
        name = levelData[currentLevel].name
    }
    
    
    /////////////////////////////////////////
    //          Content loaders            //
    /////////////////////////////////////////
        
    
}