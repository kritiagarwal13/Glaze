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
        }
    }
}

#Preview {
    PostCardView()
}

struct MyPostCardCell: View {
    var index: Int
    @State private var showDetail = false
    
    var body: some View {
        Button(action: {
            // Action to perform on tap
            withAnimation {
                showDetail = true
            }
        }) {
            VStack {
                Image("post\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                HStack(alignment: .center) {
                    Image("user")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(10)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text("@user")
                            .font(.caption)
                            .frame(alignment: .leading)
                            .padding(.bottom, -8)
                        
                        Text("updated 2 mins ago")
                            .font(.caption)
                            .frame(alignment: .leading)
                    }
                    .padding(.leading, -5)
                    
                    Spacer()
                }
                .frame(height: 10, alignment: .leading)
                .padding(.top, 8)
            }
            // Maintain visual layout, avoiding button style alterations
            .shadow(radius: 1)
            .padding(8)
        }
        .buttonStyle(PlainButtonStyle())
        //        .fullScreenCover(isPresented: $showDetail) {
        //            // Ensure CardDetailView is constructed correctly
        //            CardDetailView(imageName: "post\(index)")
        ////                .transition(.scale)
        //                .animation(.spring(), value: showDetail)
        //                .matchedGeometryEffect(id: index, in: namespace)
        //        }
    }
}
