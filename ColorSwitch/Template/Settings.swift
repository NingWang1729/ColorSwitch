//
//  Settings.swift
//  ColorSwitch
//
//  Created by Ning Wang on 8/12/21.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0x0
    static let ballCategory: UInt32 = 0x1 // 01
    static let switchCategory: UInt32 = 0x1 << 1 // 10
}
