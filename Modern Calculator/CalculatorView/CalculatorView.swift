//
//  CalculatorView.swift
//  Modern Calculator
//
//  Created by Tipu Sultan on 12/22/24.
//

import SwiftUI

struct CalculatorView: View {
    @State private var input: String = ""
    @State private var history: [String] = []

    let buttons: [[String]] = [
        ["AC", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "", "="]
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Settings and purchase buttons
                
                    HStack {
                        // Navigation to SettingsView
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape")
                                .foregroundColor(.orange)
                                .frame(width: 30, height: 30)
                                .background(Color(.systemGray5))
                                .cornerRadius(15)
                        }


                        Spacer()

                        // Navigation to PurchaseView (Placeholder for now)
                        NavigationLink(destination: Text("Purchase Page")) {
                            Image(systemName: "cart")
                                .foregroundColor(.orange)
                                .frame(width: 30, height: 30)
                                .background(Color(.systemGray5))
                                .cornerRadius(15)
                        }
                    }
                    .padding()
                    .padding(.top)
                
                

                // History View
                ScrollViewReader { proxy in
                    ScrollView {
                        HStack {
                            Spacer()
                            VStack(alignment: .trailing) {
                                ForEach(history.indices, id: \.self) { index in
                                    Text(history[index])
                                        //.font(.system(size: index == history.count - 1 ? 35 : 25))
                                        //.foregroundColor(index == history.count - 1 ? Color.white : Color.gray)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.gray)
                                        .bold(index == history.count - 1)
                                        .id(index)
                                }
                            }
                        }
                    }
                    .onChange(of: history) { _ in
                        if let lastIndex = history.indices.last {
                            proxy.scrollTo(lastIndex, anchor: .bottom)
                        }
                    }
                }
                .padding()

                // Input Display
                Text(input.isEmpty ? "0" : input)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                    //.background(Color(.systemGray5))
                    .foregroundColor(.white)

                // Calculator Buttons
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                handleInput(button)
                            }) {
                                Text(button)
                                    .font(.title)
                                    .frame(width: 65, height: 65)
                                    .background(button.isOperator ? Color.orange : Color(.systemGray4))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }

    func handleInput(_ button: String) {
        switch button {
        case "AC":
            input = ""
            history = []
        case "+/-":
            if let value = Double(input) {
                input = String(value * -1)
            }
        case "%":
            if let value = Double(input) {
                input = String(value / 100)
            }
        case "=":
            calculateResult()
        case "+", "-", "×", "÷":
            input += " \(button) "
        default:
            input += button
        }
    }

    func calculateResult() {
        let expression = input.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/")
        let exp = NSExpression(format: expression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            history.append("\(input) = \(result.stringValue)")
            input = result.stringValue
        }
    }
}

extension String {
    var isOperator: Bool {
        return ["+", "-", "×", "÷", "="].contains(self)
    }
}

#Preview {
    CalculatorView()
}
