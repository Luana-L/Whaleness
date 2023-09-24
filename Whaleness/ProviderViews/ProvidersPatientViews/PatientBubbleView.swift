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
                Image(patient.imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height:50)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text(patient.name)
                        .font(Font.custom("Avenir",size:20))
                        .foregroundColor(Color("DarkBlue"))
                    
                    HStack {
                        if let nextAppt = patient.nextAppt {
                                Text("\(nextAppt, formatter: dateFormatter)")
                            } else if let lastAppt = patient.lastAppt {
                                Text("\(lastAppt, formatter: dateFormatter)")
                            } else {
                                Text("No appointments")
                            }
                            Spacer()
                    
                    }
                    .font(Font.custom("Avenir",size:15))
                    .foregroundColor(Color("DarkGrey"))
                    
                    
                        
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
    PatientBubbleView(patient: Patient.MOCK_PATIENTS[1])
}
