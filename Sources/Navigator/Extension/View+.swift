//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

import SwiftUI

public extension View {
    
    var identifier: String { "\(Self.self)" }
    
    func viewController(backgroundColor: UIColor = .systemBackground) -> ViewWrapper<Self> {
        .init(
            identifier: self.identifier,
            backgroundColor: backgroundColor,
            content: { self }
        )
    }
    
    func modalViewController(_ parameter: BottomSheetParameter) -> ModalWrapper<Self> {
        .init(
            parameter: parameter,
            content: { self }
        )
    }
}
