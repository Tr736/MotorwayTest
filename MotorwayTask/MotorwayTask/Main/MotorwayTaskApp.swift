//
//  MotorwayTaskApp.swift
//  MotorwayTask
//
//  Created by Thomas Richardson on 25/01/2023.
//

import SwiftUI

@main
struct MotorwayTaskApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(randomWordGenerator: RandomWordGenerator()))
        }
    }
}
