//
//  GameInroScene.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit
import SpriteKit

class GameIntroScene: SKScene {
    
    var frameWidth: CGFloat = 0;
    var frameHeight: CGFloat = 0;
    var frameCenterWidth: CGFloat = 0;
    var frameCenterHeight: CGFloat = 0;
    let frameBorder: CGFloat = 20
    
    var titleView = SKNode()
    var instructionsView = SKNode()
    
    let cir = SKShapeNode(circleOfRadius: 50)
    
    var cirX = 160
    
    var state = 0;
    
    var pinkColor: UIColor = UIColor(red: 255/255, green: 51/255, blue: 153/255, alpha: 1)
    
    override func didMoveToView(view: SKView) {
        frameWidth = CGRectGetWidth(frame)
        frameCenterWidth = frameWidth / 2
        frameHeight = CGRectGetHeight(frame)
        frameCenterHeight = frameHeight / 2
        print("frameWidth: \(frameWidth) frameCenterWidth: \(frameCenterWidth)")
        print("frameHeight: \(frameHeight) frameCenterHeight: \(frameCenterHeight)")
        
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
        
        let titleLabel1 = createSKLabelNode(text: "Welcome to \"Strong Female Character\"", width: frameWidth-frameBorder, height: frameHeight-frameBorder)
        titleLabel1.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight+(titleLabel1.frame.height*2))
        titleView.addChild(titleLabel1)
        
        let titleLabel2 = createSKLabelNode(text: "A game about playing the game of life", width: frameWidth-frameBorder, height: frameHeight-frameBorder)
        titleLabel2.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight)
        titleView.addChild(titleLabel2)
        
        let titleLabel3 = createSKLabelNode(text: ". . . as a girl", width: frameWidth-frameBorder, height: frameHeight-frameBorder)
        titleLabel3.fontSize = titleLabel2.fontSize
        titleLabel3.position = CGPoint(x: frameWidth-(titleLabel3.frame.width/2)-(frameBorder/2), y: frameCenterHeight-(titleLabel3.frame.height*2))
        titleLabel3.fontColor = pinkColor
        titleView.addChild(titleLabel3)
        
        
        let playButtonShapeWidth: CGFloat = 300
        let playButtonShapeHeight: CGFloat = 130
        let playButtonShape = SKShapeNode(rect: CGRect(x: frameCenterWidth-(playButtonShapeWidth/2), y: 0+frameBorder, width: playButtonShapeWidth, height: playButtonShapeHeight))
        playButtonShape.fillColor = pinkColor
        playButtonShape.strokeColor = UIColor(white: 1, alpha: 1)
        playButtonShape.name = "playButtonShape"
        titleView.addChild(playButtonShape)
        
        let playLabel = createSKLabelNode(text: "PLAY", x: frameCenterWidth, y: (playButtonShapeHeight/2)+frameBorder)
        playLabel.fontSize = 40
        playLabel.name = "playLabel"
        titleView.addChild(playLabel)
        
        
        
        self.addChild(titleView)
    }
    func loadInstructionsView() {
        let titleLabel1 = createSKLabelNode(text: "Welcome to \"Strong Female Character\"", width: frameWidth-frameBorder, height: frameHeight-frameBorder)
        titleLabel1.position = CGPoint(x: frameCenterWidth, y: frameCenterHeight+(titleLabel1.frame.height*2))
        instructionsView.addChild(titleLabel1)
        
        
        self.addChild(instructionsView)
    }
    
    func stateChangeNext() {
        switch state {
            case 0:
                titleView.removeFromParent()
                loadInstructionsView()
            default:
                return;
        }
        
        state++
    }
    
    
    //////////////////////////////////////////
    //          Helper Functions            //
    //////////////////////////////////////////
    func adjustLabelFontSizeToFitRect(labelNode labelNode:SKLabelNode, rect:CGRect, extraScale: CGFloat) {
        //http://stackoverflow.com/questions/30980918/how-to-set-font-size-of-sklabelnode-to-fit-in-fixed-size-swift
        
        // Determine the font scaling factor that should let the label text fit in the given rectangle.
        let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
        
        // Change the fontSize.
        labelNode.fontSize *= (scalingFactor * extraScale)
        
        // Optionally move the SKLabelNode to the center of the rectangle.
        //labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
    }
    
    func createSKLabelNode(text text: String) -> SKLabelNode {
        return createSKLabelNode(text: text, x: frameCenterWidth, y: frameCenterHeight)
    }
    func createSKLabelNode(text text: String, x: CGFloat, y: CGFloat) -> SKLabelNode {
        return createSKLabelNode(text: text, x: x, y: y, width: frameWidth, height: frameHeight)
    }
    func createSKLabelNode(text text: String, width: CGFloat, height: CGFloat) -> SKLabelNode {
        return createSKLabelNode(text: text, x: frameCenterWidth, y: frameCenterHeight, width: width, height: height)
    }
    
    func createSKLabelNode(text text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> SKLabelNode {
        let stubLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        stubLabel.text = text
        stubLabel.fontSize = 45
        stubLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        stubLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        stubLabel.position = CGPoint(x: x, y: y)
        adjustLabelFontSizeToFitRect(labelNode: stubLabel, rect:CGRect(x: 0, y: 0, width: width, height: height), extraScale: 1)
        
        return stubLabel
    }
    func getUIColor(r r: CGFloat, g: CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
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
                    print("Touched")
                    stateChangeNext()
                }
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}

