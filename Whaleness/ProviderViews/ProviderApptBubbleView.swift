//
//  ProviderApptBubbleView.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import SwiftUI

struct ProviderApptBubbleView: View {
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
    
    var provapptment: ProviderAppointment
    
    var body: some View {
        
        NavigationLink(destination: ProviderApptDetailView(provappt: provapptment)) {
            VStack(alignment: .leading, spacing: 5) {
                Group {
                    
                    HStack{
                        Text("\(provapptment.date, formatter: dateFormatter)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(provapptment.date, formatter: timeFormatter)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                    
                    
                    Text(provapptment.patient)
                        .font(Font.custom("Avenir",size:20))
                        .font(.subheadline)
                        .foregroundColor(Color("DarkBlue"))
                    
                
                    HStack{
                        Text("View Details")
                            .font(Font.custom("Avenir",size:15))
                            .foregroundColor(.secondary)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
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

#Preview {
    ProviderApptBubbleView(provapptment: ProviderAppointment.MOCK_PROVAPPT[0])
}
