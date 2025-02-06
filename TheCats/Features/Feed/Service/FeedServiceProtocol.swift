//
//  FeedServiceProtocol.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

protocol FeedServiceProtocol {
    
    func feed(page: Int) async throws -> ServiceResult<[FeedResult]>

}
