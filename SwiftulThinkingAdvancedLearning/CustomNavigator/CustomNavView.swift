//
//  CustomNavView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    
   @ViewBuilder var content: Content
    
    var body: some View {
        NavigationStack {
            CustomNavBarContainerView {
                content
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    CustomNavView() {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("test")
        }
    }
}
