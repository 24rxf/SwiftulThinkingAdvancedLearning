//
//  AppTabBarBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI

struct AppTabBarBootcamp: View {
    
    @State var tabSelection: TabBarItem = .Home
    
    var body: some View {
        tabBarCustom1
    }
    
    
    var tabBarCustom1: some View {
        TabBarContainerView(selection: $tabSelection) {
            Color.green
                .tabBarItem(tab: .Home, selection: $tabSelection)
            
            Color.yellow
                .tabBarItem(tab: .Favorite, selection: $tabSelection)
            
            
            Color.red
                .tabBarItem(tab: .Profile, selection: $tabSelection)
        }
    }
}

#Preview {
    AppTabBarBootcamp()
}
