//
//  SceneAdulthood.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

/* ******************************** */
/*              STATE 6             */
/* ******************************** */

import SpriteKit

class SceneAdulthood: SceneBase {

    override func didMoveToView(view: SKView) {
        
		name = levelData[currentLevel].name
		print(name! + " - state 6")
        
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }

}
