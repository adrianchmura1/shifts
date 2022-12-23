//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation
import ShiftsDomain

public final class DataAssembly {
    public init() {}
    
    public var shiftsRepository: ShiftsRepository {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let networkService = DefaultNetworkService(decoder: decoder)
        let restService = DefaultShiftsRestService(networkService: networkService)
        return DefaultShiftsRepository(restService: restService)
    }
}
