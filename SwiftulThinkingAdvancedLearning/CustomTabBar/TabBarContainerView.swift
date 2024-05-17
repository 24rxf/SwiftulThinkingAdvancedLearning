//
//  TabBarContainerView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI

struct TabBarContainerView<Content: View>: View {
    
    
    @Binding var selection: TabBarItem
    let content: Content
    @State var tabs: [TabBarItem] =  [.Home, .Favorite, .Profile,]
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () ->  Content) {
        self._selection = selection
        self.content = content()
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            
            ZStack {
                content
                    .ignoresSafeArea()
            }
          
            
            CustomTabBarBootcamp(tabs: tabs, selected: $selection)
        }
        .onPreferenceChange(TabBarPrefrenceKey.self, perform: { value in
            tabs = value
        })
       
    }
}

#Preview {
    TabBarContainerView(selection: .constant(.Home)) {
        Color.red
    }
}
