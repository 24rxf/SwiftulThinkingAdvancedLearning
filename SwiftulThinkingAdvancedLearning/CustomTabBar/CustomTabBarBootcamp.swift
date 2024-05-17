//
//  CustomTabBarBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI

struct CustomTabBarBootcamp: View {
    
    let tabs: [TabBarItem]
    
    @Binding var selected: TabBarItem
    
    @Namespace var namespace
    
    var body: some View {
        
        tabBarV2
        
    }
}

#Preview {
    
    CustomTabBarBootcamp(tabs: [.Home, .Favorite, .Profile,], selected: .constant(.Home))
}



extension CustomTabBarBootcamp {
    
    func tabView(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(selected == tab ?tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selected == tab ? tab.color.opacity(0.2) : Color.clear)
        .clipShape(.rect(cornerRadius: 10))
        .onTapGesture {
            withAnimation(.easeInOut) {
                selected = tab
            }
        }
    }
    
    var tabBarV1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selected = tab
                        }
                    }
            }
        }
        .padding(.vertical, 8)
        .background(Color.white.ignoresSafeArea(), alignment: .bottom)
    }
}

extension CustomTabBarBootcamp {
    
    func tabView2(_ tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundStyle(selected == tab ?tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background {
            if selected == tab {
                RoundedRectangle(cornerRadius: 10)
                    .fill(tab.color.opacity(0.2))
                    .matchedGeometryEffect(id: "tabView2", in: namespace)
            }
        }
        .clipShape(.rect(cornerRadius: 10))
        
    }
    
    var tabBarV2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selected = tab
                        }
                }
            }
        }
        .padding(.all, 8)
        .background(Color.white.ignoresSafeArea(), alignment: .bottom)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}


