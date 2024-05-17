//
//  CustoNavBarContainerView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    
    

    @State var showBackButton: Bool = false
    @State var title: String = "Title"
    @State var subtitle: String? = "Subtitle"
    
    
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(TitlePreferenceKey.self, perform: { value in
            self.title = value
        })
        .onPreferenceChange(SubtitlePreferenceKey.self, perform: { value in
            self.subtitle = value
        })
        .onPreferenceChange(HideBackButtonPreferenceKey.self, perform: { value in
            self.showBackButton = value
        })
    }
}

#Preview {
    CustomNavBarContainerView() {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("test")
        }
    }
}
