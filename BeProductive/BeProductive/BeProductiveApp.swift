//
//  BeProductiveApp.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//
import SwiftUI
import Firebase

@main
struct BeProductiveApp: App {
    init() {
        FirebaseApp.configure() // Configure Firebase
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GoalStore())
        }
    }
}
