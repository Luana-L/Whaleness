//
//  TreatBubbleView.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct TreatBubbleView: View {
    var treatment: Treatment
    
    var body: some View {
        NavigationLink(destination: TreatDetailView(treatment_det: treatment)) {
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(treatment.steps.prefix(2).indices, id: \.self) { index in
                        HStack(alignment: .top, spacing: 5) {
                            Text("\(index + 1).")
                                .fontWeight(.bold)
                            Text(treatment.steps[index])
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        .foregroundStyle(Color("DarkGrey"))
                    }
                }
                .padding(5)
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
    TreatBubbleView(treatment: Treatment.MOCK_TREAT[1])
}
