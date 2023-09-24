//
//  WhalenessApp.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI
import ParseSwift

struct ParseSetup {
    static func initialize() {
        ParseSwift.initialize(applicationId: "vm5nJ1rjTWnF6Auf9WzZyPp8qGkbdkrnRVRCI8ZI",
                              clientKey: "hXGoi0yau4ZMLOzwIWvhQr13JonXB5dICo9zoRP3",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
    }
}


@main
struct WhalenessApp: App {
    init() {
        /*
        for fontFamily in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: fontFamily) {
                print("__ \(font)")
            }
        }*/
        ParseSetup.initialize()
        
        var score = GameScore()
        score.playerName = "Kingsley"
        score.points = 13

        // Save to your server asynchronously (preferred way) - Performs work on background queue and returns to specified callbackQueue.
        // If no callbackQueue is specified it returns to main queue.
        score.save { result in
            switch result {
            case .success(let savedScore):
                print("✅ Parse Object SAVED!: Player: \(String(describing: savedScore.playerName)), Score: \(String(describing: savedScore.points))")
            case .failure(let error):
                assertionFailure("Error saving: \(error)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
        }
    }
}

struct GameScore: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    // All custom properties must be optional.
    var playerName: String?
    var points: Int?
}

// Sample Usage
//
// var score = GameScore()
// score.playerName = "Kingsley"
// score.points = 13

// OR Implement a custom initializer (OPTIONAL i.e. NOT REQUIRED)
// It's recommended to place custom initializers in an extension
// to preserve the memberwise initializer.
extension GameScore {

    // Use the init to set your custom properties
    // NOTE: Properties in custom init are NOT required to be optional
    init(playerName: String, points: Int) {
        self.playerName = playerName
        self.points = points
    }
}
