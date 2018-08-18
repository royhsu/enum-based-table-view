//
//  UITableView+Dequeue.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/18.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Dequeue

import UIKit

extension UITableView {
    
    func dequeueReusableCell<Cell>(
        _ cellType: Cell.Type,
        for indexPath: IndexPath
    )
    -> Cell
    where
        Cell: UITableViewCell,
        Cell: ReusableCell {
        
        guard
            let cell = dequeueReusableCell(
                withIdentifier: cellType.identifier,
                for: indexPath
            ) as? Cell
        else { fatalError("Please make sure to register \(cellType) before dequeuing one.") }
        
        return cell
            
    }
    
}