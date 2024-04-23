//
//  ButtonView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct ButtonView: View {
    
    var onPress: ()->()
    
    
    var body: some View {
        Button{
            print("Button Pressed")
            onPress()
        }label: {
            HStack{
                Text("Skip")
                Image(systemName: "arrow.forward.circle")
            }
            .monospaced()
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
            .foregroundColor(.blue)
            
        }.buttonStyle(.plain)
            .accentColor(.pink)
    }
}
