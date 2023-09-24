//
//  ProviderAppointment.swift
//  Whaleness
//
//  Created by Jenny Ye on 9/23/23.
//

import Foundation

struct ProviderAppointment: Identifiable {
    let id = UUID()
    var date: Date = Date()
    var location: String
    var patient: String
    var notes: String?
}

extension ProviderAppointment {
    static var MOCK_APPT: [ProviderAppointment] = [
        ProviderAppointment(date: Date(month: 9, day: 25, year: 2023, hour: 14, minute: 30), location: "Mt. Sinai Morningside", patient: "Finnick Whale"),
        ProviderAppointment(date: Date(month: 10, day: 25, year: 2023, hour: 8, minute: 30), location: "Mt. Sinai Morningside", patient: "Finnie Whale"),
    ]
}

