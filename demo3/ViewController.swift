//
//  ViewController.swift
//  demo3
//
//  Created by Andrickson Coste on 3/6/21.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    //SceneKit outlet
    @IBOutlet weak var sceneView: SCNView!
    
    //MARK: - Loading the object
    let scene = SCNScene(named: "iPhone 12 Box.dae")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Add camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        //MARK: - Place camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        

        //MARK: - Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)

//        // 5: Adding light to scene
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
//        scene?.rootNode.addChildNode(lightNode)
        
        //MARK: - Creating and adding ambient light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        
        //MARK: - Enabling auto lights
        sceneView.autoenablesDefaultLighting = true
        
        //MARK: - Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        sceneView.cameraControlConfiguration.autoSwitchToFreeCamera = false
        sceneView.cameraControlConfiguration.rotationSensitivity = 0.2
        sceneView.cameraControlConfiguration.panSensitivity = 0.1
        sceneView.cameraControlConfiguration.flyModeVelocity = 0.1
        sceneView.cameraControlConfiguration.rotationSensitivity = 0.1
        
        //MARK: - Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        sceneView.backgroundColor = .clear
        
        //MARK: - Set scene settings
        sceneView.scene = scene
        
    }
}
