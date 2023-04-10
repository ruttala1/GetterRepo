//
//  EdTechPlatformAppApp.swift
//  EdTechPlatformApp
//
//  Created by Dhruv Ruttala on 2/27/23.
//

import SwiftUI

@main
struct EdTechPlatformApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
