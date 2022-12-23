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
    private let container = DefaultDependencyContainer()

    var body: some Scene {
        WindowGroup {
            ShiftsCoordinator(container: container).root
        }
    }
}
