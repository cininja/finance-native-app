//
//  GoalsView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Goals")
                    .font(.largeTitle)
                    .bold()
                
                Text("Savings goal estimation will be displayed here.")
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Goals")
        }
    }
}

#Preview {
    GoalsView()
}
