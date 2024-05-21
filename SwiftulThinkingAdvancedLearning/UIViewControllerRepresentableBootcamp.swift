//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftulThinkingAdvancedLearning
//
//  Created by Rizal Fahrudin on 21/05/24.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    @State var showSheet = false
    @State var image: UIImage?
    var body: some View {
        
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 150)
        }
        
        Button("show UIViewController") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
            UIImagePickerBootcamp(image: $image, showSheet: $showSheet)
        })
    }
}

struct UIImagePickerBootcamp: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showSheet: Bool
    
    init(image: Binding<UIImage?>, showSheet: Binding<Bool>) {
        self._image = image
        self._showSheet = showSheet
    }
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIImagePickerController()
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showSheet: $showSheet)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showSheet: Bool
        init(image: Binding<UIImage?>, showSheet: Binding<Bool>) {
            self._image = image
            self._showSheet = showSheet
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let newImage = info[.originalImage] as? UIImage else { return }
            self.image = newImage
            self.showSheet.toggle()
        }
    }
}
class CustomViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.blue
        
        let label = UILabel()
        label.text = "Some text"
        label.textColor  = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}
