//
//  ReusableCell.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/18.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - ReusableCell

protocol ReusableCell {
    
    static var identifier: String { get }
    
}

// MARK: - Default Implementation

extension ReusableCell {
    
    static var identifier: String { return String(describing: self) }
    
}
