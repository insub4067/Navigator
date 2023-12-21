//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

#if canImport(SwiftUI)
import SwiftUI

public class ViewWrapper<Content: View>: UIHostingController<Content> {
    
    public init(
        identifier: String,
        backgroundColor: UIColor = .systemBackground,
        @ViewBuilder content: () -> Content)
    {
        super.init(rootView: content())
        self.identifier = identifier
        self.view.backgroundColor = backgroundColor
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    
    private static var identifierKey: UInt8 = 0
    
    var identifier: String {
        get {
            return objc_getAssociatedObject(self, &UIViewController.identifierKey) as? String ?? ""
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.identifierKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
#endif

