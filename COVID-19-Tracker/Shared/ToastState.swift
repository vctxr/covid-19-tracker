//
//  ToastState.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 28/04/22.
//

import AlertToast

struct ToastState: Equatable {
    let mode: AlertToast.DisplayMode
    let type: AlertToast.AlertType
    let title: String?
    let subtitle: String?
    let style: AlertToast.AlertStyle?
        
    init(
        mode: AlertToast.DisplayMode,
        type: AlertToast.AlertType,
        title: String? = nil,
        subtitle: String? = nil,
        style: AlertToast.AlertStyle? = nil
    ) {
        self.mode = mode
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.style = style
    }
}
