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
        
		//super.didMoveToView(view)
		
		name = levelData[currentLevel].name
		
		createContent_Main()
    }
    
    override func createContent_Main() {
		// TODO: - animate this
		self.addChild(createSceneStart())
    }
    
}

