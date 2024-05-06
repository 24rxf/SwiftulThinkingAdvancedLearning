//
//  AnyTransitionsBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 06/05/24.
//

import SwiftUI

struct RotateViewModifiers: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width: 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifiers(rotation: 180), identity: RotateViewModifiers(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        AnyTransition.modifier(active: RotateViewModifiers(rotation: rotation), identity: RotateViewModifiers(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(insertion: .rotating, removal: .move(edge: .leading))
    }
}

struct AnyTransitionsBootcamp: View {
    @State var showTransition: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            if showTransition {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 500)
                    .padding(.horizontal, 40)
                    .transition(.rotateOn)
            }
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut(duration: 4)) {
                    showTransition.toggle()
                }
            }, label: {
                Text("Button")
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(.rect(cornerRadius: 12))
                    .padding(.horizontal, 40)
                    
            })
        }
        
    }
}

#Preview {
    AnyTransitionsBootcamp()
}
