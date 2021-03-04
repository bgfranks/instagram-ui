//
//  CameraView.swift
//  Inastagram-UI
//
//  Created by Brandon Franks on 2/28/21.
//

import SwiftUI

struct CameraView: View {
    @State var image: Image? = nil
    @State var isShowingPicker = false
    @State var isUsingCamera = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Button(action: {
                        self.isUsingCamera = false
                        self.isShowingPicker.toggle()
                    }, label: {
                        Text("Photo Library")
                    })
                    .padding()
                    
                    Button(action: {
                        self.isUsingCamera = true
                        self.isShowingPicker.toggle()
                    }, label: {
                        Text("Take Photo")
                    })
                    .padding()
                }
                
                if (isShowingPicker) {
                    CaptureView(isShown: $isShowingPicker, image: $image, isUsingCamera: $isUsingCamera)
                }
            }
            .navigationTitle("Camera")
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .preferredColorScheme(.dark)
    }
}
