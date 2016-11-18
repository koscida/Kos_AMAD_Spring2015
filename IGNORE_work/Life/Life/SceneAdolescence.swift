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
        
        print("SceneAdolescence - state 3")
        
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            
            if let name = touchedNode.name
            {
                if name == "playButton"
                {
                    //print("Touched")
                    stateChangeNext()
                }
            }
        }
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    
    
    

}
