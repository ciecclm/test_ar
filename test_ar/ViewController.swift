//
//  ViewController.swift
//  test_ar
//
//  Created by clm on 2017/12/23.
//  Copyright © 2017年 clm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func GoToAr(_ sender: UIButton) {
        self.present(SolarSystemViewController(),animated: true,completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

