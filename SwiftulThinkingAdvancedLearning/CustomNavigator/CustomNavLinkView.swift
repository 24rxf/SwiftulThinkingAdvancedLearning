//
//  CustomNavLinkView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import SwiftUI

struct CustomNavLinkView<Label: View, Destination: View>: View {
    
    let destination: Destination
    @ViewBuilder let label: Label
    
    var body: some View {
        NavigationLink(
            destination: CustomNavBarContainerView {
            destination
                    .toolbar(.hidden, for: .navigationBar)
        }
        ) {
            label
        }
    }
}

#Preview {
    CustomNavLinkView(destination: Text("second 2")) {
        Text("label")
    }
}
