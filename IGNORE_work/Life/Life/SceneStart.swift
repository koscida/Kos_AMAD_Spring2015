//
//  SceneStart.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

/* ******************************** */
/*              STATE 0             */
/* ******************************** */

import SpriteKit

class SceneStart: SceneBase {

    override func didMoveToView(view: SKView) {
        
		name = levelData[currentLevel].name
        print(name! + " - state 0")
        
        createContent_Main()
        
        // add menu overlay
        //addMenuOverlay(self)
        //self.addChild(SceneBase.menuOverlay)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
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
                    //stateChangeNext()
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func createContent_Main() {
		// TODO: - animate this
		self.addChild(createSceneStart())
    }
    
}

