////
////  Modern_CalculatorApp.swift
////  Modern Calculator
////
////  Created by Tipu Sultan on 12/22/24.
////
//
//import SwiftUI
//
//@main
//struct Modern_CalculatorApp: App {
//    var body: some Scene {
//        WindowGroup {
//            CalculatorView()
//        }
//    }
//}


import SwiftUI

@main
struct Modern_CalculatorApp: App {
    init() {
//        // Set global appearance for all views
//        UITabBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UITableView.appearance().backgroundColor = .black
//        UITableViewCell.appearance().backgroundColor = .black
    }

    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .background(Color.black) // Set the background color for the first view
                .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
        }
    }
}
