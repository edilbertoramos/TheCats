//
//  FeedView.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject private var viewModel = FeedViewModel()
    
    @State private var columns: [GridItem] = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let error = viewModel.errorMessage {
                    Text(error)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.results, id: \.id) { result in
                            NavigationLink(
                                destination: FeedDetailView(
                                    data: FeedDetailData.create(
                                        from: result
                                    )
                                )
                            ) {
                                FeedCardView(
                                    data: FeedCardData.create(of: result)
                                )
                            }
                        }
                    }
                    .padding()
                    
                    ProgressView()
                        .opacity(viewModel.isLoading ? 1.0 : 0.0)
                }
            }
            .navigationTitle("The Cats")
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    FeedView()
}
