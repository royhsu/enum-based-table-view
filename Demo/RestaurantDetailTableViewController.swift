//
//  RestaurantDetailTableViewController.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/15.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantDetailTableViewController

import UIKit
import MapKit

class RestaurantDetailTableViewController: UITableViewController {
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        tableView.register(
            RestaurantDetailHeaderTableViewCell.self,
            forCellReuseIdentifier: "RestaurantDetailHeaderTableViewCell"
        )
        
        tableView.register(
            RestaurantDetailInformationTableViewCell.self,
            forCellReuseIdentifier: "RestaurantDetailInformationTableViewCell"
        )
        
        tableView.register(
            RestaurantDetailMapTableViewCell.self,
            forCellReuseIdentifier: "RestaurantDetailMapTableViewCell"
        )
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 3 }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int {
        
        switch section {
            
        case 0, 2: return 1
            
        case 1: return 3
            
        default: fatalError("Invalid section.")
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "RestaurantDetailHeaderTableViewCell",
                for: indexPath
            ) as! RestaurantDetailHeaderTableViewCell
            
            cell.nameLabel.text = restaurant?.name
            
            cell.cuisineLabel.text = restaurant?.cuisine.description
            
            return cell
            
        case 1:
            
            switch indexPath.row {
                
            case 0:
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailInformationTableViewCell",
                    for: indexPath
                ) as! RestaurantDetailInformationTableViewCell
                
                cell.titleLabel.text = "聯絡電話"
                
                cell.contentLabel.text = restaurant?.phoneNumber
                
                return cell
                
            case 1:
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailInformationTableViewCell",
                    for: indexPath
                ) as! RestaurantDetailInformationTableViewCell
                
                cell.titleLabel.text = "營業時間"
                
                cell.contentLabel.text = restaurant?.businessHours
                
                return cell
                
            case 2:
                
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailInformationTableViewCell",
                    for: indexPath
                ) as! RestaurantDetailInformationTableViewCell
                
                cell.titleLabel.text = "店家地址"
                
                cell.contentLabel.text = restaurant?.address
                
                return cell
                
            default: fatalError("Invalid row.")
                
            }
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "RestaurantDetailMapTableViewCell",
                for: indexPath
            ) as! RestaurantDetailMapTableViewCell
            
            cell.mapView.removeAnnotations(cell.mapView.annotations)
            
            if let coordinate = restaurant?.coordinate {
            
                cell.mapView.setCenter(
                    coordinate,
                    animated: false
                )
                
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = coordinate
                
                cell.mapView.addAnnotation(annotation)
                
            }
            
            return cell
            
        default: fatalError("Invalid section.")
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    )
    -> CGFloat {
        
        switch indexPath.section {
            
        case 0, 1: return UITableView.automaticDimension
            
        case 2: return 200.0
            
        default: fatalError("Invalid section.")
            
        }
        
    }
    
}
