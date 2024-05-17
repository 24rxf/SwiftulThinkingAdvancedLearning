//
//  AppNavBarView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            Text("Page 1")
            CustomNavLinkView(destination: SecondAppNavBarView()) {
                Text("Button to second view")
            }
            .setCustomNav(title: "First View", hide: true)
        }
       
    }
}

struct SecondAppNavBarView: View {
    var body: some View {
        VStack {
            Text("Page 2")
            .setCustomNav(title: "Second View", subtitle:  "Subtitle Second View" ,hide: false)
        }
       
    }
}

#Preview {
    AppNavBarView()
}
