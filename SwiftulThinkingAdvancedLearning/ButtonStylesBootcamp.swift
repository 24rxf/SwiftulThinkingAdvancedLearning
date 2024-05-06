//
//  ButtonStylesBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 06/05/24.
//

import SwiftUI


struct PressableButtonCustom: ButtonStyle {
    
    var scaleAmount: CGFloat = 0.9
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .foregroundStyle(.blue)
            .scaleEffect(configuration.isPressed ? scaleAmount: 1.0)
            .opacity(configuration.isPressed ? 0.3: 1.0)
    }
    
}

extension View {
    func defaultFormatButton() -> some View {
        self
            .foregroundStyle(.blue)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.red)
            .clipShape(.rect(cornerRadius: 12))
    }
}

struct ButtonStylesBootcamp: View {
    var body: some View {
        
        Button(
            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
            label: {
                Text("Button")
                    .font(.headline)
                    .defaultFormatButton()
            }
        )
        .buttonStyle(PressableButtonCustom())
        .padding(.horizontal)
        
    }
}

#Preview {
    ButtonStylesBootcamp()
}
