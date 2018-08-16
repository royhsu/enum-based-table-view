//
//  RestaurantDetailMapTableViewCell.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/16.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantDetailMapTableViewCell

import UIKit
import MapKit

class RestaurantDetailMapTableViewCell: UITableViewCell {
    
    let mapView = MKMapView()
    
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
        
        contentView.wrapSubview(mapView)
        
        selectionStyle = .none
        
    }
    
}
