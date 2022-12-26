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
        try await repository.fetchShifts().filter {
            let calendar = Calendar.current
            let date = $0.date
            guard let endOfWeek = calendar.dateInterval(of: .weekOfMonth, for: Date())?.end else {
                fatalError("Failed to calculate end of week for given date")
            }
            return date < endOfWeek
        }
    }
}
