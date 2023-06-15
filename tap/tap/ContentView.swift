//
//  ContentView.swift
//  tap
//
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    @State var sideMenu_showing = false
    @State var home_showing = true
    @State var schedule_showing = false
    @State var inventory_showing = false
    @State var profile_showing = false
    
    var body: some View {
        if userID == "" {
            AuthView()
            
        } else {
            NavigationView {
                ZStack {
                    if sideMenu_showing {
//                        withAnimation(.spring()) {
                        SideMenuView(sideMenu_showing: $sideMenu_showing, home_showing: $home_showing, schedule_showing: $schedule_showing, inventory_showing: $inventory_showing, profile_showing: $profile_showing)
//                        }
                    }
                    if home_showing {
                        HomeView()
                            .cornerRadius(20)
                            .offset(x: sideMenu_showing ? 200 : 0)
//                            .scaleEffect(sideMenu_showing ? 0.8 : 1)
                            .navigationBarItems(leading: Button(action: {
                                withAnimation(.spring()) {
                                    sideMenu_showing.toggle()
                                }
                            }, label: {
                                Image("hamburgerMenuIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }))
                            .ignoresSafeArea()
                    }
                    else if schedule_showing {
                        ScheduleView()
                            .cornerRadius(sideMenu_showing ? 20 : 10)
                            .offset(x: sideMenu_showing ? 200 : 0)
//                            .scaleEffect(sideMenu_showing ? 0.8 : 1)
                            .navigationBarItems(leading: Button(action: {
                                withAnimation(.spring()) {
                                    sideMenu_showing.toggle()
                                }
                            }, label: {
                                Image("hamburgerMenuIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }))
                            .ignoresSafeArea()
                    }
                    else if inventory_showing {
                        InventoryView()
                            .cornerRadius(sideMenu_showing ? 20 : 10)
                            .offset(x: sideMenu_showing ? 200 : 0)
//                            .scaleEffect(sideMenu_showing ? 0.8 : 1)
                            .navigationBarItems(leading: Button(action: {
                                withAnimation(.spring()) {
                                    sideMenu_showing.toggle()
                                }
                            }, label: {
                                Image("hamburgerMenuIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }))
                            .ignoresSafeArea()
                    }
                    else if profile_showing {
                        ProfileView()
                            .cornerRadius(sideMenu_showing ? 20 : 10)
                            .offset(x: sideMenu_showing ? 200 : 0)
//                            .scaleEffect(sideMenu_showing ? 0.8 : 1)
                            .navigationBarItems(leading: Button(action: {
                                withAnimation(.spring()) {
                                    sideMenu_showing.toggle()
                                }
                            }, label: {
                                Image("hamburgerMenuIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            }))
                            .ignoresSafeArea()
                    }
                    else {
                        Color.black
                        Text("DEBUG: ERROR IN CHOOSING TAB SHOULD NOT BE HERE")
                            .foregroundColor(.white)
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    print(value.translation)
                    switch(value.translation.width) {
                    case (...0): withAnimation(.spring()) {sideMenu_showing = false}
                    case (0...):  withAnimation(.spring()) {sideMenu_showing = true}
                    default:  print("not used")
                    }
                }
            )
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
