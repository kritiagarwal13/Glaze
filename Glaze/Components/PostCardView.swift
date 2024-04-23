//
//  PostCardView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct PostCardView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<20) { index in
                    MyPostCardCell(index: index)
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    PostCardView()
}

struct MyPostCardCell: View {
    var index: Int
    
    var body: some View {
        VStack {
            Image("post3")
                .resizable()
            
            HStack(alignment: .center) {
                Image("post2")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .cornerRadius(10)
                    .clipped()
                
                Text("@user")
                    .font(.caption)
                    .padding(.leading, -5)
                
                Spacer()
            }
            .frame(height: 10, alignment: .leading)
            .padding(.top, 3)
        }
        .frame(width: 180, height: 320)
        .shadow(radius: 1)
        .padding(5)
    }
}
