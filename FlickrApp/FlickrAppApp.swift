//
//  FlickrAppApp.swift
//  FlickrApp
//
//  Created by Neel on 1/15/25.
//

import SwiftUI

@main
struct FlickrAppApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue // Change the background color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Title color
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ImageSearchView()
        }
    }
}
