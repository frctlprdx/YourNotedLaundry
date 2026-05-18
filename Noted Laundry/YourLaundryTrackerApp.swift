//
//  Noted Laundry.swift
//  Noted Laundry
//
//  Created by Ivan Putra Pratama on 18/04/26.
//

import SwiftUI
import SwiftData

@main
struct YourLaundryTrackerApp: App {
    let historyData: [MonthlyHistory] = MonthlyHistory.groupedDummy

    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("Home", systemImage: "house.fill") {
                    CurrentProgressView()
                }
                Tab("History", systemImage: "clock.fill") {
                    HistoryView(historyData: historyData)
                }
            }
        }
        .modelContainer(for: [CurrentProgress.self, LaundryItem.self])
    }
}


