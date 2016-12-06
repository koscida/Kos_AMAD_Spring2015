//
//  SceneTeens.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

/* ******************************** */
/*              STATE 4             */
/* ******************************** */

import SpriteKit

class SceneTeens: SceneBase {

    override func didMoveToView(view: SKView) {
		
		let background = SKSpriteNode(texture: SKTexture(imageNamed: "background_infancy"), size: CGSize(width: width, height: height))
		background.position = CGPoint(x: widthMid, y: heightMid)
		addChild(background)
        
		name = levelData[currentLevel].name
		print(name! + " - state 4")
        
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
}
