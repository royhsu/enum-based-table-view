//
//  Cuisine.swift
//  Demo
//
//  Created by Roy Hsu on 2018/8/16.
//  Copyright © 2018 TinyWorld. All rights reserved.
//

// MARK: - Cuisine

enum Cuisine {
    
    case american
    
    case italian
    
    case japanese
    
    case taiwanese
    
}

// MARK: - CustomStringConvertible

extension Cuisine: CustomStringConvertible {
    
    var description: String {
        
        switch self {
            
        case .american: return "美式"
            
        case .italian: return "義式"
            
        case .japanese: return "日式"
            
        case .taiwanese: return "台式"
            
        }
        
    }
    
}
