//
//  RecommendationGridView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 25/04/24.
//

import SwiftUI

struct RecommendationGridView: View {
    @Namespace var namespace
    @State var selectedPost: Int?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        VStack {
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
            .padding([.leading, .trailing], 10)
        }
    }
}

#Preview {
    RecommendationGridView()
}
