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
        posts[index]
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack {
                    cover
                    
                    HStack {
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .center)
                            .cornerRadius(10)
                        
                            
                        VStack(alignment: .leading, spacing: -2) {
                            Text(post.username)
                                .font(.footnote)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                            
                            Text("sent an inspo 1 hr")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        .padding(2)
                        .matchedGeometryEffect(id: "mask\(post.id)", in: namespace)
                    }
                    .padding(.leading, 10)
                    .padding(.top, -60)
                    
    //                Spacer()
                    
                    RecommendationGridView()
                }
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
            .padding(.horizontal,10)
            .padding(.vertical,10)
        }
    }
    
    var cover : some View {
        
        VStack{
            Spacer()
        }.frame(maxWidth:.infinity)
            .frame(height:600)
            .foregroundStyle(.white)
            .background(
                Image(post.image).resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
                    .matchedGeometryEffect(id: "image\(post.id)", in: namespace)
            )
            .padding(10)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        StatefulPreviewWrapper(nil as Int?) { selectedPost in
            PostDetailView(namespace: namespace, selectedPost: selectedPost, index: 0)
        }
    }
}
