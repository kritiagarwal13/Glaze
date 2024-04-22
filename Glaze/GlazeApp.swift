//
//  GlazeApp.swift
//  Glaze
//
//  Created by Kriti Agarwal on 22/04/24.
//

import SwiftUI

@main
struct GlazeApp: App {
    @State private var isShowingLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if isShowingLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        // Transition to the main content after a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            isShowingLaunchScreen = false
                        }
                    }
            } else {
                MainView()
            }
        }
    }
}
