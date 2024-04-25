//
//  NavBar.swift
//  Glaze
//
//  Created by Kriti Agarwal on 25/04/24.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        NavigationView {
            HStack {
                Image("glaze")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .padding(.leading, 160)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 20)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(height: 30)
        }
    }
}

#Preview {
    NavBar()
}
