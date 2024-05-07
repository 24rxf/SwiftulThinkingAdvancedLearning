//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 07/05/24.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State var isClcik = false
    @Namespace var namespace
    @Namespace var selectedItem
    
    var tabs = ["Home", "Search", "Profile"]
    @State var tab = "Home"
    
    var body: some View {
        VStack {
            HStack {
                ForEach(tabs, id: \.self) { item in
                    ZStack {
                        if tab == item {
                            Text(item)
                                .padding()
                                .background(.red)
                                .matchedGeometryEffect(id: "tabBar", in: selectedItem)
                        } else {
                            Text(item)
                                .foregroundStyle(.black)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        tab = item
                    }
                }
            }
            .frame(height: 40)
            
            if isClcik {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 140, height: 140)
                    .matchedGeometryEffect(id: "box", in: namespace)
            }
            
            Spacer()
            
            
            if !isClcik {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 140, height: 140)
                    .matchedGeometryEffect(id: "box", in: namespace)
                
            }
            
          
            
        }.onTapGesture {
            withAnimation(.bouncy) {
                isClcik.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectBootcamp()
}
