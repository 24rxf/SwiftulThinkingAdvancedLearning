//
//  ViewModifiersBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 03/05/24.
//

import SwiftUI


struct DefaultButton: ViewModifier {
    
    var bgColor: Color = .red
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(bgColor)
            .clipShape(.rect(cornerRadius: 12))
            .padding(.horizontal, 20)
    }
}

extension View {
    func defaultButton() ->  some View {
        self.modifier(DefaultButton())
    }
}

struct ViewModifiersBootcamp: View {
    var body: some View {
        
        Text("Text text 1")
            .modifier(DefaultButton())
        
        Text("Text text 2")
            .defaultButton()
        
        
        Text("Text text 3")
            .modifier(DefaultButton(bgColor: .green))
    }
}

#Preview {
    ViewModifiersBootcamp()
}
