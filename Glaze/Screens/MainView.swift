//
//  ContentView.swift
//  Glaze
//
//  Created by Kriti Agarwal on 22/04/24.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    @AppStorage("showGetStartedButton") var showGetStartedButton:Bool = false
    
    var body: some View {
        if isOnBoarding {
            TabView {
                ForEach(onboardingStructure.indices, id: \.self) { index in
                    OnboardingView(showGetStartedButton: index == onboardingStructure.count - 1, onbScreen: onboardingStructure[index])
                }
            }
            .tabViewStyle(.page)
        } else {
            HomeScreenView()
        }
    }
}

#Preview {
    MainView()
}
