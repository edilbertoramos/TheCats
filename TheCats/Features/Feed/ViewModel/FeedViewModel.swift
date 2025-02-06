//
//  FeedViewModel.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    private let service: FeedServiceProtocol

    init(service: FeedServiceProtocol = FeedService()) {
        self.service = service
        Task {
            await getItems()
        }
    }
    
    func getItems() async {
        do {
            let response = try await service.feed(page: 1)
            switch response.result {
            case .success(let result):
                debugPrint(result)
            case .failure(let error):
                debugPrint(error)
            }
        } catch {
            debugPrint(error)
        }
    }
    
}
