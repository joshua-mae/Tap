//
//  ContentView.swift
//  tap
//
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var router = ViewRouter()
    @State private var showMenu = false
    @State var selection: TabIcon = TabIcon(viewModel: .home, router: ViewRouter())
    
    var body: some View {
        VStack {
            Spacer()
            router.view
            Spacer()
            
            HStack {
                Spacer()
                TabIcon(viewModel: .home, router: router)
                TabIcon(viewModel: .calendar, router: router)
                
//                TabMenuIcon(showMenu: $showMenu)
//                    .onTapGesture {
//                        withAnimation {
//                            showMenu.toggle()
//                        }
//                    }
                
                TabIcon(viewModel: .checklist, router: router)
                TabIcon(viewModel: .profile, router: router)
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.height / 8)
            .frame(maxWidth: .infinity)
            .background(Color(.clear))
        }
        .ignoresSafeArea()
//        .preferredColorScheme(.dark)
    }
}

//struct TabMenuIcon: View {
//    @Binding var showMenu: Bool
//    var body: some View {
//        ZStack {
//            Circle()
//                .foregroundColor(.white)
//                .frame(width: 56, height: 56)
//                .shadow(radius: 4)
//            Image(systemName: showMenu ? "xmark.circle.fill" : "plus.circle.fill")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .foregroundColor(.blue)
//                .rotationEffect(Angle(degrees: showMenu ? 90 : 0))
//        }
//        .offset(y: -44)
//    }
//}

struct TabIcon: View {
    let viewModel: MenuBarViewModel
    @ObservedObject var router: ViewRouter
    
    var body: some View {
        Button {
            router.currentItem = viewModel
        } label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20, height: 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .padding()
        }
//        .background(Color(.systemGray3))
        .cornerRadius(20)
    }
}

//struct TabMenuIcon: View {
//    @Binding var showMenu: Bool
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(router: ViewRouter())
    }
}

struct TabBarItem: Hashable {
    let iconIamge: String
    let title: String
}
