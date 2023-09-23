//
//  WhalenessApp.swift
//  Whaleness
//
//  Created by Luana Liao on 9/23/23.
//

import SwiftUI

@main
struct WhalenessApp: App {
    /*
    init() {
        for fontFamily in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: fontFamily) {
                print("__ \(font)")
            }
        }
    }*/
    
    var body: some Scene {
        WindowGroup {
            LandingPage()
        }
    }
}
