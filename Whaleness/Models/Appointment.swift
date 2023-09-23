//
//  Appointment.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import Foundation

extension Date {
    init(month: Int, day: Int, year: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dateComponents = DateComponents()
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.year = year
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = .current
        dateComponents.calendar = .current
        self = Calendar.current.date(from: dateComponents) ?? Date()
    }
}

struct Appointment: Identifiable {
    let id = UUID()
    var date: Date = Date()
    var location: String
    var doctor: String
    var notes: String?
}

extension Appointment {
    static var MOCK_APPT: [Appointment] = [
        Appointment(date: Date(month: 10, day: 8, year: 2023, hour: 9, minute: 00), location: "Uptown Dental Group", doctor: "Stan Bradley"),
        Appointment(date: Date(month: 11, day: 10, year: 2023, hour: 16, minute: 00), location: "Mt. Sinai Morningside", doctor: "Phoebe Lewis"),
        Appointment(date: Date(month: 12, day: 3, year: 2023, hour: 11, minute: 30), location: "Sterling Optical", doctor: "Finny Lee"),
        Appointment(date: Date(month: 1, day: 5, year: 2024, hour: 15, minute: 15), location: "Mt. Sinai Morningside", doctor: "Eric Ashworth"),
    ]
}
