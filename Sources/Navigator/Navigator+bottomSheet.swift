//
//  File.swift
//  
//
//  Created by 김인섭 on 12/22/23.
//

import SwiftUI
import PanModal

@MainActor public extension Navigator {

    func bottomSheet(
        _ parameter: BottomSheetParameter = .init(),
        _ build: () -> some View
    ) {
        let controller = build().modalViewController(parameter)
        latestController.presentPanModal(controller)
    }
}
