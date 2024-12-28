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
        ["AC", "(", "%", "+/-", "="],
        ["7", "8", "9", "÷", "√x"],
        ["4", "5", "6", "×", "⌫"],
        ["1", "2", "3", "-", "↵"],
        ["", "0", ".", "+", ""]
    ]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 8) {
                    ForEach(row, id: \.self) { button in
                        if button.isEmpty {
                            Spacer() // Empty buttons for alignment
                        } else {
                            Button(action: {
                                handleButtonPress(button)
                            }) {
                                Text(button)
                                    .font(.system(size: 24))
                                    .frame(width: buttonWidth(button: button), height: 60)
                                    .background(buttonBackgroundColor(button: button))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    // Handle button press
    func handleButtonPress(_ button: String) {
        NotificationCenter.default.post(name: .calculatorKeyPressed, object: button)
    }

    // Determine button background color
    func buttonBackgroundColor(button: String) -> Color {
        if ["+", "-", "×", "÷", "=", "√x", "↵", "⌫"].contains(button) {
            return Color.orange
        } else if button == "AC" {
            return Color.red
        } else {
            return Color.gray.opacity(0.9)
        }
    }

    // Determine button width
    func buttonWidth(button: String) -> CGFloat {
        if button == "0" {
            return (UIScreen.main.bounds.width - 48) / 4 * 2 + 8 // Double width for "0"
        }
        return (UIScreen.main.bounds.width - 48) / 5 // Standard width
    }
}

extension String {
    var isOperator: Bool {
        ["+", "-", "×", "÷", "="].contains(self)
    }
}

extension Notification.Name {
    static let calculatorKeyPressed = Notification.Name("calculatorKeyPressed")
}

#Preview {
    CalculatorKeyboardView()
}
