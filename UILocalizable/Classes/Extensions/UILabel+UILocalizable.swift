//
//  UILabel+UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UILabel{

    fileprivate struct associatedKeys {
        static var localizedText: String = "localizedText"
    }

     @IBInspectable public var localizedText: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedText){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.localizedText, value: value)
            guard let value = value else {return}
            let text = value.localized
            self.text = text
        }
    }
}
