//
//  NavBarView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                
                Image("glaze")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .padding(.leading, 50)
                
                Spacer()
                
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 20)
            }
            .frame(height: 30)
        }
        .foregroundColor(.accentColor)
    }
}

#Preview {
    NavBarView()
}
