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
            HStack {
                Text("Patient Records")
                    .font(Font.custom("Avenir-Medium",size:25))
                    .foregroundStyle(Color("DarkBlue"))
                Spacer()
            }
            
            PatientBubbleView(patient: patient)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("RISK ALERT: SEPSIS")
                    .font(Font.custom("Avenir-Medium", size:20))
                    .foregroundStyle(Color.red)
                Text("Finley reported feeling nausea and slurred speech in the last two days.")
                    .font(Font.custom("Avenir", size:20))
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color("LightGrey"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)
                Spacer()
            }
                
            VStack(alignment: .leading, spacing: 10) {
                Text("Vitals")
                    .font(Font.custom("Avenir-Medium", size:20))
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
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color("LightGrey"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 20)
                Spacer()
            }
                
            VStack(alignment: .leading, spacing: 10) {
                Text("Medication")
                    .font(Font.custom("Avenir-Bold", size:20))
                    .foregroundColor(Color("DarkGrey"))
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Penicillin")
                    }
                    .foregroundStyle(Color("DarkGrey"))
                    Spacer()
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color("LightGrey"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 20)
                Spacer()
            }
                
        }
        
    }
}

#Preview {
    PatientRecords(patient: Patient.MOCK_PATIENTS[0])
}
