//
//  BubbleBackgroundView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI


struct BubbleBackgroundView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30, style: .continuous) // Rounded rectangle with continuous corners
            .fill(Color.white)
            .shadow(color: .gray, radius: 10, x: 0, y: 4) // Optional shadow for a subtle depth effect
    }
}


#Preview {
    BubbleBackgroundView()
}
