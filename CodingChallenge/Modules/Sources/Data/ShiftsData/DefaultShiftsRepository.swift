//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import ShiftsDomain

public final class DefaultShiftsRepository: ShiftsRepository {
    private let restService: ShiftsRestService

    init(restService: ShiftsRestService) {
        self.restService = restService
    }

    public func fetchShifts() async throws -> [ShiftDay] {
        try await restService.shifts()
    }
}
