//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//
#if canImport(SwiftUI)
import PanModal
import SwiftUI

public class ModalWrapper<Content: View>: UIHostingController<Content> {
    
    private let parameter: BottomSheetParameter?
    
    public init(
        parameter: BottomSheetParameter,
        content: () -> Content
    ) {
        self.parameter = parameter
        super.init(rootView: content())
        self.view.backgroundColor = parameter.sheetBackground
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ModalWrapper: PanModalPresentable {
    
    public var panScrollable: UIScrollView? { .none }
    
    public var shortFormHeight: PanModalHeight {
        .contentHeight(self.parameter?.minHeight ?? .infinity)
    }
    
    public var longFormHeight: PanModalHeight {
        .contentHeight(self.parameter?.maxHeight ?? .infinity)
    }
    
    public var showDragIndicator: Bool {
        self.parameter?.hasHandle ?? false
    }
    
    public var springDamping: CGFloat {
        1.0
    }
}

public struct BottomSheetParameter {
    
    let hasHandle: Bool
    let minHeight: CGFloat
    let maxHeight: CGFloat
    let sheetBackground: UIColor
    
    public init(
        hasHandle: Bool = false,
        minHeight: CGFloat = .infinity,
        maxHeight: CGFloat = .infinity,
        sheetBackground: UIColor = .systemBackground
    ) {
        self.hasHandle = hasHandle
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.sheetBackground = sheetBackground
    }
}
#endif

