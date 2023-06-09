//
//  TicTacToeFeb13App.swift
//  TicTacToeFeb13
//
//  Created by Dhruv Ruttala on 2/13/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
