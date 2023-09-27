//
//  WitterApp.swift
//  Witter
//
//  Created by Alice Piccoli on 20/09/2023.
//

import SwiftUI
import Firebase

@main
struct WitterApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
