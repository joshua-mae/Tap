//
//  SignUpView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("Create an account!")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                    if (email.count != 0) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }

                }
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
                    
                    Spacer()
                    
                    if (password.count != 0) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                
                .padding()
                
                Button(action: {
                    withAnimation{
                        self.currentShowingView = "login"
                    }
                })
                {
                    Text("Already have an account?")
                        .foregroundColor(.black.opacity(0.7))
                }
                Spacer()
                Spacer()
                
                Button{
                    Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
                        
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
                    Text("Create New Account")
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

