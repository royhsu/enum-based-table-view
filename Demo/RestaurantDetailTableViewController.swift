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
    
    enum DetailElement {
        
        case header, information, map
        
    }
    
    enum InformationElement {
        
        case phoneNumber, businessHours, address
        
    }
    
    let detailElements: [DetailElement] = [
        .header,
        .information,
        .map
    ]
    
    let informationElements: [InformationElement] = [
        .phoneNumber,
        .businessHours,
        .address
    ]
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int { return detailElements.count }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    )
    -> Int {
        
        let element = detailElements[section]
        
        switch element {
        
        case .header: return 1
            
        case .information: return informationElements.count
            
        case .map: return 1
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    )
    -> UITableViewCell {
        
        let sectionElement = detailElements[indexPath.section]
        
        switch sectionElement {
            
        case .header:
            
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "RestaurantDetailHeaderTableViewCell",
                    for: indexPath
                ) as? RestaurantDetailHeaderTableViewCell
            else { fatalError("Please make sure to register RestaurantDetailHeaderTableViewCell.") }
            
            cell.nameLabel.text = restaurant?.name
            
            cell.cuisineLabel.text = restaurant?.cuisine.description
            
            return cell
            
        case .information:
            
            let rowElement = informationElements[indexPath.row]
            
            switch rowElement {
                
            case .phoneNumber:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "聯絡電話"
                
                cell.contentLabel.text = restaurant?.phoneNumber
                
                return cell
                
            case .businessHours:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "營業時間"
                
                cell.contentLabel.text = restaurant?.businessHours
                
                return cell
            
            case .address:
                
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: "RestaurantDetailInformationTableViewCell",
                        for: indexPath
                    ) as? RestaurantDetailInformationTableViewCell
                else { fatalError("Please make sure to register RestaurantDetailInformationTableViewCell.") }
                
                cell.titleLabel.text = "店家地址"
                
                cell.contentLabel.text = restaurant?.address
                
                return cell
                
            }
            
        case .map:
            
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
            
        }
            
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    )
    -> CGFloat {
        
        let element = detailElements[indexPath.section]
        
        switch element {
        
        case .header: return UITableView.automaticDimension
            
        case .information: return UITableView.automaticDimension
            
        case .map: return 200.0
            
        }
        
    }
    
}
