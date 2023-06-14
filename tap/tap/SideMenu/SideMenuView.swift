//
//  SideMenuView.swift
//  tap
//
//  Created by Michael Guo on 6/13/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var sideMenu_showing: Bool
    @Binding var home_showing: Bool
    @Binding var schedule_showing: Bool
    @Binding var inventory_showing: Bool
    @Binding var profile_showing: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(hex: "D2B48C")), Color(UIColor(hex: "ABD7EB"))]), startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                //HEADER
                SideMenuHeader(sideMenu_showing: $sideMenu_showing)
                    .frame(height: 200)
                    .foregroundColor(.white)
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    Button {
                        if (option.title == "Home") {
                            home_showing = true
                            schedule_showing = false
                            inventory_showing = false
                            profile_showing = false
                        }
                        else if (option.title == "Schedule"){
                            home_showing = false
                            schedule_showing = true
                            inventory_showing = false
                            profile_showing = false
                        }
                        else if (option.title == "Inventory"){
                            home_showing = false
                            schedule_showing = false
                            inventory_showing = true
                            profile_showing = false
                        }
                        else if (option.title == "Profile"){
                            home_showing = false
                            schedule_showing = false
                            inventory_showing = false
                            profile_showing = true
                        }
                        else {
                            
                        }
                        withAnimation(.spring()) {
                            sideMenu_showing.toggle()
                        }
                    } label: {
                        SideMenuOptionView(viewModel: option)
                    }
                    
                }
                .ignoresSafeArea()
                Spacer()
                //TABS
            }
        }
        .navigationBarHidden(true)
    }
}

//struct SideMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenuView(sideMenu_showing: .constant(true))
//    }
//}
