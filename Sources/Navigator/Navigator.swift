// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public class Navigator {
    
    let navigationController: UINavigationController
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
}

public extension Navigator {
    
    func start(_ builder: () -> some View) {
        let view = builder().viewController()
        self.navigationController.setViewControllers([view], animated: false)
    }
}
