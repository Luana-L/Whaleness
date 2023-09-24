//
//  ProviderTabView.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct ProviderTabView: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        TabView {
            Group{
                HomePortalProvider(isAuthenticated: $isAuthenticated)
                    .tabItem {
                        Label("Home", systemImage: "house")
                        Text("Home")
                    }
                Patients()
                    .tabItem {
                        Label("Patients", systemImage: "person.crop.rectangle.stack.fill")
                        Text("Check In")
                    }
                
                ChatPortalProvider()
                    .tabItem {
                        Label("Chat", systemImage: "bubble.left.and.bubble.right")
                        Text("Chat")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color("DarkBlue"), for: .tabBar)
        }
        .accentColor(Color("OffWhite"))
    }
}

#Preview {
    ProviderTabView(isAuthenticated: .constant(true))
}
