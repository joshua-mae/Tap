//
//  ForgotPassView.swift
//  tap
//
//  Created by Michael Guo on 5/10/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ForgotPassView: View {
    @Binding var currentShowingView: String
    @State private var email: String = ""
    @State private var showAlert = false
    @State private var errString: String?

    var body: some View {
        HStack{
            Image(systemName: "mail")
            TextField("Enter email address", text: $email)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.black)
        )
        .padding()
        
        VStack {
            Spacer()
                .frame(height:50)
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    
                    if let error = error {
                        self.errString = error.localizedDescription
                        print (error)
                    }
                    self.showAlert = true
                }
            }) {
                Text("Reset Password")
            }
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black))
            .padding(.horizontal)
            
            Button(action: {
                withAnimation{
                    self.currentShowingView = "login"
                }
            }) {
                Text("Return to login page")
            }
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black))
            .padding(.horizontal)
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"), message: Text(self.errString ?? "Success.  Reset email sent check email"), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

