//
//  UILocalizable.swift
//  UILocalizable
//
//  Created by Dani Manuel on 10/3/17.
//  Copyright © 2017 Dani Manuel Céspedes Lara (dmanuelcl@gmail.com) . All rights reserved.
//

import Foundation


/// Extract the localization components from UI localizable strings
///
/// - Parameter string: Localizable string component -> ClassToFindBundle:TableName:key:baseLanguage
/// - Returns: Tumple with all localizable components
func localizationInfo(fromString string: String) -> (bundle: Bundle, tableName: String, key: String, baseLanguage: String){
    let defaultLocalizationInfo = (Bundle.main, "Localizable", "", "en")
    let components = string.components(separatedBy: ":")
    guard components.count >= 3 else {
        return defaultLocalizationInfo
    }
    
    let classNameString = components[0]
    let tableNameString = components[1]
    let keyString = components[2]
    var baseLanguage = "en"
    if components.count >= 4{
        let _baseLanguage = components[3]
        if !_baseLanguage.isEmpty {
            baseLanguage = _baseLanguage
        }
    }
    
    var bundle = Bundle.main
    let table = !tableNameString.isEmpty ? tableNameString : "Localizable"
    let key = !keyString.isEmpty ? keyString : ""
    
    if !classNameString.isEmpty, let className = NSClassFromString(classNameString){
        bundle = Bundle(for: className)
    }
    
    return (bundle, table, key, baseLanguage)
}

public extension String {

    public var localized: String{
        let (bundle, tableName, key, baseLanguage) = localizationInfo(fromString: self)
        let localizedText = key.localized(bundle: bundle, tableName: tableName, baseLanguage: baseLanguage, comments: self)
        return localizedText
    }

    func localized(bundle: Bundle = .main, tableName: String? = nil, baseLanguage: String = "en",comments: String = "") -> String{

        var baseValue: String?
        if let path = bundle.path(forResource: baseLanguage, ofType: "lproj"){
            let baseBundle = Bundle(path: path)
            baseValue = baseBundle?.localizedString(forKey: self, value: nil, table: tableName)
        }
        
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: baseValue ?? self, comment: comments)
    }
}

public protocol UILocalizable {
    static var tableName: String { get }
    var localized: String { get }
}

extension UILocalizable where Self: RawRepresentable, Self.RawValue == String{

    public var localized: String {
        return rawValue.localized(tableName: Self.tableName)
    }
}

extension UILocalizable{
    public static var tableName: String {
        return String(describing: Self.self)
    }
}
