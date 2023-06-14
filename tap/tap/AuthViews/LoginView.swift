//
//  LoginView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//

import SwiftUI
import FirebaseAuth

//extension UIColor {
//    convenience init(hex: String) {
//        var hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
//
//        if hexString.hasPrefix("#") {
//            hexString.remove(at: hexString.startIndex)
//        }
//
//        if hexString.count != 6 {
//            self.init(white: 0.5, alpha: 1.0)
//            return
//        }
//
//        var rgbValue: UInt64 = 0
//        Scanner(string: hexString).scanHexInt64(&rgbValue)
//
//        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
//        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
//
//        self.init(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}

struct LoginView: View {
    @AppStorage("uid") var userID: String = ""

    @Binding var currentShowingView: String
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack{
//            Color(UIColor(hex: "#D2B48C"))
//                .edgesIgnoringSafeArea(.all)
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("Welcome Back!")
                        .font(.largeTitle)
                        .bold()
//                        .foregroundColor(Color(UIColor(hex: "#2D4B73"))
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
                        withAnimation{self.currentShowingView = "newpass"
                        }
                    })
                    {
                        Text("Forgot password?")
                            .foregroundColor(Color(.systemGray))
                                // .opacity(0.7))
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

