//
//  LoginScreen.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import SwiftUI

struct LoginView: View {
    @State var username : String = ""
    @AppStorage("isUserLoggedIn") var isUserLoggedIn : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("+1 ")
                    .textEditorStyle(.automatic)
                
                TextField(text: $username, prompt: Text("Phone Number")) {
                    Text("Phone Number")
                }
            }
            .padding([.leading, .trailing], 120)
            
            Divider()
                .padding([.leading, .trailing], 100)
                .padding(.bottom, 20)
            
            Button("Log in") {
                LoginAction()
            }
            .font(.headline)
            .bold()
            .textCase(.uppercase)
            .frame(width: 200, height: 40)
            .foregroundColor(Color.white)
            .background(Color.accentColor)
            
            HStack {
                Text("Don't have an account?")
                    .font(.headline)
                    .italic()
                
                Button("Sign Up") {
                    LoginAction()
                }
                .foregroundColor(Color.accentColor)
            }
            .padding(.top, 10)
        }
    }
    
    func LoginAction() {
        print("User logged in")
        isUserLoggedIn.toggle()
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    LoginView()
}
