//
//  GenericsBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 09/05/24.
//

import SwiftUI

struct Storage<T> {
    var item: T?
    
    
    func removeAll() -> Storage {
        Storage(item: nil)
    }
}


struct CustomViewExample<T: View>: View {
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text("Custom View Generic \(title)")
            content
        }
        
    }
}

struct GenericsBootcamp: View {
    
    var coffee: Storage? = Storage(item: "Kopi kapal api enak")
    var number: Storage? = Storage(item: 029103192031)
    
    var body: some View {
        
        VStack {
            Text(coffee?.item?.uppercased() ?? "Item empty")
            
            CustomViewExample(
                content: Text("Ini contoh"),
                title: "Rizal"
            )
        }
    }
}

#Preview {
    GenericsBootcamp()
}
