//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI
import Shifts

@main
struct CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ShiftsCoordinator().root
        }
    }
}
