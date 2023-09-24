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
                    .font(Font.custom("Avenir",size:30))
                    .foregroundStyle(Color("DarkBlue"))
            }
            
            PatientBubbleView(patient: patient)
            
            Text("Insights")
                .font(Font.custom("Avenir", size:20))
                .foregroundStyle(Color("DarkGrey"))
            VStack(spacing: 10) {
                Text("RISK ALERT: SEPSIS")
                    .font(Font.custom("AvenirNext-Bold", size:18))
                    .foregroundStyle(Color.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Finley reported feeling nausea and slurred speech in the last two days.")
                    .font(Font.custom("Avenir", size:15))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("LightGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
                
            VStack(alignment: .leading, spacing: 10) {
                Text("Vitals")
                    .font(Font.custom("Avenir", size:20))
                    .foregroundColor(Color("DarkGrey"))
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Blood pressure - low")
                        Text("Blood oxygen - low")
                        Text("Temperature - normal")
                    }
                .font(Font.custom("Avenir", size:15))
                .foregroundStyle(Color("DarkGrey"))
                .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("LightGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            HStack {
                Spacer()
                NavigationLink(destination: PatientTreatment(patient: patient)) {
                    Text("View treatment plan")
                        .font(Font.custom("Avenir", size: 18))
                        .foregroundStyle(Color.blue)
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Patient Records")
                    .font(Font.custom("Avenir", size:20))
                    .foregroundColor(Color("DarkGrey"))
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("September 13, 2023")
                        Text("September 6, 2023")
                    }
                .font(Font.custom("Avenir", size:15))
                .foregroundStyle(Color("DarkGrey"))
                .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("LightGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
                
        }
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    
}

#Preview {
    PatientRecords(patient: Patient.MOCK_PATIENTS[0])
}
