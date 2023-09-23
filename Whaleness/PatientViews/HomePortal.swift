//
//  Admin.swift
//  Pro-G
//
//  Created by Luana Liao on 6/26/23.
//

import SwiftUI

struct HomePortal: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Welcome Finley!")
                    .font(Font.custom("Avenir-Medium", size: 30))
                    .foregroundStyle(Color("DarkBlue"))
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.vertical, 10)
            Text("Upcoming appointments...")
                .padding(.leading, 20)
                .font(Font.custom("Avenir", size: 20))
            VStack(spacing: 5) {
                ForEach(Appointment.MOCK_APPT.sorted(by: { $0.date < $1.date }).prefix(3)) { appt in
                    ApptBubbleView(apptment: appt)
                }
            }
            .padding(15)

        }
        
        .background(Color("OffWhite"))
    }
}

struct HomePortal_Previews: PreviewProvider {
    static var previews: some View {
        HomePortal()
    }
}
