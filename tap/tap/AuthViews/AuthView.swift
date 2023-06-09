//
//  AuthView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @State private var currentViewShowing: String = "login"
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        if (currentViewShowing == "login"){
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        
        } else if (currentViewShowing == "newpass"){
            ForgotPassView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        }
        else {
            SignUpView(currentShowingView: $currentViewShowing)
                .transition(.move(edge: .bottom))
                .preferredColorScheme(.light)
        }
    }
        }

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
