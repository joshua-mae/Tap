//
//  LoginView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @AppStorage("uid") var userID: String = ""

    @Binding var currentShowingView: String
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                } //WELCOME BACK
                .padding()
                .padding(.top)
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
//                    Spacer()
                    
//                    if (email.count != 0) {
//                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
//                            .fontWeight(.bold)
//                            .foregroundColor(email.isValidEmail() ? .green : .red)
//                    }
                } //Email
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
//                    Spacer()
                    
//                    if (password.count != 0) {
//                        Image(systemName: isValidPassword(_password: password) ? "checkmark" : "xmark")
//                            .fontWeight(.bold)
//                            .foregroundColor(isValidPassword(_password: password) ? .green : .red)
//                    }
                } //Password
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding([.leading,.trailing, .top], nil)
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation{self.currentShowingView = "NA"
                        }
                    })
                    {
                        Text("Forgot password")
                            .foregroundColor(Color(.systemGray).opacity(0.7))
//                            .font(.caption2)
                    }
                    Spacer()
                    Spacer()
                    Button(action: {
                        withAnimation{self.currentShowingView = "signup"
                        }
                    })
                    {
                        Text("Don't have an account?")
                            .foregroundColor(Color(.systemGray))
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
                
                Button{

                    Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                        
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            withAnimation{
                                userID = authResult.user.uid
                            }
                        }
                    }
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black))

                        .padding(.horizontal)
                }
                
            }
        }
    }
}

