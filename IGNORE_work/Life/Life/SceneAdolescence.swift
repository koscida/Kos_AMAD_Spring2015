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
        
		name = levelData[currentLevel].name
		print(name! + " - state 3")
        
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "SceneAdolescence"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        
        // add menu overlay
        //addMenuOverlay(self)
        
        // test
        print(self.children)
    }
    
    
}