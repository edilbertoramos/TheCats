//
//  FeedService.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

final class FeedService: FeedServiceProtocol {
    
    private enum EndPoint: String, ServiceEndpoint {
        case feed = "images/search"
    }
    
    func feed(page: Int) async throws -> ServiceResult<[FeedResult]> {
        let url = try ServiceHelper.makeUrl(withEndPoint: EndPoint.feed)
        
        var parameters = [String: Any]()
        parameters["mime_types"] = "jpg"
        parameters["format"] = "json"
        parameters["has_breeds"] = true
        parameters["order"] = "RANDOM"
        parameters["limit"] = 10
        parameters["page"] = page

        return try await ServiceHelper.get(
            url: url,
            parameters: parameters,
            headers: ServiceHeaders.authenticatedHeaders
        )
    }
    
}
