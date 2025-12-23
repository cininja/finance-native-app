//
//  AddExpenseView.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import SwiftUI

enum PaymentMethod: String, CaseIterable, Identifiable {
    case bank = "Bank"
    case cash = "Cash"
    var id: String { rawValue }
}

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var amountText: String = ""
    @State private var method: PaymentMethod = .bank

    let onSave: (Int, PaymentMethod) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Amount") {
                    TextField("e.g. 12.50", text: $amountText)
                        .keyboardType(.decimalPad)
                }

                Section("Payment Method") {
                    Picker("Method", selection: $method) {
                        ForEach(PaymentMethod.allCases) { m in
                            Text(m.rawValue).tag(m)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section {
                    Button("Save") {
                        let cents = parseToCents(amountText)
                        guard cents > 0 else { return }
                        onSave(cents, method)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }

    private func parseToCents(_ text: String) -> Int {
        // Accept "12.34" or "12,34"
        let normalized = text.replacingOccurrences(of: ",", with: ".")
        guard let value = Double(normalized) else { return 0 }
        return Int((value * 100).rounded())
    }
}
