//
//  UIButton+UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UIButton{

    fileprivate struct associatedKeys {
        static var localizedTitle: String = "localizedTitle"
        static var localizedHighlightedTitle: String = "localizedHighlightedTitle"
        static var localizedSelectedTitle: String = "localizedSelectedTitle"
        static var localizedDisabledTitle: String = "localizedDisabledTitle"
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
            let title = value.localized
            self.setTitle(title, for: UIControlState.normal)
        }
    }

    @IBInspectable public var localizedHighlightedTitle: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedHighlightedTitle){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &associatedKeys.localizedHighlightedTitle, value: value)
            guard let value = value else {return}
            let title = value.localized
            self.setTitle(title, for: .highlighted)
        }
    }

    @IBInspectable public var localizedSelectedTitle: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedSelectedTitle){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &associatedKeys.localizedSelectedTitle, value: value)
            guard let value = value else {return}
            let title = value.localized
            self.setTitle(title, for: .selected)
        }
    }

    @IBInspectable public var localizedDisabledTitle: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedDisabledTitle){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &associatedKeys.localizedDisabledTitle, value: value)
            guard let value = value else {return}
            let title = value.localized
            self.setTitle(title, for: .disabled)
        }
    }
}

