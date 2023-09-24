//
//  PatientTreatment.swift
// this is patient detail view
//  Whaleness
//
//  Created by Jennifer Chiu on 9/24/23.
//

import SwiftUI

struct Treatments {
    var name: String
}

struct PatientTreatment: View {
    @State private var treatment = [Treatments(name: "")
    ]
    @State private var newTreatment = ""
    
    var patient: Patient
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            HStack {
                Text("Patient Treatment")
                    .font(Font.custom("Avenir",size:30))
                    .foregroundStyle(Color("DarkBlue"))
            }
            
            PatientBubbleView(patient: patient)
            
            HStack {
                Image(systemName: "message.fill")
                Text("Send message") // this would navigate to chatbot
                    .font(Font.custom("AvenirNext-Bold", size:15))
            }
            .foregroundStyle(Color("DarkBlue"))
            
            Text("Currently Tracking")
                .font(Font.custom("Avenir", size:20))
                .foregroundStyle(Color("DarkGrey"))
            VStack(spacing: 10) {
                VStack(spacing: 5) {
                    Text("• Fever")
                        .font(Font.custom("Avenir", size:15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(spacing: 5) {
                    Text("• Nausea")
                        .font(Font.custom("Avenir", size:15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(spacing: 5) {
                    Text("• Slurred speech")
                        .font(Font.custom("Avenir", size:15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack(spacing: 5) {
                    Text("• Muscle pain")
                        .font(Font.custom("Avenir", size:15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack(alignment: .top, spacing: 10) {
                    TextField("Add custom treatment", text: $newTreatment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if !newTreatment.isEmpty {
                            let insertIndex = treatment.count - 1
                            treatment.insert(Treatments(name: newTreatment), at: insertIndex)
                            newTreatment = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("LightGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text("Medication")
                .font(Font.custom("Avenir", size:20))
                .foregroundColor(Color("DarkGrey"))
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Penicillin (775mg/day)")
                        .font(Font.custom("Avenir", size:15))
                }
            .foregroundStyle(Color("DarkGrey"))
            .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("LightGrey"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    
}

#Preview {
    PatientRecords(patient: Patient.MOCK_PATIENTS[0])
}
