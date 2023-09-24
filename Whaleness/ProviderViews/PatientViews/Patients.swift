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
            ForEach(Patient.MOCK_PATIENTS) { patient in
                PatientBubbleView(patient: patient)
            }
        }
    }
}

#Preview {
    Patients()
}
