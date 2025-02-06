//
//  ServiceResult.swift
//  TheCats
//
//  Created by Edilberto Ramos on 05/02/25.
//

import Foundation

public typealias ServiceResult<T> = (data: Data, result: Result<T, ServiceError>)
