//
//  OnboardingScreenView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 22/04/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    @State private var isAnimating: Bool = false
    
    var showGetStartedButton: Bool
    var onbScreen: Step
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            VStack {
                
                Text("How to Glaze")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 10)
                
                Text(onbScreen.title)
                    .font(.subheadline)
                    .monospaced()
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center) // Ensures text is aligned left and stretches across the top
                
                Text(onbScreen.headline)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .monospaced()
                    .frame(maxWidth: .infinity, alignment: .center) // Similar alignment for consistency
            }.padding(.bottom, 10)
            
            ZStack {
                BubbleBackgroundView() // Background bubble view
                    .frame(width: 300, height: 520) // Adjust size as needed
                
                Image(onbScreen.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 280, height: 500)
                    .cornerRadius(20)
                    .clipped()
            }
            
            Spacer() // Pushes everything to the top
            
            if showGetStartedButton {
                ButtonView(onPress: {
                    isOnBoarding = false
                })
                .padding(.bottom, 20)
            }
            
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 20) // Adds padding at the top for better spacing
        .cornerRadius(20)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(showGetStartedButton: false, onbScreen: Step(id: 1, title: "Step-1", headline: "Text us posts and screenshots", image: "step-1"))
    }
}
