import Foundation

struct Treatment: Identifiable {
    let id = UUID()
    var steps: [String]
    var doctor: String
    var notes: String?
}

extension Treatment {
    static var MOCK_TREAT: [Treatment] = [
        Treatment(steps: ["Report symptoms daily", "Take 775mg of penicillin daily"], doctor: "Stan Bradley"),
        Treatment(steps: ["If you get a fever, control it with aspirin and report the symptom.", "Drink plenty of fluids to help bring up phlegm.", "Avoid taking any cough medicines--if it is preventing you from getting rest, call us.", "Use a humidifer to help open airways and ease your breathing. Immediately inform us if your breathing gets worse instead of better over time."], doctor: "Phoebe Lewis"),
    ]
}
