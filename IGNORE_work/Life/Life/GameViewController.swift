//
//  GameViewController.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright (c) 2016 Kode Studios. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // create notifications for application resign and active.  This will call those
        // functions (inside of this class) then the app is exited an started again.  This
        // persists throughout the app, no matter the scene
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
            name: UIApplicationWillResignActiveNotification,
            object: UIApplication.sharedApplication())
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: #selector(UIApplicationDelegate.applicationDidBecomeActive(_:)),
            name: UIApplicationDidBecomeActiveNotification,
            object: UIApplication.sharedApplication())
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        // Configure the view
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // Sprite Kit applies additional optimizations to improve rendering performance
        skView.ignoresSiblingOrder = true
        

        // create the items
        loadOriginData()
        
        
        //deleteLoadedItems()
        //loadItemsFromDisk()
        // resetData()

        
        // set the base scene properties
        SceneBase.sceneScale = UIScreen.mainScreen().scale
        SceneBase.sceneSize = CGSizeMake(skView.frame.size.width*SceneBase.sceneScale,skView.frame.size.height*SceneBase.sceneScale)
        width = SceneBase.sceneSize.width
        height = SceneBase.sceneSize.height

        
        // get scene file
        // multiple options here for quick switching between stages
        //let scene = SceneStart()
        let scene = SceneInfancy()
        
        // Configure the scene
        scene.scaleMode = .AspectFill
        scene.size = SceneBase.sceneSize
        
        // final present scene
        skView.presentScene(scene)
 
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
