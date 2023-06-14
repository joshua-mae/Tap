//
//  SideMenuViewModel.swift
//  tap
//
//  Created by Michael Guo on 6/13/23.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case home
    case schedule
    case inventory
    case profile
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .schedule: return "Schedule"
        case .inventory: return "Inventory"
        case .profile: return "Profile"
        }
    }

    var imageName: String {
        switch self {
        case .home: return "house"
        case .schedule: return "calendar"
        case .inventory: return "pencil"
        case .profile: return "person"
        }
    }
    
    var pageView: any View {
        switch self {
        case .home: return HomeView()
        case .schedule: return ScheduleView()
        case .inventory: return InventoryView()
        case .profile: return ProfileView()
        }
    }
}
