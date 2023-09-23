//
//  Home.swift
//  Pro-G
//
//  Created by Luana Liao on 6/20/23.
//

import SwiftUI

struct TabViewNav: View {
    var body: some View {
        TabView {
            Group{
                HomePortal()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        Text("Home")
                    }
                CheckInPortal()
                    .tabItem {
                        Label("Check In", systemImage: "heart.text.square.fill")
                        Text("Check In")
                    }
                ChatPortal()
                    .tabItem {
                        Label("Chat", systemImage: "bubble.left.and.bubble.right")
                        Text("Chat")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color("DarkBlue"), for: .tabBar)
        }
        .accentColor(.white)
        
    }
}

struct TabViewNav_Previews: PreviewProvider {
    static var previews: some View {
        TabViewNav()
    }
}

