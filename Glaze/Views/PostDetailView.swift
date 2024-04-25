//
//  PostDetailView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 25/04/24.
//

import SwiftUI

struct PostDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedPost: Int?
    var index: Int
    
    var post: Post {
        posts[index] // Assume you have a static array of posts in PostModel
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                cover
                
                Text(post.username)
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "title\(post.id)", in: namespace)
                
                Spacer()
            }
            
            Button {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                    selectedPost = nil
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.black)
                    .padding(8)
                    .background(.white, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.horizontal,0)
            .padding(.vertical,0)
        }
    }
    
    var cover : some View {
        
        VStack{
            Spacer()
        }.frame(maxWidth:.infinity)
            .frame(height:600)
            .foregroundStyle(.white)
            .background(
                Image(post.image).resizable().aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image\(post.id)", in: namespace)
            )
    }
}

struct PostDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        // Similar to PostItemView, you need to use `selectedPost` which is a binding to an optional Int
        StatefulPreviewWrapper(nil as Int?) { selectedPost in
            PostDetailView(namespace: namespace, selectedPost: selectedPost, index: 0)
        }
    }
}
