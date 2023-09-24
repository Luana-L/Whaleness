//
//  ProviderTabView.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct ProviderTabView: View {
    var body: some View {
        TabView {
            Group{
                HomePortalProvider()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        Text("Home")
                    }
                Patients()
                    .tabItem {
                        Label("Check In", systemImage: "person.fill.turn.left")
                        Text("Check In")
                    }
                /*
                ChatPortalProvider()
                    .tabItem {
                        Label("Chat", systemImage: "bubble.left.and.bubble.right")
                        Text("Chat")
                    }
                 */
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color("DarkBlue"), for: .tabBar)
        }
        .accentColor(.white)
        
    }
}

#Preview {
    ProviderTabView()
}
