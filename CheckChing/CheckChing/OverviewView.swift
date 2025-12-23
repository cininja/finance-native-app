//
//  OverviewView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Overview")
                    .font(.largeTitle)
                    .bold()
                
                Text("Bank: €0.00")
                Text("Cash: €0.00")
                Text("Total: €0.00")
                
                Spacer()
            }
            .padding()
            .navigationTitle("Overview")
        }
    }
}

#Preview {
    OverviewView()
}
