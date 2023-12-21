//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

import SwiftUI

public extension Navigator {
    
    func push(_ builder: () -> some View) {
        let controller = builder().viewController()
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        self.navigationController.popToRootViewController(animated: true)
    }
    
    func popTo(name: String) {
        let controllers = self.navigationController.viewControllers
        controllers.forEach {
            if $0.identifier == name {
                self.navigationController.popToViewController($0, animated: true)
            }
        }
    }
}
