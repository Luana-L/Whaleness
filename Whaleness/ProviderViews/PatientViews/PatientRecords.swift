//
//  PatientRecords.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct PatientRecords: View {
    var patient: Patient
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            PatientBubbleView(patient: patient)
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("RISK ALERT: SEPSIS")
                        .font(Font.custom("Avenir-Bold", size:20))
                        .foregroundStyle(Color.red)
                    Text("Finley reported feeling nausea and slurred speech in the last two days.")
                        .font(Font.custom("Avenir-Bold", size:20))
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("VITALS")
                        .font(Font.custom("Avenir-Bold", size:20))
                        .foregroundColor(Color("DarkGrey"))
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Blood pressure - low")
                            Text("Blood oxygen - low")
                            Text("Temperature - normal")
                        }
                        .foregroundStyle(Color("DarkGrey"))
                        Spacer()
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color("LightGrey"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 20)
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
}

#Preview {
    PatientRecords(patient: Patient.MOCK_PATIENTS[0])
}
