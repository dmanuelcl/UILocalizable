//
//  UITextField+Localizable.swift
//  localizationTest
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UITextField{

    fileprivate struct associatedKeys {
        static var localizedText: String = "localizedText"
        static var localizedPlaceholder: String = "localizedPlaceholder"
    }

    @IBInspectable var localizedText: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedText){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &associatedKeys.localizedText, value: value)
            guard let value = value else {return}
            let text = value.localizedUI
            self.text = text
        }
    }

    @IBInspectable var localizedPlaceholder: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedPlaceholder){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &associatedKeys.localizedPlaceholder, value: value)
            guard let value = value else {return}
            let placeholder = value.localizedUI
            self.placeholder = placeholder
        }
    }

}
