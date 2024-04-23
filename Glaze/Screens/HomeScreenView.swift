//
//  HomeScreenView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 22/04/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var offsetX: CGFloat = 0
    @State private var animateRight = true
    let imageWidthOffset: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack() {
                NavBarView()
                
                VStack(alignment: .leading) { // Set alignment to leading for the inner VStack
                    Text("Behind every girl")
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, alignment: .leading)  // Align text to the left
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                        .padding(.bottom, -10)
                    
                    GeometryReader { geometry in
                        Image("landing")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width)
                            .offset(x: offsetX)
                            .onAppear {
                                // Set initial offset to start just off the left side of the screen
                                offsetX = -imageWidthOffset
                                // Start the continuous animation
                                animate()
                            }
                            .shadow(color: .gray, radius: 10)
                    }
                    .frame(height: 360) // Set a fixed height for the GeometryReader
                    
                    Text("With immaculate style")
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, alignment: .trailing)  // Align text to the right
                        .bold()
                        .font(.title)
                        .padding(.trailing, 10)
                        .padding(.top, -10)
                    
                    Text("Is a site where you can send, save and shop all your inspo.")
                        .bold()
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("Explore")
                        .font(.headline)
                        .bold()
                        .textCase(.uppercase)
                        .foregroundColor(Color.accentColor)
                        .monospaced()
                        .padding(.top, 20)
                        .padding(.leading, 10)
                        .padding(.bottom, -15)
                    
                    PostCardView() // Ensure this view is implemented correctly elsewhere
                }
            }
        }
        
    }
    
    func animate() {
        let delay = 5.0  // Delay before the animation starts
        let duration = 20.0  // Duration of one way of the animation
        
        // Determine next offset based on current animation direction
        let nextOffset = animateRight ? imageWidthOffset : -imageWidthOffset
        animateRight.toggle()  // Toggle direction for next cycle
        
        // Animate the offset to the new position
        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: true).delay(delay)) {
            offsetX = nextOffset
        }
    }
}

#Preview {
    HomeScreenView()
}
