//
//  ReusableCell+FileRepresentable.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/18.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - FileRepresentable

extension ReusableCell where Self: FileRepresentable {
    
    static var filename: String { return identifier }
    
}
