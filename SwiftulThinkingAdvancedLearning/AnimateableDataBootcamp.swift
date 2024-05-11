//
//  AnimateableDataBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 09/05/24.
//

import SwiftUI


struct BoxBootcamp: Shape {
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get {
            cornerRadius
        }
        
        set {
            cornerRadius = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct AnimateableDataBootcamp: View {
    
    @State var valueCorner = 40
    @State var start = false
    
    var body: some View {
        
        BoxBootcamp(cornerRadius: start ? 0: 60)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation(.easeInOut.repeatForever()) {
                    start.toggle()
                }
            }
    }
}

#Preview {
    AnimateableDataBootcamp()
}
