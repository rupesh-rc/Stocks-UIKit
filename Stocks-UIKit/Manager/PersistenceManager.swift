//
//  PersistenceMnger.swift
//  Stocks-UIKit
//
//  Created by Rupesh on 17/12/21.
//

import Foundation

final class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    private let userDefaults : UserDefaults = .standard
    
    private init() {}
    
    private struct Constants {
        
    }
    
    
    //MARK: PUBLIC
    public var watchList : [String] {
        return []
    }
    
    public func addToWatchlist() {
        
    }
    
    
    public func removeFromWatchlist() {
        
    }
    
    
    
    
    
    
    //MARK: PRIVATE
    private var hasOnBoarded : Bool {
        return false
    }
    
    
    
}
