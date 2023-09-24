//
//  LandingPage.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

struct LandingPage: View {
    // user type selected, either patient or provider
    var body: some View {
        NavigationView {
            ZStack {
                Color("OffWhite").ignoresSafeArea()
                VStack(spacing: 15){
                    Image("dark-background-finley")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top, 30)
                    Text("Hi, I'm Finley. Welcome to")
                        .font(Font.custom("Avenir", size: 20))
                    Text("Whaleness")
                        .kerning(2)
                        .font(Font.custom("AvenirNext-BoldItalic", size: 40))
                    Text("your personal aftercare assistant! To get started, please let us know whether you are a...")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("Avenir", size: 20))
                        .padding(.horizontal, 10)
                    
                    NavigationLink(destination: LoginView(isPatient: .constant(false))) {
                        Text("Provider")
                            .frame(width: 300, height: 45)
                            .background( Color("DarkBlue"))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .font(Font.custom("Avenir",size: 20))
                            .padding(20)
                    }
                    .offset(y: 30)
                    
                    NavigationLink(destination: LoginView(isPatient: .constant(true))) {
                        Text("Patient")
                            .frame(width: 300, height: 45)
                            .background( Color("DarkBlue"))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .font(Font.custom("Avenir", size: 20))
                            .padding(20)
                    }
                }
                .frame(width: 350)
            }
        }
    }
}

#Preview {
    LandingPage()
}
