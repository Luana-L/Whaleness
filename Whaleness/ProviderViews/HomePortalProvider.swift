//
//  HomePortalProvider.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct HomePortalProvider: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                HStack{
                    Text("Welcome!")
                        .font(Font.custom("Avenir-Medium", size: 30))
                        .foregroundStyle(Color("DarkBlue"))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.vertical, 10)
                Text("Upcoming appointments...")
                    .padding(.leading, 20)
                    .font(Font.custom("Avenir", size: 20))
                VStack(spacing: 10) {
                    ForEach(Appointment.MOCK_APPT.sorted(by: { $0.date < $1.date }).prefix(3)) { appt in
                        ApptBubbleView(apptment: appt)
                    }
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    Text("View past appointment records")
                        .font(Font.custom("Avenir", size: 20))
                        .foregroundStyle(Color.blue)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 20)
                
            }
            
            .background(Color("OffWhite"))
        }
    }
}

struct HomePortalProvider_Previews: PreviewProvider {
    static var previews: some View {
        HomePortalProvider()
    }
}
