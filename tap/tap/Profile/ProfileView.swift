//
//  ProfileView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import FirebaseAuth


// Profile customization, I dont think we can deal with senstive info...
struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button (
                action: {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                        withAnimation{
                            userID = ""
                        }
                    } catch let signOutError as NSError{
                        print("Error signing out: %@", signOutError)
                    }
                }) {
                    Text("Sign Out")
                    
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
