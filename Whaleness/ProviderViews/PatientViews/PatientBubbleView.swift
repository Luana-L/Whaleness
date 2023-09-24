//
//  PatientBubbleView.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct PatientBubbleView: View {
    
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
    
    var patient: Patient
    
    var body: some View {
        NavigationLink(destination: PatientRecords(patient: patient)) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        if let nextAppt = patient.nextAppt {
                            Text("Date: \(nextAppt, formatter: dateFormatter)")
                        } else if let lastAppt = patient.lastAppt {
                            Text("Date: \(lastAppt, formatter: dateFormatter)")
                        } else {
                            Text("No appointments")
                        }
                        Spacer()
                        if let lastAppointment = patient.lastAppt {
                            Text(lastAppointment, formatter: timeFormatter)
                        }
                    }
                    .font(Font.custom("Avenir",size:15))
                    .foregroundColor(Color("DarkGrey"))
                    
                    
                    HStack{
                        Image(patient.imgName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:20)
                        Text(patient.name)
                            .font(Font.custom("Avenir",size:18))
                    }
                    
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
    }
}

#Preview {
    PatientBubbleView(patient: Patient.MOCK_PATIENTS[0])
}
