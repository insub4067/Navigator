//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

import SwiftUI

@MainActor public extension Navigator {
    
    func present(_ builder: () -> some View) {
        let controller = builder().viewController()
        self.latestController.present(controller, animated: true)
    }
    
    func dismiss() {
        self.latestController.dismiss(animated: true)
    }
}
