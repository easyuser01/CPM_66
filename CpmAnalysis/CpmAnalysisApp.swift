//
//  CpmAnalysisApp.swift
//  CpmAnalysis
//

import SwiftUI

@main
struct FinecalculatorApp: App {
    @StateObject var vm = CpmViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
