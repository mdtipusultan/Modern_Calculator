////
////  KeyboardViewController.swift
////  CalculatorKeyboard
////
////  Created by MacBook Pro M1 Pro on 12/24/24.
////
//
//import UIKit
//
//class KeyboardViewController: UIInputViewController {
//
//    @IBOutlet var nextKeyboardButton: UIButton!
//    
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        
//        // Add custom view sizing constraints here
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//        
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//        
//        self.view.addSubview(self.nextKeyboardButton)
//        
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//    }
//    
//    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
//        super.viewWillLayoutSubviews()
//    }
//    
//    override func textWillChange(_ textInput: UITextInput?) {
//        // The app is about to change the document's contents. Perform any preparation here.
//    }
//    
//    override func textDidChange(_ textInput: UITextInput?) {
//        // The app has just changed the document's contents, the document context has been updated.
//        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
//    }
//
//}


import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
    private var hostingController: UIHostingController<CalculatorKeyboardView>?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the SwiftUI keyboard view
        let calculatorKeyboardView = CalculatorKeyboardView()

        // Embed the SwiftUI view in a hosting controller
        hostingController = UIHostingController(rootView: calculatorKeyboardView)

        // Add the hosting controller's view to the keyboard's view hierarchy
        if let hostingView = hostingController?.view {
            hostingView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(hostingView)
            addChild(hostingController!)
            hostingController?.didMove(toParent: self)

            // Constrain the SwiftUI view to fill the entire keyboard area
            NSLayoutConstraint.activate([
                hostingView.topAnchor.constraint(equalTo: view.topAnchor),
                hostingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                hostingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }


        // Listen for button presses
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyPress(_:)), name: .calculatorKeyPressed, object: nil)
    }

    @objc func handleKeyPress(_ notification: Notification) {
        guard let button = notification.object as? String else { return }

        switch button {
        case "AC":
            // Clear input
            textDocumentProxy.deleteBackward() // Clear last character (use loop for full clear if needed)
        case "=":
            // Perform calculation
            if let result = calculateExpression() {
                // Get the current input and append the result
                if let input = textDocumentProxy.documentContextBeforeInput {
                    textDocumentProxy.insertText(" = \(result)")  // Append result to the input
                }
            }
        case "+", "-", "×", "÷":
            // Append operator with spaces for readability
            textDocumentProxy.insertText(" \(button) ")
        default:
            // Append numeric or decimal inputs
            textDocumentProxy.insertText(button)
        }
    }

    /// Function to evaluate the mathematical expression
    func calculateExpression() -> String? {
        // Fetch current text from the input field
        guard let input = textDocumentProxy.documentContextBeforeInput else { return nil }
        
        // Replace symbols to make them compatible with NSExpression
        let expression = input
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
        
        // Use NSExpression to evaluate the result
        let exp = NSExpression(format: expression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            return String(describing: result)
        }
        return nil
    }




    deinit {
        NotificationCenter.default.removeObserver(self, name: .calculatorKeyPressed, object: nil)
    }
}

//extension Notification.Name {
//    static let calculatorKeyPressed = Notification.Name("calculatorKeyPressed")
//}
