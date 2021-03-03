//
//  ExploreView.swift
//  Inastagram-UI
//
//  Created by Brandon Franks on 2/28/21.
//

import SwiftUI

struct ExploreView: View {
    @State var text = ""
    
    var imageNames = (1...5).map({"image\($0)"})
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 200)),
        GridItem(.flexible(minimum: 200))
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search...", text: $text)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, content: {
                        ForEach(0...20, id: \.self) {num in
                            let name = imageNames.randomElement() ?? "image1"
                            NavigationLink(
                                destination: PostView(userImageName: "person1", imageName: name),
                                label: {
                                    Image(name)
                                        .resizable()
                                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color.red)
                                })
                        }
                    })
                }
            }
            .navigationTitle("Explore")
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .preferredColorScheme(.dark)
    }
}
