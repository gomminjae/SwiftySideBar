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
        view.addSubview(SwiftycSideBar())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

