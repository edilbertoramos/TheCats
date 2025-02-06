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
    @Published private(set) var viewState: ViewState?
    
    private(set) var page = 0
    private var cancellables = Set<AnyCancellable>()
    private let service: FeedServiceProtocol
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }
    
    init(service: FeedServiceProtocol = FeedService()) {
        self.service = service
    }
    
    private func getItems() {
        Future<[FeedResult], Error> { [weak self] promise in
            guard let self else { return }
            
            self.viewState = self.page > 0 ? .fetching : .loading
            
            Task {
                do {
                    let response = try await self.service.feed(page: self.page)
                    switch response.result {
                    case .success(let result):
                        promise(.success(result))
                    case .failure(let error):
                        promise(.failure(error))
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
            self?.viewState = .finished
        } receiveValue: { [weak self] results in
            self?.results.append(contentsOf: results)
            self?.viewState = .finished
        }
        .store(in: &cancellables)
    }
    
    func hasReachedEnd(of result: FeedResult) -> Bool {
        results.last?.id == result.id
    }
    
    func reset() {
        page = 0
        results.removeAll()
        errorMessage = nil
    }
    
    func fetchItems() {
        reset()
        getItems()
    }
    
    func fetchNextPage() {
        page += 1
        getItems()
    }
    
}

extension FeedViewModel {
    enum ViewState {
        case fetching
        case loading
        case finished
    }
}
