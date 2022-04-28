//
//  ToastState.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 28/04/22.
//

import AlertToast

struct ToastState: Equatable {
    let title: String?
    let subtitle: String?
    let style: AlertToast.AlertStyle?
        
    init(
        title: String? = nil,
        subtitle: String? = nil,
        style: AlertToast.AlertStyle? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.style = style
    }
}
