//
//  mainView.swift
//  tap
//
//  Created by Joshua Mae on 5/9/23.
//
// for me to fix

import SwiftUI

// todo list, clock in/clock out, notifications, etc

struct HomeView: View {
    let gradient = LinearGradient(colors: [.blue, .purple],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            gradient
                .opacity(0.25)
                .ignoresSafeArea()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
