//
//  SideMenuHeader.swift
//  tap
//
//  Created by Michael Guo on 6/13/23.
//

import SwiftUI

struct SideMenuHeader: View {
    @Binding var sideMenu_showing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                withAnimation(.spring()) {
                    sideMenu_showing.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.gray)
                    .padding()
            }

            
            VStack(alignment: .leading) {
                Image("stock_profile")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                Text("Nandan Srikrishna")
                    .font(.system(size: 20, weight: .semibold))
                HStack(spacing: 14){
                    Text("LanCity Noodle Bar")
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 20)
        .padding(.leading, 20)
        }
    }
}

struct SideMenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeader(sideMenu_showing: .constant(true))
    }
}
