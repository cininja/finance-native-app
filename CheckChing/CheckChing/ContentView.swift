//
//  ContentView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            OverviewView()
                .tabItem {
                    Label("Overview", systemImage: "house")
                }
            
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            GoalsView()
                .tabItem {
                    Label("Goals", systemImage: "target")
                }
        }
    }
}

#Preview {
    ContentView()
}
