//
//  TabBarPrefrenceKey.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import Foundation
import SwiftUI


struct TabBarPrefrenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
    typealias Value = [TabBarItem]
    
}


struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: TabBarPrefrenceKey.self, value: [tab])
    }
}


extension View {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
