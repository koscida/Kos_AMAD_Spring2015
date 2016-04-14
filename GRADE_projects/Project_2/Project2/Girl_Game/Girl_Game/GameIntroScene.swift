//
//  GameInroScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit
import SpriteKit

/*
extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks") {
            do {
                let sceneData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                
                //var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
                let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
                
                archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
                let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameIntroScene
                archiver.finishDecoding()
                return scene
                
            } catch {
                print(error)
            }
        } else {
            return nil
        }
        return nil
    }
}
*/

class GameIntroScene: SKScene {
    
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    var titleView = SKNode()
    
    var state = 0;
    
    override func didMoveToView(view: SKView) {
        //print("in GameIntroScene")
        
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        //print("frameWidth: \(frameWidth) frameCenterWidth: \(frameCenterWidth)")
        //print("frameHeight: \(frameHeight) frameCenterHeight: \(frameCenterHeight)")
        
        if(state == 0) {
            loadTitleView()
        }
    }
    
    override init(size: CGSize) {
        super.init(size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    ///////////////////////////////////////
    //          Scene loaders            //
    ///////////////////////////////////////
    func loadTitleView() {
        
        let titleLabel1 = createSKLabelNode(
            text: "Welcome to \"Strong Female Character\"",
            fontSize: 100,
            fontColor: UIColor.whiteColor()
        )
        titleLabel1.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight+(titleLabel1.frame.height*2))
        titleLabel1.name = "titleLabel1"
        titleView.addChild(titleLabel1)
        
        
        let titleLabel2 = createSKLabelNode(
            text: "A game about playing the game of life",
            fontSize: 100,
            fontColor: UIColor.whiteColor()
        )
        titleLabel2.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight)
        titleView.addChild(titleLabel2)
        
        let titleLabel3 = createSKLabelNode(
            text: "as a girl.",
            fontSize: 100,
            fontColor: pinkColor
        )
        titleLabel3.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight-(titleLabel3.frame.height*2))
        titleView.addChild(titleLabel3)

        
        
        let playButtonShapeWidth: CGFloat = 300
        let playButtonShapeHeight: CGFloat = 130
        
        let playButtonShapeRect = CGRect(x: frameCenterWidth-(playButtonShapeWidth/2), y: 0+frameBorder, width: playButtonShapeWidth, height: playButtonShapeHeight)
        let playButtonShape = createSKShapeNodeRect(name: "playButtonShape", rect: playButtonShapeRect, fillColor: pinkColor)
        playButtonShape.strokeColor = UIColor(white: 1, alpha: 1)
        titleView.addChild(playButtonShape)
        
        let playLabel = createSKLabelNodeAdj(
            name: "playLabel",
            text: "PLAY",
            x: frameCenterWidth, y: (playButtonShapeHeight/2)+frameBorder,
            width: playButtonShapeWidth*(2/3), height: playButtonShapeHeight*(2/3),
            fontColor: UIColor.whiteColor()
        )
        titleView.addChild(playLabel)
        
        

        
        
        self.addChild(titleView)
    }
    func loadInstructionsView() {
        //self.addChild(instructionsView)
    }
    
    func stateChangeNext() {
        switch state {
            case 0:
                titleView.removeFromParent()
                //loadInstructionsView()
                let transition = SKTransition.flipVerticalWithDuration(1.0)
                let game = GameCharacterCreationScene(size:frame.size)
                view!.presentScene(game, transition: transition)
            
            default:
                return;
        }
        
        state++
    }
    
    
    
    
    
    
    
    ////////////////////////////////////
    //          Game Logic            //
    ////////////////////////////////////
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(location)
            
            //print("x: \(location.x)")
            //print("y: \(location.y)")
            
            if let name = touchedNode.name
            {
                if name == "playLabel" || name == "playButtonShape"
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

