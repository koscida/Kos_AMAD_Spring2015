//
//  GameViewController.swift
//  Girl_Game
//
//  Created by Brittany Kos on 4/6/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
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
                let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameLevelScene
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

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create notifications for application resign and active.  This will call those
        // functions (inside of this class) then the app is exited an started again.  This
        // persists throughout the app, no matter the scene
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "applicationWillResignActive:",
            name: UIApplicationWillResignActiveNotification,
            object: UIApplication.sharedApplication())
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "applicationDidBecomeActive:",
            name: UIApplicationDidBecomeActiveNotification,
            object: UIApplication.sharedApplication())

        
        
        /*
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // Sprite Kit applies additional optimizations to improve rendering performance
        skView.ignoresSiblingOrder = true
        
        
        // get scene file
        //let scene = GameIntroScene.unarchiveFromFile("GameIntroScene") as? GameIntroScene   // intro
        
        // Set the scale mode to scale to fit the window
        scene!.scaleMode = .AspectFill
        //scene!.scaleMode = .ResizeFill
        
        skView.presentScene(scene)
*/

        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        // Configure the view
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // Sprite Kit applies additional optimizations to improve rendering performance
        skView.ignoresSiblingOrder = true
        
        
        // get scene file
        //let scene = GameIntroScene(size: view.frame.size)
        //let scene = GameCharacterCreationScene(size: view.frame.size)
        let scene = GameLevel1Scene(size: view.frame.size)
        
        // get scaling factor
        let scale:CGFloat = UIScreen.mainScreen().scale;
        let size = CGSizeMake(skView.frame.size.width*scale, skView.frame.size.height*scale)
        
        // Configure the scene
        scene.scaleMode = .AspectFill
        scene.size = size
        
        
        // final present scene
        skView.presentScene(scene)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    
    func applicationWillResignActive(notification: NSNotification) {
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        
    }

    
    
    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.Landscape
            //return .AllButUpsideDown
        } else {
            return UIInterfaceOrientationMask.Landscape
        }
    }

    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}
