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
            Spacer()
            VStack(alignment: .leading, spacing: 12) {

                Spacer()
                
                Text(post.username)
                    .fontWeight(.bold)
                    .font(.callout)
                    .foregroundColor(.accent)
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .matchedGeometryEffect(id: "title\(post.id)", in: namespace)
            }
        }
        .foregroundStyle(.white)
        .background(
            Image(post.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image\(post.id)", in: namespace)
                .padding(.bottom, 20)
        )
        .mask(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .matchedGeometryEffect(id: "mask\(post.id)", in: namespace)
        )
        .frame(height: 400)
        .onTapGesture {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                selectedPost = index
            }
        }
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
