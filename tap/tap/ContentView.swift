//
//  ContentView.swift
//  tap
//
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @AppStorage("uid") var userID: String = ""
    
    var body: some View {
        if userID == "" {
            AuthView()
            
        } else {
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                              }
                ScheduleView()
                    .tabItem{
                        Label("Schedule", systemImage: "calendar")
                              }
                InventoryView()
                    .tabItem{
                        Label("Inventory", systemImage: "pencil")
                              }

                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.crop.circle")
                              }
            }
        }
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
