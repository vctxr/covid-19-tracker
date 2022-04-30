//
//  WebView.swift
//  COVID-19-Tracker
//
//  Created by Victor Samuel Cuaca on 30/04/22.
//

import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    // MARK: - Variables 📦
    
    let url: URL
    
    // MARK: - Methods ⛓

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariView>) {}
}
