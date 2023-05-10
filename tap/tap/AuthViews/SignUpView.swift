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
    
    private func isValidPassword(_password: String) -> Bool {
        //minimum 6 chars long
        // 1 uppercase, 1 lowercase
        // 1 number
        // 1 special char
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z])(?=.*[0-9]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    private func oneUpperOneLower(_password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z]).{2,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    private func atleastOneNum(_password: String) -> Bool {
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9]).{1,}$")
        return passwordRegex.evaluate(with: password)
    }

    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("Create an account!")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                } //Create an account!
                .padding()
                .padding(.top)
                
                Spacer()
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                    if (email.count != 0) {
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }

                } //Email
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: oneUpperOneLower(_password: password) ? "checkmark" : "xmark")
                            .foregroundColor(oneUpperOneLower(_password: password) ? .green : .red)
                        Text("Atleast one uppercase letter and lowercase letter")
                    }
                    HStack {
                        Image(systemName: atleastOneNum(_password: password) ? "checkmark" : "xmark")
                            .foregroundColor(atleastOneNum(_password: password) ? .green : .red)
                        Text("Atleast one number 0-9")
                    }
                    HStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                        Text("Atleast one special character i.e $@$#!%*?&")
                    }
                    HStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                        Text("Atleast six characters long")
                    }
                }
                .font(.caption)
                .italic()
                .padding([.leading], nil)
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    
                    Spacer()
                    
                    if (password.count != 0) {
                        Image(systemName: isValidPassword(_password: password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(_password: password) ? .green : .red)
                    }
                } //Password
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding([.leading, .bottom, .trailing], nil) //ONLY HERE IF INVALID PASSWORD FIRST TIME
//                .padding()
                
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

//ONLY HERE TO BE ABLE TO SEE WHEN CUSTOMIZE
struct SignupView_Preview: PreviewProvider {
    static var previews: some View {
        @State var currentViewShowing: String = "signup"
        SignUpView(currentShowingView: $currentViewShowing)
        
    }
}
