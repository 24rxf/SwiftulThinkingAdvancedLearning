//
//  ProtocolsBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 21/05/24.
//

import SwiftUI


protocol ButtonTextProtocol {
    var title: String { get set }
}

protocol ButtonPressedProtocol {
    func onTap()
}



struct DefaultCustomButton: ButtonTextProtocol, ButtonPressedProtocol {
    var title: String = "DefaultButton"
    
    func onTap() {
        print("DefaultButton")
    }
}

struct MyButton: ButtonTextProtocol {
    var title: String = "MY xbutton"
}

struct ProtocolsBootcamp: View {
    
    var buttonText:  ButtonTextProtocol
    var buttonTap: ButtonPressedProtocol
    
    var body: some View {
        Button(buttonText.title) {
            buttonTap.onTap()
        }
    }
}

#Preview {
    ProtocolsBootcamp(buttonText: DefaultCustomButton(), buttonTap: DefaultCustomButton())
}
