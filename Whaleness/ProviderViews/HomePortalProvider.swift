//
//  HomePortalProvider.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct HomePortalProvider: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        if (isAuthenticated) {
            content
        } else {
            LandingPage()
        }
    }
    
    var content: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Welcome!")
                        .font(Font.custom("Avenir", size: 30))
                        .foregroundStyle(Color("DarkBlue"))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                Text("Upcoming appointments...")
                    .padding(.leading, 20)
                    .font(Font.custom("Avenir", size: 20))
                VStack(spacing: 10) {
                    ForEach(ProviderAppointment.MOCK_PROVAPPT.sorted(by: { $0.date < $1.date }).prefix(3)) { provappt in
                        ProviderApptBubbleView(provapptment: provappt)
                    }
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    Text("View past appointment records")
                        .font(Font.custom("Avenir", size: 15))
                        .foregroundStyle(Color.blue)
                }
                .padding(.horizontal,20)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: CreateNewAppt(), label: {
                        Text("Schedule New Appointment")
                            .font(Font.custom("Avenir", size: 24))
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .background(Color("DarkBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    )
                    Spacer()
                }
                .padding(.top, 50)
                
                HStack {
                    Spacer()
                    Button { isAuthenticated = false } label: {
                        Text("Logout")
                            .font(Font.custom("Avenir", size: 18))
                            .padding(5)
                            .padding(.horizontal, 10)
                            .background(Color("DarkBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                }
                .padding(10)
            }
            
            .background(Color("OffWhite"))
        }
    }
}

struct HomePortalProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomePortalProvider(isAuthenticated: .constant(true))
    }
}
