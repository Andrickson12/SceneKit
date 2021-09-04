//
//  ScrollViewViewController.swift
//  demo3
//
//  Created by Andrickson Coste on 3/7/21.
//

import UIKit
import SceneKit


class ScrollViewViewController: UIViewController, UIScrollViewDelegate {
    
    //Outlets
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myScene: SCNView!
    
    //MARK: - Loading the object
    let scene = SCNScene(named: "theRock.dae")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myScrollView.delegate = self
        
        myContentView.backgroundColor = .clear
        
        //MARK: - Add camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        //MARK: - Place camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        
        
        //MARK: - Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)
        
        //MARK: - Creating and adding ambient light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        //MARK: - Enabling auto lights
        myScene.autoenablesDefaultLighting = true
        
        //MARK: - Allow user to manipulate camera
        myScene.allowsCameraControl = true
        myScene.cameraControlConfiguration.autoSwitchToFreeCamera = false
        myScene.cameraControlConfiguration.rotationSensitivity = 0.1
        // myScene.cameraControlConfiguration.panSensitivity = 0.1
        // myScene.cameraControlConfiguration.flyModeVelocity = 0.1
        // myScene.cameraControlConfiguration.rotationSensitivity = 0.1
        
        //MARK: - Allow user translate image
        myScene.cameraControlConfiguration.allowsTranslation = true
        
        // myScene.backgroundColor = .clear
        
        //MARK: - Set scene settings
        myScene.scene = scene
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinchGesture))
        myScene.addGestureRecognizer(pinchRecognizer)
        
        _ = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
       // myScene.addGestureRecognizer(panRecognizer)
        
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesture))
        myScene.addGestureRecognizer(rotationRecognizer)
        
    }
    
    @objc func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.numberOfTouches == 2 {
            // Disable zoom
            print("zoom attempted")
        }
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        if sender.numberOfTouches == 2 {
            // Disable zoom
            print("drag atempted")
        }
    }
    
    @objc func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        if sender.numberOfTouches == 2 {
            // Disable zoom
            print("rotation attempted")
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myContentView
    }
}
