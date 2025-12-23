//
//  OverviewView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

struct OverviewView: View {
    // Temporary in-memory state (we'll persist this later with SwiftData)
    @State private var bankCents: Int = 0
    @State private var cashCents: Int = 0

    @State private var showAddExpense = false

    var totalCents: Int { bankCents + cashCents }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Overview")
                    .font(.largeTitle)
                    .bold()

                VStack(spacing: 8) {
                    Text("Bank: \(formatEUR(bankCents))")
                    Text("Cash: \(formatEUR(cashCents))")
                    Text("Total: \(formatEUR(totalCents))")
                        .bold()
                }

                Button {
                    showAddExpense = true
                } label: {
                    Text("Add Expense")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Overview")
            .sheet(isPresented: $showAddExpense) {
                AddExpenseView(
                    onSave: { amountCents, method in
                        switch method {
                        case .bank:
                            bankCents -= amountCents
                        case .cash:
                            cashCents -= amountCents
                        }
                    }
                )
            }
        }
    }

    private func formatEUR(_ cents: Int) -> String {
        let value = Double(cents) / 100.0
        return value.formatted(.currency(code: "EUR"))
    }
}
