//
//  ViewController.swift
//  UILocalizable
//
//  Created by Dani Manuel Céspedes Lara on 11/26/2017.
//  Copyright (c) 2017 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = Localizable.Labels.labelFromCode.localized
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

