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
    
    let columns = [
        GridItem(.flexible()), // Add more GridItem instances for more columns
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                HomeScreenView()
                    .frame(width: UIScreen.main.bounds.width, height: 550) // Constrain the width if necessary
                    .background(Color.white) // Temporary background color for debugging
                
                Text("Explore")
                    .foregroundColor(.black)
                    .bold()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(posts.indices, id: \.self) { index in
                        PostItemView(namespace: namespace, selectedPost: $selectedPost, index: index)
                            .background(Color.white) // Temporary background color for debugging
                            .onTapGesture {
                                withAnimation {
                                    selectedPost = index // Assign the tapped post index to selectedPost
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

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
            .preferredColorScheme(.light)
    }
}
