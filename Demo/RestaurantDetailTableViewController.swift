//
//  RestaurantDetailTableViewController.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/15.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - RestaurantDetailTableViewController

import MapKit
import UIKit

class RestaurantDetailTableViewController: UITableViewController {
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        // Header cell.
        tableView.register(
            UINib(
                nibName: "RestaurantDetailHeaderTableViewCell",
                bundle: nil
            ),
            forCellReuseIdentifier: "RestaurantDetailHeaderTableViewCell"
        )
        
        // Information cell.
        tableView.register(
            RestaurantDetailInformationTableViewCell.self,
            forCellReuseIdentifier: "RestaurantDetailInformationTableViewCell"
        )
        
        // Map cell.
        tableView.register(
            RestaurantDetailMapTableViewCell.self,
            forCellReuseIdentifier: "RestaurantDetailMapTableViewCell"
        )
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // Header. Information. Map.
        return 3
        
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int {
        
        switch section {
            
        // Header.
        case 0: return 1
            
        // Information.
        case 1: return 3
            
        // Map.
        case 2: return 1
            
        default: fatalError("Invalid section.")
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {
        
        switch indexPath.section {
            
        // Header.
        case 0:
            
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailHeaderTableViewCell",
                    for: indexPath
                ) as? RestaurantDetailHeaderTableViewCell
            else { fatalError("Please make sure to register RestaurantDetailHeaderTableViewCell.") }
            
            cell.nameLabel.text = restaurant?.name
            
            cell.cuisineLabel.text = restaurant?.cuisine.description
            
            return cell
            
        // Information.
        case 1:
            
            switch indexPath.row {
                
            // Phone number.
            case 0:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "聯絡電話"
                
                cell.contentLabel.text = restaurant?.phoneNumber
                
                return cell
                
            // Business hours.
            case 1:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "營業時間"
                
                cell.contentLabel.text = restaurant?.businessHours
                
                return cell
            
            // Address.
            case 2:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "店家地址"
                
                cell.contentLabel.text = restaurant?.address
                
                return cell
                
            default: fatalError("Invalid row.")
                
            }
            
        // Map.
        case 2:
            
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailMapTableViewCell",
                    for: indexPath
                ) as? RestaurantDetailMapTableViewCell
            else { fatalError("Please make sure to register RestaurantDetailMapTableViewCell.") }
            
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
            
        // Header.
        case 0: return UITableView.automaticDimension
            
        // Information.
        case 1: return UITableView.automaticDimension
            
        // Map.
        case 2: return 200.0
            
        default: fatalError("Invalid section.")
            
        }
        
    }
    
}
