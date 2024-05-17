//
//  CustomNavBarPreferenceKey.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 17/05/24.
//

import Foundation
import SwiftUI


struct TitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    typealias Value = String
}

struct SubtitlePreferenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
    
    typealias Value = String?
}

struct HideBackButtonPreferenceKey: PreferenceKey {
    static var defaultValue: Value = false
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
    
    typealias Value = Bool
}


extension View {
    func setCustomNav(title: String = "", subtitle: String? = nil, hide: Bool = false) -> some View {
        self
            .preference(key: TitlePreferenceKey.self, value: title)
            .preference(key: SubtitlePreferenceKey.self, value: subtitle)
            .preference(key: HideBackButtonPreferenceKey.self, value: !hide)
    }
}
