//
//  CalendarView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Calendar")
                    .font(.largeTitle)
                    .bold()
                
                Text("Traffic-light days will be displayed here")
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Calendar")
        }
    }
}

#Preview {
    CalendarView()
}
