//
//  CreateNewAppt.swift
//  Whaleness
//
//  Created by Luana Liao on 9/24/23.
//

import SwiftUI

struct CreateNewAppt: View {
    @State private var selectedDate: Date = {
        let now = Date()
        let finalDate = Date(month: Calendar.current.component(.month, from: now),
                             day: Calendar.current.component(.day, from: now),
                             year: Calendar.current.component(.year, from: now),
                             hour: 23, minute: 59, second: 0)
        return finalDate
    }()
    @State private var location = ""
    @State private var doctor = ""
    @State private var patient = ""
    @State private var notes = ""
    
    @State private var message = ""
    @State private var showAlert = false
    
    
    //disable create button if either username or pass left empty
    var isCreateApptDisabled: Bool { [location, doctor, patient].contains(where: \.isEmpty) }
    
    var body: some View {
        ZStack {
            VStack(spacing: 15){
                Text("Create New Appointment")
                    .font(Font.custom("Avenir-Bold", size:30))
                    .foregroundStyle(Color("DarkBlue"))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Group{
                    HStack {
                        Label{
                            Text("Date")
                                .padding(.leading, 5)
                        } icon: {
                            Image(systemName: "calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(1)
                                .frame(width: 22, height: 22)
                                .padding(5)
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(5)
                        }
                        Spacer()
                        DatePicker("", selection: $selectedDate, in: Date()...,  displayedComponents: .date)
                            .accentColor(Color("DarkBlue"))
                            .labelsHidden()
                    }
                    .padding(15)
                    
                    HStack {
                        Label{
                            Text("Time")
                                .padding(.leading, 5)
                        } icon: {
                            Image(systemName: "clock.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(1)
                                .frame(width: 22, height: 22)
                                .padding(5)
                                .foregroundColor(.white)
                                .background(.red)
                                .cornerRadius(5)
                        }
                        Spacer()
                        DatePicker("", selection: $selectedDate, in: Date()...,  displayedComponents: .hourAndMinute)
                            .accentColor(Color("DarkBlue"))
                            .labelsHidden()
                    }
                    .padding(15)
                    
                    HStack {
                        Spacer(minLength: 15)
                        Image(systemName: "location.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.blue)
                        TextField("Location", text: $location)
                            .padding(.leading, 5)
                        Spacer(minLength: 15)
                    }
                    
                    
                    HStack {
                        Spacer(minLength: 15)
                        Image(systemName: "stethoscope.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.green)
                        TextField("Doctor", text: $doctor)
                            .padding(.leading, 5)
                        Spacer(minLength: 15)
                    }
                    
                    HStack {
                        Spacer(minLength: 15)
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.purple)
                        TextField("Patient", text: $patient)
                            .padding(.leading, 5)
                        Spacer(minLength: 15)
                    }
                    
                    HStack {
                        Spacer(minLength: 15)
                        Image(systemName: "note.text")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.orange)
                        TextField("(Optional) Any Notes?", text: $notes)
                            .padding(.leading, 5)
                        Spacer(minLength: 15)
                    }
                    
                }
                .frame(height: 50)
                .background(Color("LightGrey"))
                .cornerRadius(10.0)
                
                
                //create appointment button
                Button {
                    create()
                    message = "Press top left to return to home page."
                    showAlert = true
                } label: {
                    Text("Create New Appointment")
                        .frame(width: 250, height: 50)
                        .background(isCreateApptDisabled ? Color("DarkBlue").opacity(0.4) : Color("DarkBlue"))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(Font.system(size:20))
                        .padding(20)
                }
                .offset(y: 60)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Appointment Successfully Created!"), message: Text(message), dismissButton: .default(Text("OK")))
                }
            }
            .frame(width: 350)
            .padding(.top, 10)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(Color("OffWhite"))
        .toolbarColorScheme(.dark, for: .navigationBar)
        
    }
    
    
    func create() {
        let appointment = Appointment(date: selectedDate, location: location, doctor: doctor, patient: patient, notes: notes)
        appointment.save { result in
            switch result {
            case .success(let savedAppt):
                print("✅ Parse Object SAVED!: Date: \(String(describing: savedAppt.date)), Doctor: \(String(describing: savedAppt.doctor))")
            case .failure(let error):
                assertionFailure("Error saving: \(error)")
            }
            
        }
    }
}

#Preview {
    CreateNewAppt()
}
