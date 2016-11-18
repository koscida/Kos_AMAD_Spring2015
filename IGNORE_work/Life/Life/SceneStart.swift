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
        
        
        print("SceneStart - state 0")
        
        createContent()
        
        
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
                    stateChangeNext()
                }
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    
    func createContent() {
        
        let titleLabel1 = createLabelTitleCentered(name: "", text: "This is a game", x: SceneBase.frameCenterWidth, y: SceneBase.frameCenterHeight + 300, textColor: colorStartText)
        self.addChild(titleLabel1)
        
        let titleLabel2 = createLabelTitleCentered(name: "", text: "about the game of life", x: SceneBase.frameCenterWidth, y: SceneBase.frameCenterHeight + 100, textColor: colorStartText)
        self.addChild(titleLabel2)
        
        let titleLabel3 = createLabelTitleCentered(name: "", text: "for women", x: SceneBase.frameCenterWidth, y: SceneBase.frameCenterHeight - 100, textColor: colorStartText)
        self.addChild(titleLabel3)
        
        let playButton = createPopupGoButton(name: "playButton", text: "PLAY", x: SceneBase.frameCenterWidth, y: SceneBase.frameCenterHeight - 300)
        self.addChild(playButton)
        
    }
    
    

}
