// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class Navigator {
    
    fileprivate let navigationController: UINavigationController
    public var view: UIViewController { navigationController }
    
    weak var parent: Navigator?
    var child: Navigator?
    
    final var latestController: UIViewController {
        latestPresentedController ??
        navigationController.topViewController ??
        navigationController
    }
    
    final private var latestPresentedController: UIViewController? {
        var controller: UIViewController? = navigationController
        while let presented = controller?.presentedViewController {
            controller = presented
        }
        return controller
    }
    
    public init(navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
    }
    
    @MainActor public func start(_ builder: () -> some View) {
        let view = builder().viewController()
        self.navigationController.setViewControllers([view], animated: false)
    }
}

@MainActor public extension Navigator {
    
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
