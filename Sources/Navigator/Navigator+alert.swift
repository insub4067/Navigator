//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

import UIKit

@MainActor public extension Navigator {
    
    func alert(_ parameter: AlertParameter) {
        let alert = UIAlertController(
            title: parameter.title,
            message: parameter.message,
            preferredStyle: .alert
        )
        parameter.buttons.forEach { button in
            let action = UIAlertAction(
                title: button.title,
                style: button.style,
                handler: { _ in button.action?() }
            )
            alert.addAction(action)
        }
        
        latestController.present(alert, animated: true)
    }
    
    func actionSheet(_ parameter: AlertParameter) {
        let alert = UIAlertController(
            title: parameter.title,
            message: parameter.message,
            preferredStyle: .actionSheet
        )
        parameter.buttons.forEach { button in
            let action = UIAlertAction(
                title: button.title,
                style: button.style,
                handler: { _ in button.action?() }
            )
            alert.addAction(action)
        }
        latestController.present(alert, animated: true)
    }
}

public struct AlertParameter {
    
    let title: String?
    let message: String
    let buttons: [ActionButton]
    
    public init(
        title: String? = .none,
        message: String,
        buttons: [ActionButton]
    ) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

public struct ActionButton {
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
    
    public init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: (() -> Void)? = .none
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}
