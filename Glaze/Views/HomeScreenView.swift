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
    
    let imageWidthOffset: CGFloat = 300
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
                                offsetX = imageWidthOffset
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
                        .frame(alignment: .center)
                }
                
            }
        }
    }
    
    func animate() {
        let delay = 4.0
        let duration = 20.0
        
        
        let nextOffset = animateRight ? -imageWidthOffset : imageWidthOffset
        animateRight.toggle()
        
        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: true).delay(delay)) {
            offsetX = nextOffset
        }
    }
}

#Preview {
    HomeScreenView()
}
