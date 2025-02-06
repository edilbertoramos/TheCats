//
//  FeedViewModel.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    
    @Published var results: [FeedResult] = [FeedResult]()
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let service: FeedServiceProtocol

    init(service: FeedServiceProtocol = FeedService()) {
        self.service = service
        getItems()
    }
    
    func getItems() {
        Future<[FeedResult], Error> { [weak self] promise in
            self?.isLoading = true
            Task {
                do {
                    let response = try await self?.service.feed(page: 1)
                    switch response?.result {
                    case .success(let result):
                        promise(.success(result))
                    case .failure(let error):
                        promise(.failure(error))
                    case .none:
                        break
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                debugPrint(error)
            case .finished:
                break
            }
            self?.isLoading = false
        } receiveValue: { [weak self] results in
            self?.results = results
            self?.isLoading = false
        }
        .store(in: &cancellables)
    }
    
}
