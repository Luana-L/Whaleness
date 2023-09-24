//
//  ApptDetailView.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct ApptDetailView: View {
    var appt: Appointment
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    Text("\(appt.location)")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 30)
                    
                    Text("Date: \(appt.date, formatter: dateFormatter)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                    
                    Text("Doctor: \(appt.doctor)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 20)
                    
                }
                .padding(.horizontal, 25)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitle(appt.location)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}



#Preview {
    ApptDetailView(appt: Appointment.MOCK_APPT[0])
}
