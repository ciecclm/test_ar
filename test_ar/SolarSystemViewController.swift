//
//  SolarSystemViewController.swift
//  test_ar
//
//  Created by clm on 2017/12/23.
//  Copyright © 2017年 clm. All rights reserved.
//

import Foundation
import ARKit
import SceneKit

class SolarSystemViewController: UIViewController,ARSCNViewDelegate {
    let arSCNView = ARSCNView()
    let arSession = ARSession()
    let arConfiguration = ARWorldTrackingConfiguration()
    
    let sunNode = SCNNode()
    let moonNode = SCNNode()
    let earthNode = SCNNode()
    let moonRotationNode = SCNNode()//月球围绕地球转动的节点
    let earthGroupNode =  SCNNode()//地球和月球当做一个整体的节点 围绕太阳公转需要
    
    let sunHaloNode = SCNNode()//太阳光晕
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arSession.pause()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arConfiguration.isLightEstimationEnabled = true
        
        arSession.run(arConfiguration, options: [.removeExistingAnchors,.resetTracking])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arSCNView.frame = self.view.frame
        
        arSCNView.session = arSession
        arSCNView.automaticallyUpdatesLighting = true
        
        self.view.addSubview(arSCNView)
        
        arSCNView.delegate = self
        
        self.initNode()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func initNode()  {
        //1.设置几何
        sunNode.geometry = SCNSphere(radius: 3)
        earthNode.geometry = SCNSphere(radius: 1)
        moonNode.geometry = SCNSphere(radius: 0.5)
        //2.渲染图
        sunNode.geometry?.firstMaterial?.multiply.contents = "solar.scnassets/earth/sun.jpg"
        sunNode.geometry?.firstMaterial?.diffuse.contents = "solar.scnassets/earth/sun.jpg"
        sunNode.geometry?.firstMaterial?.multiply.intensity = 0.5 //強度
        //sunNode.geometry?.firstMaterial?.lightingModel = SCNMaterial.LightingModel.constant
        
        earthNode.geometry?.firstMaterial?.diffuse.contents = "solar.scnassets/earth/earth-diffuse-mini.jpg"
        moonNode.geometry?.firstMaterial?.diffuse.contents = "solar.scnassets/earth/moon.jpg"
        //3.设置位置
        
        sunNode.position = SCNVector3(0, 5, -20)
        earthGroupNode.position = SCNVector3(10,0,0)
        earthNode.position = SCNVector3(3,0,0)
        moonRotationNode.position = earthNode.position
        moonNode.position = SCNVector3(3,0,0)
        //4
        
        moonRotationNode.addChildNode(moonNode)
        earthGroupNode.addChildNode(earthNode)
        earthGroupNode.addChildNode(moonRotationNode)
        
        sunNode.addChildNode(earthGroupNode)
        
        self.arSCNView.scene.rootNode.addChildNode(sunNode)
    }
    
}
