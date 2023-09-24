//
//  ProviderApptDetailView.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct ProviderApptDetailView: View {
    var provappt: ProviderAppointment
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        
       
        ForEach(ProviderAppointment.MOCK_PROVAPPT) { provappt in
            ProviderApptBubbleView(provapptment: provappt)
        }
        
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitle(provappt.location)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    ProviderApptDetailView(provappt: ProviderAppointment.MOCK_PROVAPPT[0])
}
