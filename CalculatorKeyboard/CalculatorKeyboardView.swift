//
//  CalculatorKeyboardView.swift
//  CalculatorKeyboard
//
//  Created by MacBook Pro M1 Pro on 12/24/24.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    @State private var input: String = ""

    let buttons: [[String]] = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"],
        ["AC"]
    ]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            handleButtonPress(button)
                        }) {
                            Text(button)
                                .font(.title2)
                                .frame(width: 30, height: 30)
                                .background(button.isOperator ? Color.orange : Color.gray.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.black)
    }

    func handleButtonPress(_ button: String) {
        // Use NotificationCenter to communicate with KeyboardViewController
        NotificationCenter.default.post(name: .calculatorKeyPressed, object: button)
    }
}

extension String {
    var isOperator: Bool {
        ["+", "-", "×", "÷", "="].contains(self)
    }
}



#Preview {
    CalculatorKeyboardView()
}


