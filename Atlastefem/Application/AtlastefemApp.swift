//
//  AtlastefemApp.swift
//  Atlastefem
//
//  Created by Jmorgaz on 12/12/20.
//

import SwiftUI
import Combine

@main
struct AtlastefemApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
