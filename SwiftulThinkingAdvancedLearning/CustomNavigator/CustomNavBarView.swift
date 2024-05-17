//
//  CustomNavBarView.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import SwiftUI

struct CustomNavBarView: View {
    @Environment(\.dismiss) var dismiss
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            backButton
                .opacity(0.0)
            
        }
        .padding()
        .tint(.white)
        .foregroundStyle(.white)
        .background(Color.blue.ignoresSafeArea())
    }
}

extension CustomNavBarView {
    var backButton: some View {
        Button(
            action: {
                dismiss()
            },
            label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
            }
        )
    }
    
    var titleSection: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle {
                Text(subtitle)
            }
            
        }
    }
}

#Preview {
    VStack {
//        CustomNavBarView()
        Spacer()
    }
}
