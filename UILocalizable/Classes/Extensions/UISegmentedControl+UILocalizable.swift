//
//  UISegmentedControl+UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//


import UIKit

public extension UISegmentedControl{

    fileprivate struct associatedKeys {
        static var localizedTitles: String = "localizedTitles"
    }

    @IBInspectable public var localizedTitles: String?{
        get{
            return associatedObject(base: self, key: &associatedKeys.localizedTitles){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.localizedTitles, value: value)
            guard let titlesString = value else {return}
            let titles = titlesString.components(separatedBy: ",")
            for i in 0 ..< titles.count{
                guard i < self.numberOfSegments else{
                    return
                }
                let title = titles[i].localized
                self.setTitle(title, forSegmentAt: i)
            }
        }
    }
}

