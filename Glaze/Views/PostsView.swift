//
//  PostsView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 25/04/24.
//

import SwiftUI

struct PostsView: View {
    @Namespace var namespace
    @State var selectedPost: Int?
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.ignoresSafeArea()
                ScrollView {
                    HStack {
                        Spacer()
                        
                        Image("glaze")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .padding(.leading, 50)
                        
                        Spacer()
                        
                        NavigationLink(destination: LoginView()) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.trailing, 20)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(height: 30)
                    
                    HomeScreenView()
                        .frame(width: UIScreen.main.bounds.width, height: 550)
                        .background(Color.white)
                    
                    Text("Explore")
                        .foregroundColor(.black)
                        .bold()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(posts.indices, id: \.self) { index in
                            PostItemView(namespace: namespace, selectedPost: $selectedPost, index: index)
                                .background(Color.white)
                                .onTapGesture {
                                    withAnimation {
                                        selectedPost = index
                                    }
                                }
                        }
                    }
                    .padding(5)
                }
                
                if let selectedPost = selectedPost {
                    PostDetailView(namespace: namespace, selectedPost: $selectedPost, index: selectedPost)
                        .zIndex(5)
                }
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
            .preferredColorScheme(.light)
    }
}
