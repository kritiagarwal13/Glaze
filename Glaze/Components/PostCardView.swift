//
//  PostCardView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct PostCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("post1")
                .resizable()
                .frame(width: 240, height: 320)
            
            Image("post2")
                .resizable()
                .frame(width: 240, height: 320)
            
            Image("post3")
                .resizable()
                .frame(width: 240, height: 320)
            
            Image("post4")
                .resizable()
                .frame(width: 240, height: 320)
            
            Image("post5")
                .resizable()
                .frame(width: 240, height: 320)

        }
    }
}

#Preview {
    PostCardView()
}
