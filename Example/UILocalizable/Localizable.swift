//
//  Localizable.swift
//  UILocalizable_Example
//
//  Created by Dani Manuel Céspedes Lara on 2/20/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UILocalizable

enum Localizable{

}

extension Localizable{
    enum Labels: String, UILocalizable {
        static var tableName: String = "CustomString"

        case labelFromCode = "label_from_code_key"

        //        //If you need localize from an framework you can use this approach
        //        public var localized: String{
        //            return self.rawValue.localized(bundle: <#FrameworkBundle#>, tableName: <#TableName#>)
        //        }
    }
}
