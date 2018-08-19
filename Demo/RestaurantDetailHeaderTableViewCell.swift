//
//  RestaurantDetailHeaderTableViewCell.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/15.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantDetailHeaderTableViewCell

import UIKit

class RestaurantDetailHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet
    weak var nameLabel: UILabel!
    
    @IBOutlet
    weak var cuisineLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        selectionStyle = .none
        
    }
    
}

// MARK: - ReusableCell

extension RestaurantDetailHeaderTableViewCell: ReusableCell { }

// MARK: - NibCell

extension RestaurantDetailHeaderTableViewCell: NibCell { }
