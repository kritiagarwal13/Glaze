//
//  PostItemView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 25/04/24.
//

import SwiftUI

struct PostItemView: View {
    var namespace: Namespace.ID
    @Binding var selectedPost: Int?
    var index: Int

    var post: Post {
        posts[index]
    }

    var body: some View {
        VStack {
            Image(post.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(post.id)", in: namespace)
                .cornerRadius(5)
//                .frame(height: 400)
                .clipped()
            
            HStack {
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
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
                .padding(-5)
                .matchedGeometryEffect(id: "mask\(post.id)", in: namespace)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                selectedPost = index
            }
        }
        //        VStack {
        //
        //            Spacer()
        //
        //            VStack(alignment: .leading, spacing: 12) {
        //                Text(post.username)
        //                    .fontWeight(.bold)
        //                    .font(.title)
        //                    .frame(maxWidth:.infinity,alignment: .leading)
        //                    .matchedGeometryEffect(id: "title", in: namespace)
        //
        //                Text("sent an inspo 1 hr")
        //                    .fontWeight(.bold)
        //                    .font(.callout)
        //
        //            }.padding(20)
        //
        //        }
        //        .foregroundStyle(.white)
        //        .background(
        //            Image(post.image)
        //                .resizable()
        //                .aspectRatio(contentMode: .fill)
        //                .matchedGeometryEffect(id: "image\(post.id)", in: namespace)
        //                .padding(.bottom, 20)
        //        )
        //        .mask(
        //            RoundedRectangle(cornerRadius: 10, style: .continuous)
        //                .matchedGeometryEffect(id: "mask\(post.id)", in: namespace)
        //        )
        //        .frame(height: 400)
        //        .onTapGesture {
        //            withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
        //                selectedPost = index
        //            }
        //        }
    }
}

struct PostItemView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        StatefulPreviewWrapper(nil as Int?) { selectedPost in
            PostItemView(namespace: namespace, selectedPost: selectedPost, index: 0)
        }
    }
}

// Helper view to provide state in previews
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    let content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
