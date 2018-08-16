//
//  RestaurantDetailInformationTableViewCell.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/15.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantDetailInformationTableViewCell

import UIKit

class RestaurantDetailInformationTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()

    let contentLabel = UILabel()
    
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
                titleLabel,
                contentLabel
            ]
        )

        stackView.axis = .vertical

        stackView.spacing = 8.0

        let constraints = wrapSubview(stackView)

        constraints.leadingConstraint.constant = -20.0

        constraints.trailingConstraint.constant = 10.0

        constraints.bottomConstraint.constant = 8.0
        
        titleLabel.widthAnchor.constraint(equalToConstant: 80.0)
        
        titleLabel.textColor = .lightGray
        
        titleLabel.font = .preferredFont(forTextStyle: .caption1)

        contentLabel.textColor = .darkGray
        
        contentLabel.font = .preferredFont(forTextStyle: .body)
        
        contentLabel.numberOfLines = 0
        
        selectionStyle = .none

    }
    
}
