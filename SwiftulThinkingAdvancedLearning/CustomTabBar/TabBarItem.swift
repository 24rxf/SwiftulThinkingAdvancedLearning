//
//  TabBarItem.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import Foundation
import SwiftUI


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}


enum TabBarItem: Hashable {
    case Home
    case Favorite
    case Profile
    
    var iconName: String {
        switch self {
        case .Home:
            "house"
        case .Favorite:
            "heart"
        case .Profile:
            "person"
        }
    }
    
    var title: String {
        switch self {
        case .Home:
            "Home"
        case .Favorite:
            "Favorite"
        case .Profile:
            "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .Home:
                .green
        case .Favorite:
                .yellow
        case .Profile:
                .red
        }
    }
}
