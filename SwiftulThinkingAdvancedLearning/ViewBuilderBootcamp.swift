//
//  ViewBuilderBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI


struct HeaderViewGenerics<T: View>: View {
    let title: String
    let content: T
    
    init(title: String,@ViewBuilder  content: () -> T) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
      
    }
}
struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewGenerics(title: "Login page") {
                Text("test")
            }
            
            HeaderViewGenerics(title: "Second page") {
                HStack {
                    Image(systemName: "eraser.fill")
                    Text("eraser")
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ViewBuilderBootcamp()
}
