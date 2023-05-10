//
//  TabRouter.swift
//  tap
//
//  Created by Michael Guo on 5/9/23.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentItem: MenuBarViewModel = .home
    
    var view: some View { return currentItem.view }
}

enum MenuBarViewModel: Int, CaseIterable {
    case home
    case calendar
    case checklist
    case profile
    
    var imageName: String {
        switch self {
        case .home: return "house.fill"
        case .calendar: return "calendar.circle.fill"
        case .checklist: return "checklist.checked"
        case .profile: return "person.fill"
        }
    }
    
    var view: some View {
        switch self {
        case .home:
            return Text("Home")
        case .calendar:
            return Text("Calendar")
        case .checklist:
            return Text("Checklist/Inventory")
        case .profile:
            return Text("Profile")
        }
    }
}
