//
//  CaptureView.swift
//  Inastagram-UI
//
//  Created by Brandon Franks on 3/3/21.
//

import Foundation
import SwiftUI

struct CaptureView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var isUsingCamera: Bool
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, isUsingCamera: Binding<Bool>) {
        _isShown = isShown
        _image = image
        _isUsingCamera = isUsingCamera
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, isUsingCamera: $isUsingCamera)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        picker.sourceType = isUsingCamera ? .camera : .photoLibrary
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // do nothing
    }
    
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var isUsingCamera: Bool
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, isUsingCamera: Binding<Bool>) {
        _isShown = isShown
        _image = image
        _isUsingCamera = isUsingCamera
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // user cancelled
        isShown = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        image = Image(uiImage: uiImage)
        isShown = false
    }
}
