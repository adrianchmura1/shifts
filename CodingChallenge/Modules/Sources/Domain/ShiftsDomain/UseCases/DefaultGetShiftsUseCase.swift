//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

final class DefaultGetShiftsUseCase: GetShiftsUseCase {
    private let repository: ShiftsRepository

    init(repository: ShiftsRepository) {
        self.repository = repository
    }

    func execute() async throws -> [ShiftDay] {
        try await repository.fetchShifts()
    }
}
