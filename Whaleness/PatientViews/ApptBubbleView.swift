//
//  ApptBubbleView.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct ApptBubbleView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter
    }
    
    var apptment: Appointment
    
    var body: some View {
        NavigationLink(destination: ApptDetailView(appt: apptment)) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Date: \(apptment.date, formatter: dateFormatter)")
                        Spacer()
                        Text(apptment.date, formatter: timeFormatter)
                    }
                    .font(Font.custom("Avenir",size:15))
                    .foregroundColor(Color("DarkGrey"))
                    
                    Text(apptment.location)
                        .font(Font.custom("Avenir",size:18))
                        .foregroundColor(.primary)
                        .bold()
                    HStack{
                        Text("View Details")
                            .font(Font.custom("Avenir",size:18))
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.blue)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color("LightGrey"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .lineLimit(1)
        .truncationMode(.tail)
    }
}

#Preview {
            ApptBubbleView(apptment: Appointment.MOCK_APPT[0])
}
