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
    }
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
        }
    }
}
