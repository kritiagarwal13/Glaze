//
//  CardDetailView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct CardDetailView: View {
    var imageName: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer() // Pushes the button to the right
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.trailing, 20)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                
                PostCardView()
                    .padding(-8)
            }
        }
    }
}

#Preview {
    CardDetailView(imageName: "post1")
}
