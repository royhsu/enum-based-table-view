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
    
    let nameLabel = UILabel()
    
    let cuisineLabel = UILabel()
    
    override init(
        style: CellStyle,
        reuseIdentifier: String?    
    ) {
        
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        prepare()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        prepare()
        
    }
    
    func prepare() {
        
        let stackView = UIStackView(
            arrangedSubviews: [
                nameLabel,
                cuisineLabel
            ]
        )
        
        stackView.axis = .vertical
        
        stackView.spacing = 10.0
        
        let constraints = wrapSubview(stackView)
        
        constraints.leadingConstraint.constant = -20.0
        
        constraints.topConstraint.constant = -10.0
        
        constraints.trailingConstraint.constant = 10.0
        
        constraints.bottomConstraint.constant = 8.0
        
        nameLabel.textColor = .black
        
        nameLabel.font = .systemFont(
            ofSize: 20.0,
            weight: .semibold
        )
        
        nameLabel.numberOfLines = 0
        
        cuisineLabel.textColor = .darkGray
        
        cuisineLabel.font = .systemFont(
            ofSize: 16.0,
            weight: .bold
        )
        
        selectionStyle = .none
        
    }
    
}
