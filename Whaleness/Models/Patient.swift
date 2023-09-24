//
//  AllPatients.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import Foundation

struct Patient: Identifiable {
    let id = UUID()
    var lastAppt: Date?
    var nextAppt: Date?
    var name: String
    var imgName: String
}

extension Patient {
    static var MOCK_PATIENTS: [Patient] = [
        Patient(lastAppt: Date(month: 9, day: 13, year: 2023, hour: 9, minute: 00), name: "Finley Whale", imgName: "dark-background-finley"),
        Patient(nextAppt: Date(month: 9, day: 25, year: 2023, hour: 9, minute: 30), name: "Finnick Whale", imgName: "orca"),
        Patient(nextAppt: Date(month: 10, day: 10, year: 2023, hour: 10, minute: 00), name: "Frannie Whale", imgName: "beluga"),
        Patient(lastAppt: Date(month: 9, day: 5, year: 2023, hour: 10, minute: 30), name: "Finnie Whale", imgName: "beluga2"),
        Patient(lastAppt: Date(month: 9, day: 16, year: 2023, hour: 11, minute: 00), name: "Francesca Whale", imgName: "narwhal"),
    ]
}
