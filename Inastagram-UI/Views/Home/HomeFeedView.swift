//
//  HomeFeedView.swift
//  Inastagram-UI
//
//  Created by Brandon Franks on 2/28/21.
//

import SwiftUI

struct HomeFeedView: View {
    var body: some View {
        NavigationView {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                VStack {
                    StoriesView()
                    
                    ForEach(1...5, id: \.self) {num in
                        PostView(userImageName: "person\(num)", imageName: "image\(num)")
                    }
                }
                .padding(.bottom, 30)

            }
            .navigationTitle("Instagram")
        }
    }
}

struct PostView: View {
    let userImageName: String
    let imageName: String
    
    var body: some View {
        VStack {
            PostHeaderView(userImageName: userImageName)
            // image
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 430, height: 430, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(.secondarySystemBackground))
            
            // post buttons
            PostActionButtonsView()
            
            // like count
            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(Color.pink)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("32 Likes")
                    .font(.system(size: 20))
                    .foregroundColor(Color(.link))
                Spacer()
            }
            .padding()
            .padding(.top, -20)
            
            // caption
            Text("Wow, I can't belive it's not butter... #swift #butter #vegan")
                .font(.headline)
                .padding(.top, -15)
            
            // date
            HStack{
                Text("1 hour ago")
                    .foregroundColor(Color(.secondaryLabel))
                Spacer()
            }
            .padding(.leading)
        }
    }
}

struct PostHeaderView: View {
    let userImageName: String
    
    var body: some View {
        HStack {
            // user profile picture and username
            Image(userImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            
            Text("Brandon Franks")
                .foregroundColor(.blue)
                .bold()
            
            Spacer()
        }
        .padding()
    }
}

struct PostActionButtonsView: View {
    var body: some View {
        HStack {
            // action buttons: like, comment, share
            // like
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.label))
                    
            })
            .padding()
            // comment
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.label))
                    
            })
            .padding()
            // Share
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.label))
                    
            })
            .padding()
            Spacer()
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
            .preferredColorScheme(.dark)
            
    }
}
