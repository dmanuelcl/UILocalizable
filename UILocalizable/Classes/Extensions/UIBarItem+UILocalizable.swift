//
//  UIBarItem+UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UIBarItem{

    fileprivate struct associatedKeys {
        static var localizedTitle: String = "localizedTitle"
    }

    @IBInspectable public var localizedTitle: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedTitle){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.localizedTitle, value: value)
            guard let value = value else {return}
            self.title = value.localized
        }
    }
    
}

