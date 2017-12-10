//
//  ObjCWrappers.swift
//  UILocalizable
//
//  Created by Dani Manuel on 3/11/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import Foundation

/**
 Gets the Obj-C reference for the instance object within the UIView extension.
 - Parameter base: Base object.
 - Parameter key: Memory key pointer.
 - Parameter initializer: Object initializer.
 - Returns: The associated reference for the initializer object.
 */
func associatedObject<T: Any>(base: Any, key: UnsafePointer<String>, initializer: () -> T) -> T {
    if let value = objc_getAssociatedObject(base, key) as? T {
        return value
    }

    let value = initializer()
    associateObject(base: base, key: key, value: value)
    return value
}

/**
 Sets the Obj-C reference for the instance object within the UIView extension.
 - Parameter base: Base object.
 - Parameter key: Memory key pointer.
 - Parameter value: The object instance to set for the associated object.
 - Returns: The associated reference for the initializer object.
 */
func associateObject<T: Any>(base: Any, key: UnsafePointer<String>, value: T) {
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
}
