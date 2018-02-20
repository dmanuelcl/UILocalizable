//
//  UIViewController+UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel Céspedes Lara on 2/20/18.
//

import UIKit

public extension UIViewController{

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


