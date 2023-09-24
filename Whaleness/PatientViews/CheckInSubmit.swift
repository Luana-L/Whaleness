//
//  CheckInSubmit.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/24/23.
//

import SwiftUI

struct CheckInSubmit: View {
    var body: some View {
        NavigationView{
            
            VStack (alignment: .leading){
                Image("dark-background-finley")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 30)
                
                HStack{
                    Text("Thank you!")
                        .font(Font.custom("Avenir", size: 30))
                        .foregroundStyle(Color("DarkBlue"))
                    Spacer()
                }
                NavigationLink(destination: CheckInPortal()) {
                    Text("Submit another CheckIn?")
                        .font(Font.custom("Avenir", size: 18))
                        .foregroundStyle(Color.blue)
                }
                
                NavigationLink(destination: ChatPortal()) {
                    Text("Talk to someone?")
                        .font(Font.custom("Avenir", size: 18))
                        .foregroundStyle(Color.blue)
                }
            }
            
            
            .padding(.leading, 20)
            .padding(.vertical, 10)
            
        }
    }
}

#Preview {
    CheckInSubmit()
}
