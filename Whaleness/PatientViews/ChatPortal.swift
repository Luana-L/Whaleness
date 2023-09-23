//
//  WorkOrders.swift
//  Pro-G
//
//  Created by Luana Liao on 6/20/23.
//

import SwiftUI

struct ChatPortal: View {
    @State private var selectedTab = 0

    var body: some View {
        NavigationView {
            VStack {
                
            }
            .background(Color(.systemGray6))
            .navigationTitle("Hi")
            .background(Color("OffWhite"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("DarkBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        
        
    }
}

struct ChatPortal_Previews: PreviewProvider {
    static var previews: some View {
        ChatPortal()
    }
}
