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
                    LazyVGrid(columns: columns, spacing: 8) {
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
                                .task {
                                    if viewModel.hasReachedEnd(of: result) && !viewModel.isFetching {
                                        viewModel.fetchNextPage()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                    ProgressView()
                        .opacity(viewModel.isLoading || viewModel.isFetching ? 1.0 : 0.0)
                }
            }
            .navigationTitle("The Cats")
            .background(Color.gray.opacity(0.2))
        }
        .onAppear {
            viewModel.fetchItems()
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    FeedView()
}
