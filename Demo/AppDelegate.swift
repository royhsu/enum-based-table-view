//
//  AppDelegate.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/15.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - AppDelegate

import CoreLocation
import UIKit

@UIApplicationMain
public final class AppDelegate: UIResponder {
    
    public final let window = UIWindow(frame: UIScreen.main.bounds)
    
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    
    public final func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
    -> Bool {
        
        let restaurantDetailViewController = RestaurantDetailTableViewController()
        
        restaurantDetailViewController.restaurant = Restaurant(
            name: "鼎泰豐 (信義總店)",
            cuisine: .taiwanese,
            phoneNumber: "02-2321-8928",
            businessHours: "平日 10:00 ~ 21:00\n假日 09:00 ~ 21:00",
            address: "106 台北市大安區信義路二段 194 號",
            coordinate: CLLocationCoordinate2D(
                latitude: 25.0334878,
                longitude: 121.5279233
            )
        )
        
        window.rootViewController = restaurantDetailViewController
        
        window.makeKeyAndVisible()
        
        return true
            
    }
    
}
