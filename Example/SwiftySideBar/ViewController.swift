//
//  ViewController.swift
//  SwiftySideBar
//
//  Created by gomminjae on 05/10/2023.
//  Copyright (c) 2023 gomminjae. All rights reserved.
//

import UIKit
import SwiftySideBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sideBar)
        
        sideBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sideBar.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        sideBar.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sideBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
                    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var sideBar: SwiftycSideBar = {
        let bar = SwiftycSideBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.backgroundColor = .red
        return bar
    }()
}

