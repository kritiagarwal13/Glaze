//
//  LaunchScreen.swift
//  Glaze
//
//  Created by Kriti Agarwal on 22/04/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("glaze")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LaunchScreenView()
}
