//
//  UITableView+Register.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/18.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Register

import UIKit

extension UITableView {
    
    func register<Cell>(_ cellType: Cell.Type)
    where
        Cell: UITableViewCell,
        Cell: ReusableCell {
            
        register(
            cellType,
            forCellReuseIdentifier: cellType.identifier
        )
            
    }
    
    func register<Cell>(
        _ cellType: Cell.Type,
        bundle: Bundle?
    )
    where
        Cell: UITableViewCell,
        Cell: ReusableCell,
        Cell: FileRepresentable {
        
        let nib = UINib(
            nibName: cellType.filename,
            bundle: bundle
        )
        
        register(
            nib,
            forCellReuseIdentifier: cellType.identifier
        )
            
    }

}
