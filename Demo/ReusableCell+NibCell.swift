//
//  ReusableCell+NibCell.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/18.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - NibCell

extension ReusableCell where Self: NibCell {
    
    static var nibName: String { return identifier }
    
}
