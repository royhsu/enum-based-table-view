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
    
    enum DetailSection {
        
        enum InformationRow {
            
            case phoneNumber, businessHours, address
            
        }
        
        case header
        
        case information(
            rows: [InformationRow]
        )
        
        case map
        
    }
    
    let detailSections: [DetailSection] = [
        .header,
        .information(
            rows: [
                .phoneNumber,
                .businessHours,
                .address
            ]
        ),
        .map
    ]
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        tableView.register(
            RestaurantDetailHeaderTableViewCell.self,
            bundle: nil
        )
        
        tableView.register(RestaurantDetailInformationTableViewCell.self)
        
        tableView.register(RestaurantDetailMapTableViewCell.self)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { return detailSections.count }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int {
        
        let section = detailSections[section]
        
        switch section {
        
        case .header: return 1
            
        case let .information(rows): return rows.count
            
        case .map: return 1
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {
        
        let section = detailSections[indexPath.section]
        
        switch section {
            
        case .header:
            
            let cell = tableView.dequeueReusableCell(
                RestaurantDetailHeaderTableViewCell.self,
                for: indexPath
            )
            
            cell.nameLabel.text = restaurant?.name
            
            cell.cuisineLabel.text = restaurant?.cuisine.description
            
            return cell
            
        case let .information(rows):
            
            let row = rows[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(
                RestaurantDetailInformationTableViewCell.self,
                for: indexPath
            )
            
            switch row {
                
            case .phoneNumber:
                
                cell.titleLabel.text = "聯絡電話"
                
                cell.contentLabel.text = restaurant?.phoneNumber
                
                return cell
                
            case .businessHours:
                
                cell.titleLabel.text = "營業時間"
                
                cell.contentLabel.text = restaurant?.businessHours
                
                return cell
            
            case .address:
                
                cell.titleLabel.text = "店家地址"
                
                cell.contentLabel.text = restaurant?.address
                
                return cell
                
            }
            
        case .map:
            
            let cell = tableView.dequeueReusableCell(
                RestaurantDetailMapTableViewCell.self,
                for: indexPath
            )
            
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
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    )
    -> CGFloat {
        
        let section = detailSections[indexPath.section]
        
        switch section {
        
        case .header: return UITableView.automaticDimension
            
        case .information: return UITableView.automaticDimension
            
        case .map: return 200.0
            
        }
        
    }
    
}
