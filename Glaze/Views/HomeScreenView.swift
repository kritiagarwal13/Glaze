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
    
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    
    let imageWidthOffset: CGFloat = -300
    var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Behind every girl")
                        .textCase(.uppercase)
                        .foregroundColor(.accentColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                    .frame(height: 360)
                    
                    Text("With immaculate style")
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.accentColor)
                        .bold()
                        .font(.title)
                        .padding(.trailing, 10)
                        .padding(.top, -10)
                    
                    Text("Is a site where you can send, save and shop all your inspo.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
//                        .frame(alignment: .center)
//                        .frame(height: 80)
                }
                
            }
        }
    }
    
    func animate() {
        let delay = 1.0  // Delay before the animation starts
        let duration = 45.0  // Duration of one way of the animation
        
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
