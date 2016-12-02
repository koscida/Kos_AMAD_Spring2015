//
//  SceneEnd.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

/* ******************************** */
/*              STATE 7             */
/* ******************************** */

import SpriteKit

class SceneEnd: SceneBase {

    override func didMoveToView(view: SKView) {
        
        print("SceneEnd - state 7")
        
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
}
