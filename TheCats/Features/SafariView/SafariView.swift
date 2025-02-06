//
//  SafariView.swift
//  TheCats
//
//  Created by Edilberto Ramos on 06/02/25.
//

import SwiftUI
import SafariServices

struct SafariView: View {
    let url: URL

    var body: some View {
        SafariViewController(url: url)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SafariViewController: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
