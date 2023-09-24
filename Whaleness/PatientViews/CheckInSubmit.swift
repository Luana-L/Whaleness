//
//  CheckInSubmit.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/24/23.
//

import SwiftUI

struct CheckInSubmit: View {
    var body: some View {
        HStack{
            Text("Thank you!")
                .font(Font.custom("Avenir", size: 30))
                .foregroundStyle(Color("DarkBlue"))
            Spacer()
        }
        
        .padding(.leading, 20)
        .padding(.vertical, 10)
        
    }
}

#Preview {
    CheckInSubmit()
}
