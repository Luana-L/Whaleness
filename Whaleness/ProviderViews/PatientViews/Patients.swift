//
//  Patients.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct Patients: View {
    
    var body: some View {
        
        
        VStack(spacing: 10) {
            
            Text("Patients")
                .padding(.leading)
                .font(Font.custom("Avenir", size: 30))
                .foregroundStyle(Color("DarkBlue"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(Patient.MOCK_PATIENTS) { patient in
                PatientBubbleView(patient: patient)
            }
        }
        
        .padding(.horizontal, 25)
    }
}

#Preview {
    Patients()
}
