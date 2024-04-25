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
        PostsView()
    }
}

#Preview {
    MainView()
}
