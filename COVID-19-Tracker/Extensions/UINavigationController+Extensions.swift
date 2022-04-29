//
//  UINavigationController+Extensions.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 29/04/22.
//

// TODO: Delete this file when SwiftUI has a native way to hide the back button's title.

import UIKit

extension UINavigationController {
    // A hacky way to hide the navigation bar's back button title text in SwiftUI.
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
