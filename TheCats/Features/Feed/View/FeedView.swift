//
//  FeedView.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        Text("FeedView")
    }
}

#Preview {
    FeedView()
}
