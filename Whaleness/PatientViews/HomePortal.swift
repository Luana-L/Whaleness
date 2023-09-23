//
//  Admin.swift
//  Pro-G
//
//  Created by Luana Liao on 6/26/23.
//

import SwiftUI

struct HomePortal: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Welcome Finley!")
                    .font(Font.custom("Avenir-Medium", size: 30))
                    .foregroundStyle(Color("DarkBlue"))
                Spacer()
            }
            .padding(.vertical, 10)
            Text("Upcoming appointments...")
                .font(Font.custom("Avenir", size: 20))
            Text("Hello, World!")
                .background(RoundedRectangle(cornerRadius: 4).stroke())
        }
        .padding(.leading, 20)
        .background(Color("OffWhite"))
    }
}

struct HomePortal_Previews: PreviewProvider {
    static var previews: some View {
        HomePortal()
    }
}
