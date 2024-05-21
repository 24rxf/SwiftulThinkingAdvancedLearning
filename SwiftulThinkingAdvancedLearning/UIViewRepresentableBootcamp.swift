//
//  UIViewRepresentableBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 21/05/24.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            
            Text(text)
                .font(.largeTitle)
            HStack {
                Text("SwiftUI: ")
                TextField("Tpye here..", text: $text)
                    .padding()
                    .background(.red)
            }
            
            HStack {
                Text("UIKit: ")
                UIKitTextField(text: $text)
                    .updatePlaceHolder("TYPE here oke..")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
            }
        }
    }
}

struct UIKitTextField: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String = ""
    
    func makeUIView(context: Context) -> UITextField {
        let textField = makeTextField()
        textField.delegate = context.coordinator
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func updatePlaceHolder(_ text: String) -> UIKitTextField {
        var view = self
        view.placeholder = text
        
        return view
    }
    
    
    func makeTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [.foregroundColor : UIColor.white]
        )
        return textField
    }
    
    func makeCoordinator() ->  Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject,  UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}
