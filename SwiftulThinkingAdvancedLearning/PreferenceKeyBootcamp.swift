//
//  PreferenceKeyBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 09/05/24.
//

import SwiftUI

extension View {
    func cutomName(_ value: String) -> some View {
        return self.preference(key: CustomNamePreferenceKey.self, value: value)
    }
}

struct PreferenceKeyBootcamp: View {
    
    @State var name = "Init"
    
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondPreferenceKeyBootcamp(name: name)
            }
            .navigationTitle("Preference Key")
        }
        .onPreferenceChange(CustomNamePreferenceKey.self, perform: { value in
            self.name = value
        })
       
    }
}

struct SecondPreferenceKeyBootcamp: View {
    
    let name: String
    @State var newName = ""
    
    var body: some View {
        Text(name)
            .onAppear {
                downloadData()
            }
            .cutomName(newName)
    }
    
    func downloadData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.newName  = "New value from future"
        }
    }
}

struct CustomNamePreferenceKey: PreferenceKey {
    typealias Value = String
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
    
    
}

#Preview {
    PreferenceKey2Bootcamp()
}



struct PreferenceKey2Bootcamp: View {
    
    @State var rectangleSize: CGSize = .zero
    
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: rectangleSize.width, height: rectangleSize.height)
            
            Spacer()
            
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .saveGeometry(geo.size)
                }
                Rectangle()
            }
            .frame(height: 50)
        }
        .onPreferenceChange(GeometryPreferenceKey.self, perform: { value in
            rectangleSize = value
        })
       
    }
}

extension View {
    func saveGeometry(_ value: CGSize) -> some View {
        self.preference(key: GeometryPreferenceKey.self, value: value)
    }
}


struct GeometryPreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
    typealias Value = CGSize
    
    
}
